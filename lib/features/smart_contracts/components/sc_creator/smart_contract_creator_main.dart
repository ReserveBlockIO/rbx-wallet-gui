import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/sc_property/components/properties_manager.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/dialogs.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../core/providers/web_session_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../utils/toast.dart';
import '../../../encrypt/utils.dart';
import '../../../nft/providers/nft_detail_provider.dart';
import '../../models/compiled_smart_contract.dart';
import '../../models/smart_contract.dart';
import '../../providers/create_smart_contract_provider.dart';
import '../../providers/draft_smart_contracts_provider.dart';
import 'common/help_button.dart';
import 'form_groups/basic_properties_form_group.dart';
import 'form_groups/features_form_group.dart';
import 'form_groups/primary_asset_form_group.dart';

class SmartContractCreatorMain extends BaseComponent {
  const SmartContractCreatorMain({Key? key}) : super(key: key);

  void mintedComplete(
    String? id,
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (id != null) {
      ref.read(nftDetailProvider(id).notifier).init();
    }
    ref.read(createSmartContractProvider.notifier).clearSmartContract();

    await InfoDialog.show(
      title: "Stand by",
      body:
          "Smart Contract mint transaction has been broadcasted.\n\nThe NFTs screen will reflect the change once the block is crafted and block height has synced with this transaction.",
    );

    // Future.delayed(const Duration(milliseconds: 300)).then((_) {
    AutoRouter.of(context).pop(id);
    // });
  }

  Future<void> compileAndMint(BuildContext context, WidgetRef ref) async {
    final _provider = ref.read(createSmartContractProvider.notifier);
    _provider.preSave();

    final errors = _provider.isValidForCompile();
    if (errors.isNotEmpty) {
      InfoDialog.show(
        title: "Invalid Smart Contract",
        body: errors.join("\n"),
        closeText: "Okay",
      );

      return;
    }

    if (_provider.shouldWarnEvo) {
      final shouldContinue = await ConfirmDialog.show(
        title: "Evolve stage(s) in the past",
        body: "One or more of your evolve stages will have already evolved at the time of minting.\n\nAre your sure you want to proceed?",
        confirmText: "Continue",
        cancelText: "Cancel",
      );
      if (shouldContinue != true) {
        return;
      }
    }

    if (!kIsWeb) {
      if (ref.read(sessionProvider).currentWallet!.balance < MIN_RBX_FOR_SC_ACTION) {
        Toast.error("Not enough RBX balance to mint a smart contract.");
        return;
      }
    }

    if (kIsWeb) {
      if (ref.read(webSessionProvider).currentWallet == null) {
        Toast.error("No wallet");
        return;
      }
    }

    int? amountInt = 1;

    if (!kIsWeb) {
      // final amount = await PromptModal.show(
      //   title: "Quantity",
      //   body: "How many copies of this smart contract would you like to mint?",
      //   validator: (value) => formValidatorInteger(value, "Quantity"),
      //   labelText: "Quantity",
      //   initialValue: "1",
      //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      // );

      // if (amount == null) {
      //   return;
      // }

      // amountInt = int.tryParse(amount);

      if (amountInt < 1) {
        return;
      }

      if (amountInt > MAX_COMPILE_QUANTITY) {
        Toast.error("The maxium number you can mint at one time is $MAX_COMPILE_QUANTITY.");
        return;
      }
    }

    final confirmed = await ConfirmDialog.show(
      title: "Compile & Mint Smart Contract?",
      body:
          "Are you sure you want to proceed?\nOnce compiled you will not be able to make any changes\nand the smart contract will be deployed to the chain.",
      confirmText: "Continue",
      cancelText: "Cancel",
    );

    if (confirmed == true) {
      final extraConfirm = await ConfirmDialog.show(
        title: "Confirm Address",
        body:
            "This will be minted by ${kIsWeb ? ref.read(webSessionProvider).currentWallet!.labelWithoutTruncation : ref.read(sessionProvider).currentWallet!.labelWithoutTruncation}",
        confirmText: "Compile & Mint",
        cancelText: "Cancel",
      );

      if (extraConfirm != true) {
        return;
      }

      if (!kIsWeb) {
        ref.read(sessionProvider.notifier).setIsMintingOrCompiling(true);
      }

      final compileAnimation = Completer<BuildContext>();
      _provider.showCompileAnimation(context, compileAnimation);
      final dialogContext = await compileAnimation.future;

      if (kIsWeb) {
        final success = await ref.read(createSmartContractProvider.notifier).compileAndMintForWeb();

        if (success) {
          await Future.delayed(const Duration(seconds: 3));
          Navigator.pop(dialogContext);
          final completeAnimation = Completer<BuildContext>();
          _provider.showCompileComplete(context, completeAnimation);
          final completedDialogContext = await completeAnimation.future;
          await Future.delayed(const Duration(seconds: 3));
          Navigator.pop(completedDialogContext);
          Toast.message("Smart Contract minted successfully.");

          mintedComplete(null, context, ref);
        } else {
          Navigator.pop(dialogContext);

          Toast.error("A problem occurred minting this smart contract.");
        }
      } else {
        try {
          CompiledSmartContract? sc;

          for (var i = 0; i < amountInt; i++) {
            final _sc = await ref.read(createSmartContractProvider.notifier).compile();
            if (i == 0) {
              sc = _sc;
            }
          }

          if (sc != null) {
            bool success = false;
            for (var i = 0; i < amountInt; i++) {
              final _success = await ref.read(createSmartContractProvider.notifier).mint();
              if (i == 0) {
                success = _success;
              }
            }

            if (success) {
              await Future.delayed(const Duration(seconds: 3));
              Navigator.pop(dialogContext);
              final completeAnimation = Completer<BuildContext>();
              _provider.showCompileComplete(context, completeAnimation);
              final completedDialogContext = await completeAnimation.future;
              await Future.delayed(const Duration(seconds: 3));
              Navigator.pop(completedDialogContext);
              Toast.message("Mint transaction sent successfully. Please wait until the the smart contract is minted on-chain.");

              mintedComplete(sc.id, context, ref);
            } else {
              Navigator.pop(dialogContext);
              if (!kIsWeb) {
                ref.read(sessionProvider.notifier).setIsMintingOrCompiling(false);
              }

              Toast.error("A problem occurred minting this smart contract.");
            }
          } else {
            Navigator.pop(dialogContext);
            if (!kIsWeb) {
              ref.read(sessionProvider.notifier).setIsMintingOrCompiling(false);
            }

            Toast.error("A problem occurred compiling this smart contract.");
          }
        } catch (e) {
          Navigator.pop(dialogContext);

          print(e);
          if (!kIsWeb) {
            ref.read(sessionProvider.notifier).setIsMintingOrCompiling(false);
          }
        }
      }
    }
    if (!kIsWeb) {
      ref.read(sessionProvider.notifier).setIsMintingOrCompiling(false);
    }
  }

  Future<void> delete(BuildContext context, WidgetRef ref) async {
    final _provider = ref.read(createSmartContractProvider.notifier);

    final confirmed = await ConfirmDialog.show(
      title: "Delete Draft",
      body: "Are you sure you wan't to delete this smart contract draft?",
      destructive: true,
      confirmText: "Delete",
      cancelText: "Cancel",
    );

    if (confirmed != true) {
      return;
    }

    _provider.deleteDraft();
    ref.read(draftsSmartContractProvider.notifier).load();

    Toast.message("Draft Delete");

    AutoRouter.of(context).pop();
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BasicPropertiesFormGroup(),
                Row(
                  children: const [
                    Expanded(child: PrimaryAssetFormGroup()),
                  ],
                ),
                const FeaturesFormGroup(),
                const PropertiesManager(),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF040f26),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: buildCompileButton(ref, _model, context)),
          ),
        ),
      ],
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BasicPropertiesFormGroup(),
                const FeaturesFormGroup(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: PropertiesManager()),
                    const Expanded(child: PrimaryAssetFormGroup()),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF040f26),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildSaveButton(_model, ref),
                buildCompileButton(ref, _model, context),
                if (!_model.isCompiled) buildDeleteButton(_model, context, ref),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDeleteButton(SmartContract _model, BuildContext context, WidgetRef ref) {
    if (kIsWeb) return const SizedBox();
    return AppButton(
      label: "Delete",
      helpType: HelpType.delete,
      onPressed: _model.isCompiled
          ? null
          : () {
              delete(context, ref);
            },
      icon: Icons.delete,
      variant: AppColorVariant.Danger,
    );
  }

  AppButton buildCompileButton(WidgetRef ref, SmartContract _model, BuildContext context) {
    return AppButton(
      label: "Compile & Mint",
      helpType: HelpType.compile,
      variant: AppColorVariant.Success,
      disabled: ref.watch(sessionProvider).isMintingOrCompiling,
      onPressed: _model.isPublished
          ? null
          : () async {
              if (!await passwordRequiredGuard(context, ref)) return;
              compileAndMint(context, ref);
            },
      icon: Icons.computer,
    );
  }

  Widget buildSaveButton(SmartContract _model, WidgetRef ref) {
    if (kIsWeb) return const SizedBox();
    return AppButton(
      label: "Save as Draft",
      onPressed: _model.isCompiled
          ? null
          : () {
              ref.read(createSmartContractProvider.notifier).saveDraft();
              Toast.message("Draft saved!");
            },
      icon: Icons.save,
      helpType: HelpType.saveAsDraft,
    );
  }
}
