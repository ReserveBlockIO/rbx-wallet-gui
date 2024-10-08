import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/compile_animation.dart';
import 'package:rbx_wallet/features/smart_contracts/models/multi_asset.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/services/explorer_service.dart';
import '../../nft/providers/nft_list_provider.dart';
import '../../raw/raw_service.dart';
import '../../wallet/models/wallet.dart';

part 'tokenize_btc_form_provider.freezed.dart';

@freezed
abstract class TokenizeBtcFormState with _$TokenizeBtcFormState {
  const TokenizeBtcFormState._();

  factory TokenizeBtcFormState({
    @Default(false) bool isProcessing,
    Asset? asset,
    String? vfxAddress,
    @Default([]) List<Asset> additionalAssets,
    String? imageBase64,
  }) = _TokenizeBtcFormState;
}

class TokenizeBtcFormProvider extends StateNotifier<TokenizeBtcFormState> {
  final Ref ref;
  TokenizeBtcFormProvider(this.ref) : super(TokenizeBtcFormState());

  final formKey = GlobalKey<FormState>();

  final tokenNameController = TextEditingController();
  final tokenDescriptionController = TextEditingController();

  setAsset(Asset? asset) {
    state = state.copyWith(asset: asset);
  }

  setImageBase64(String? imageBase64) {
    state = state.copyWith(imageBase64: imageBase64);
  }

  setAddress(String address) {
    state = state.copyWith(vfxAddress: address);
  }

  addAdditonalAsset(Asset asset) {
    state = state.copyWith(additionalAssets: [
      ...state.additionalAssets,
      asset,
    ]);
  }

  replaceAdditionalAsset(int index, Asset asset) {
    state = state.copyWith(
      additionalAssets: [...state.additionalAssets]
        ..removeAt(index)
        ..insert(index, asset),
    );
  }

  removeAdditionalAsset(int index) {
    state = state.copyWith(additionalAssets: [...state.additionalAssets]..removeAt(index));
  }

  void showCompileAnimation(
    BuildContext context,
    Completer<BuildContext> completer, [
    bool mint = false,
  ]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.transparent,
      builder: (dialogContext) {
        if (!completer.isCompleted) {
          completer.complete(dialogContext);
        }
        return Center(
            child: CompileAnimation(
          mint,
          btc: true,
        ));
      },
    );
  }

  void showCompileComplete(
    BuildContext context,
    Completer<BuildContext> completer, [
    bool mint = false,
  ]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.transparent,
      builder: (dialogContext) {
        if (!completer.isCompleted) {
          completer.complete(dialogContext);
        }
        return Center(
            child: CompileAnimationComplete(
          mint,
          btc: true,
        ));
      },
    );
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    if (state.vfxAddress == null) {
      Toast.error("A VFX account with a balance is required to proceed.");
      return null;
    }

    final assetLocation = state.asset?.location;

    state = state.copyWith(isProcessing: true);

    String? tokenName = tokenNameController.text.trim();
    String? tokenDescription = tokenDescriptionController.text.trim();

    if (tokenName.isEmpty) {
      tokenName = null;
    }

    if (tokenDescription.isEmpty) {
      tokenDescription = null;
    }

    final hash = await BtcService().tokenizeBtc(
      rbxAddress: state.vfxAddress!,
      fileLocation: assetLocation,
      name: tokenName,
      description: tokenDescription,
      multiAsset: state.additionalAssets.isNotEmpty ? MultiAsset(assets: state.additionalAssets) : null,
    );

    state = state.copyWith(isProcessing: false);
    if (hash != null) {
      Toast.message("Transaction Broadcasted with hash of $hash");
      ref.read(logProvider.notifier).append(
            LogEntry(
              message: "BTC Tokenization Transaction Broadcasted with hash of $hash",
              textToCopy: hash,
              variant: AppColorVariant.Btc,
            ),
          );
      clear();
      return true;
    }

    return false;
  }

  Future<bool?> submitWeb() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    final keypair = ref.read(webSessionProvider).keypair;
    if (keypair == null) {
      Toast.error("A VFX account is required to proceed.");
      return null;
    }

    final balance = ref.read(webSessionProvider).balance;
    if (balance == null || balance < MIN_RBX_FOR_SC_ACTION) {
      Toast.error("A VFX account with a balance is required to proceed.");
      return null;
    }

    //TODO: handle multiasset

    // if (multiAsset != null) {
    //   final List<Map<String, dynamic>> features = [];
    //   final f = {'FeatureName': MultiAsset.compilerEnum, 'FeatureFeatures': multiAsset.serializeForCompiler(rbxAddress)};
    //   features.add(f);

    //   params['Features'] = features;
    // }

    state = state.copyWith(isProcessing: true);

    String? tokenName = tokenNameController.text.trim();
    String? tokenDescription = tokenDescriptionController.text.trim();

    if (tokenName.isEmpty) {
      tokenName = null;
    }

    if (tokenDescription.isEmpty) {
      tokenDescription = null;
    }

    //TODO: build verify and broadcast TX

    final vbtcExtraData = await ExplorerService().vbtcCompileData(keypair.address);
    if (vbtcExtraData == null) {
      Toast.error("Could not connect to arbiter. Try again later");
      return false;
    }

    // if (state.imageBase64 == null) {
    //   final imageData = await ExplorerService().vbtcDefaultImageData();
    //   state = state.copyWith(imageBase64: imageData);
    // }

    final sc = SmartContract(
      id: vbtcExtraData.smartContractUID,
      owner: Wallet.fromWebWallet(keypair: keypair, balance: balance),
      name: tokenName ?? "vBTC Token",
      description: tokenDescription ?? "vBTC Token",
      minterName: keypair.address,
      primaryAsset: state.asset ??
          Asset(
            id: '00000000-0000-0000-0000-000000000000',
            location: 'default',
            extension: 'png',
            authorName: 'VerifiedX',
            fileSize: 6778,
            name: "vBTC Token",
          ),
    );

    final timezoneName = ref.read(webSessionProvider).timezoneName;
    final payload = sc.serializeForCompiler(timezoneName);

    final updatedPayload = {
      ...payload,
      'Features': [
        ...payload['Features'],
        {
          'FeatureName': 3,
          'FeatureFeatures': {
            'AssetName': "Bitcoin",
            'AssetTicker': 'BTC',
            'DepositAddress': vbtcExtraData.depositAddress,
            'PublicKeyProofs': vbtcExtraData.publicKeyProofs,
            'ImageBase': state.imageBase64 ?? 'default',
          },
        },
      ]
    };

    final success = await RawService().compileAndMintSmartContract(updatedPayload, keypair, ref);

    state = state.copyWith(isProcessing: false);
    if (success == true) {
      ref.read(nftListProvider.notifier).reloadCurrentPage(address: ref.read(webSessionProvider).keypair?.address);
      return true;
    }
    return false;
  }

  void clear() {
    state = TokenizeBtcFormState();
    tokenNameController.clear();
    tokenDescriptionController.clear();
  }
}

final tokenizeBtcFormProvider = StateNotifierProvider<TokenizeBtcFormProvider, TokenizeBtcFormState>((ref) {
  return TokenizeBtcFormProvider(ref);
});
