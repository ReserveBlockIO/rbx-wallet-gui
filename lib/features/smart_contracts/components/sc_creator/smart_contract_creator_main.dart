import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/colors.dart';
import '../../../sc_property/models/sc_property.dart';
import '../../../../core/theme/components.dart';
import '../../../sc_property/components/properties_manager.dart';

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
        Toast.error("Not enough VFX balance to mint a smart contract.");
        return;
      }
    }

    if (kIsWeb) {
      if (ref.read(webSessionProvider).currentWallet == null) {
        Toast.error("No account");
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

    if (!kIsWeb) {
      final String? backupUrl = await PromptModal.show(
        contextOverride: context,
        title: "Backup URL (Optional)",
        body: "Paste in a public URL to a hosted zipfile containing the assets.",
        validator: (value) {
          return null;
        },
        labelText: "URL (Optional)",
        confirmText: "Continue",
      );

      if (backupUrl != null) {
        ref.read(createSmartContractProvider.notifier).addProperty(
              ScProperty(
                name: BACKUP_URL_PROPERTY_NAME,
                value: backupUrl,
              ),
            );
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
                Row(
                  children: const [
                    Expanded(child: PrimaryAssetFormGroup()),
                  ],
                ),
                const PropertiesManager(),
                const FeaturesFormGroup(),
              ],
            ),
          ),
        ),
        AppCard(
          padding: 0,
          color: AppColors.getGray(ColorShade.s300),
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

    return AppCard(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BasicPropertiesFormGroup(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(child: PropertiesManager()),
                      const Expanded(child: PrimaryAssetFormGroup()),
                    ],
                  ),
                  const FeaturesFormGroup(),
                ],
              ),
            ),
          ),
          AppCard(
            padding: 0,
            color: AppColors.getGray(ColorShade.s300),
            fullWidth: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // buildSaveButton(_model, ref),
                  buildCompileButton(ref, _model, context),
                  // if (!_model.isCompiled) buildDeleteButton(_model, context, ref),
                ],
              ),
            ),
          ),
        ],
      ),
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

  Widget buildCompileButton(WidgetRef ref, SmartContract _model, BuildContext context) {
    final disabled = ref.watch(sessionProvider.select((v) => v.isMintingOrCompiling));
    bool hovering = false;

    return StatefulBuilder(builder: (context, setState) {
      return MouseRegion(
        onEnter: (_) {
          setState(() {
            hovering = true;
          });
        },
        onExit: (_) {
          setState(() {
            hovering = false;
          });
        },
        child: InkWell(
          onTap: disabled || _model.isPublished
              ? null
              : () async {
                  if (!await passwordRequiredGuard(context, ref)) return;
                  compileAndMint(context, ref);
                },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: disabled ? Colors.white54 : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: Theme.of(context).colorScheme.secondary.withOpacity(hovering ? 0.5 : 0.3), width: 1),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.secondary.withOpacity(hovering ? 0.3 : 0.5),
                  Theme.of(context).colorScheme.secondary.withOpacity(hovering ? 0.1 : 0.3),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 8,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12).copyWith(top: 9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(0, -2),
                    child: Icon(
                      FontAwesomeIcons.gear,
                      size: 16,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Compile & Mint",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mukta',
                      height: 1,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
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
