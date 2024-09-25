import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/providers/transferred_provider.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

import '../../core/dialogs.dart';
import '../asset/asset.dart';
import '../encrypt/utils.dart';
import '../smart_contracts/features/evolve/evolve_phase.dart';
import '../smart_contracts/models/feature.dart';
import '../smart_contracts/services/smart_contract_service.dart';
import 'models/nft.dart';
import 'package:collection/collection.dart';

Future<Nft> setAssetPath(Nft nft) async {
  final assetPath = await SmartContractService().getAssetPath(nft.id, nft.primaryAsset.fileName);

  if (assetPath != null) {
    final a = nft.primaryAsset.copyWith(localPath: assetPath);
    nft = nft.copyWith(primaryAsset: a);
  }

  final List<Asset> additionalAssets = [];

  for (final a in nft.additionalAssets) {
    final path = await SmartContractService().getAssetPath(nft.id, a.fileName);
    additionalAssets.add(a.copyWith(localPath: path));
  }

  nft = nft.copyWith(additionalLocalAssets: additionalAssets);

  for (final f in nft.featureList) {
    if (f.type == FeatureType.evolution) {
      final List<EvolvePhase> stages = [];
      for (final stage in nft.evolutionPhases) {
        if (stage.asset != null) {
          final p = await SmartContractService().getAssetPath(nft.id, stage.asset!.fileName);
          final a = stage.asset!.copyWith(localPath: p);
          stages.add(stage.copyWith(asset: a));
        } else {
          stages.add(stage);
        }
      }
      nft = nft.copyWith(updatedEvolutionPhases: stages);
    }
  }

  return nft;
}

Future<dynamic> initTransferNftProcess(
  BuildContext context,
  WidgetRef ref,
  Nft nft, {
  bool backupRequired = false,
  String? titleOverride,
  bool isToken = false,
  String? prefillAddress,
}) async {
  final id = nft.id;

  final _provider = ref.read(nftDetailProvider(id).notifier);

  String? reservePassword;
  int? delayHours;
  String? fromAddress;

  if (nft.isListed(ref)) {
    Toast.error("This ${isToken ? 'Token' : 'NFT'} is listed in your auction house. Please remove the listing before transferring.");
    return;
  }

  if (!kIsWeb) {
    if (!await passwordRequiredGuard(context, ref)) {
      return;
    }

    Wallet? wallet = ref.read(walletListProvider).firstWhereOrNull((w) => w.address == nft.currentOwner);
    if (wallet == null) {
      Toast.error("No account selected");
      return;
    }

    fromAddress = wallet.address;

    if (wallet.balance < MIN_RBX_FOR_SC_ACTION) {
      Toast.error("Not enough balance for transaction");
      return;
    }

    final _nft = await setAssetPath(nft);

    final filesReady = await _nft.areFilesReady();

    if (!filesReady) {
      Toast.error("Media files not found on this machine.");
      return;
    }
    if (wallet.isReserved) {
      reservePassword = await PromptModal.show(
        title: "Vault Account Password",
        validator: (_) => null,
        labelText: "Password",
        lines: 1,
        obscureText: true,
      );
      if (reservePassword == null) {
        return;
      }

      final hoursString = await PromptModal.show(
        title: "Timelock Duration",
        validator: (_) => null,
        labelText: "Hours (24 Minimum)",
        initialValue: "24",
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      );

      delayHours = (hoursString != null ? int.tryParse(hoursString) : 24) ?? 24;
      if (delayHours < 24) {
        delayHours = 24;
      }
    }
  }

  if (kIsWeb && ref.read(webSessionProvider).usingRa) {
    final hoursString = await PromptModal.show(
      title: "Timelock Duration",
      validator: (_) => null,
      labelText: "Hours (24 Minimum)",
      initialValue: "24",
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );

    delayHours = (hoursString != null ? int.tryParse(hoursString) : 24) ?? 24;
    if (delayHours < 24) {
      delayHours = 24;
    }
  }

  PromptModal.show(
    contextOverride: context,
    initialValue: prefillAddress ?? '',
    title: titleOverride ?? "Transfer ${isToken ? 'Token' : 'NFT'}",
    validator: (value) => formValidatorRbxAddress(value, true),
    labelText: "VFX Address",
    confirmText: "Continue",
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9.]')),
    ],
    lines: 1,
    onValidSubmission: (address) async {
      bool? success;

      address = address.trim().replaceAll("\n", "");

      if (kIsWeb) {
        ref.read(globalLoadingProvider.notifier).start();
        success = await _provider.transferWebOut(address, delayHours);
        if (success == true) {
          ref.read(transferredProvider.notifier).addId(id);

          Toast.message("${isToken ? 'Token' : 'NFT'} Transfer sent successfully to $address!");
          Navigator.of(context).pop();
        } else {
          Toast.error();
        }
        ref.read(globalLoadingProvider.notifier).complete();
      } else {
        final isValid = await BridgeService().validateSendToAddress(address);
        if (!isValid) {
          Toast.error("Invalid Address");
          return;
        }

        PromptModal.show(
          contextOverride: context,
          title: "Backup URL ${backupRequired ? '' : '(Optional)'}",
          body: "Paste in a public URL to a hosted zipfile containing the assets.",
          validator: (value) {
            if (backupRequired) {
              if (value == null || value.trim().isEmpty) {
                return "Backup URL required";
              }
              return null;
            }
            return null;
          },
          labelText: "URL ${backupRequired ? '' : '(Optional)'}",
          confirmText: "Transfer",
          onValidSubmission: (url) async {
            final confirmed = await ConfirmDialog.show(
              title: "Confirm Transfer",
              body:
                  "Please confirm you want to send the ${isToken ? 'Token' : 'NFT'} to \"$address\".${reservePassword == null ? '\n\nIf this address is not correct, there will be no way to recover the ownership of the ${isToken ? 'Token' : 'NFT'}.' : ''}",
              confirmText: "Send",
            );

            if (confirmed == true) {
              final success = reservePassword != null
                  ? await _provider.transferFromReserveAccount(
                      toAddress: address,
                      fromAddress: fromAddress!,
                      password: reservePassword,
                      backupUrl: url,
                      delayHours: delayHours!,
                      isToken: isToken)
                  : await _provider.transfer(address, url, isToken);

              if (!success) {
                return;
              }

              await InfoDialog.show(
                title: "Transfer in Progress",
                body:
                    "Please ensure to keep your wallet open until this ${isToken ? 'Token' : 'NFT'} transfer transaction appears in your transaction list.\n\nTo monitor the asset transfer progress, open your 'sclog.txt' in your databases folder.",
                closeText: "Okay",
              );

              Navigator.of(context).pop();
            }
          },
        );
      }
    },
  );
}
