import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/basic_properties_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/features_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/primary_asset_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/draft_smart_contracts_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class SmartContractCreatorMain extends BaseComponent {
  const SmartContractCreatorMain({Key? key}) : super(key: key);

  void mintedComplete(
    String id,
    BuildContext context,
    WidgetRef ref,
  ) {
    print('completed');
    // final tabsRouter = AutoTabsRouter.of(context);
    // tabsRouter.setActiveIndex(6);

    // Future.delayed(Duration(milliseconds: 300)).then((value) {
    // Navigator.of(context).pop();
    // Navigator.of(context).pop();

    // AutoRouter.of(context).popAndPush(NftDetailScreen(id))
    ref.read(nftDetailProvider(id).notifier).init();
    ref.read(createSmartContractProvider.notifier).clearSmartContract();

    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      AutoRouter.of(context).pop(id);
    });

    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return NftDetailScreen(id, fromCreator: true);
    //     },
    //   ),
    // );
    // });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(createSmartContractProvider.notifier);
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
                    // Expanded(child: ThumbnailAssetFormGroup()),
                  ],
                ),
                const FeaturesFormGroup(),
                // Row(
                //   children: [
                //     Expanded(child: RaritiesFormGroup()),
                //     Expanded(child: StatsFormGroup()),
                //   ],
                // ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // AppButton(
                //   label: "View Code",
                //   onPressed: _model.code.isNotEmpty
                //       ? () {
                //           showModalBottomSheet(
                //             context: context,
                //             builder: (context) {
                //               return CodeModal(_model.code);
                //             },
                //           );
                //         }
                //       : null,
                //   icon: Icons.code,
                // ),
                AppButton(
                  label: "Save as Draft",
                  onPressed: _model.isCompiled
                      ? null
                      : () {
                          ref
                              .read(createSmartContractProvider.notifier)
                              .saveDraft();
                          Toast.message("Draft saved!");
                        },
                  icon: Icons.save,
                  helpType: HelpType.saveAsDraft,
                ),
                // if (!_model.isCompiled)
                AppButton(
                  label: "Compile & Mint",
                  helpType: HelpType.compile,
                  disabled: ref.watch(sessionProvider).isMintingOrCompiling,
                  onPressed: _model.isPublished
                      ? null
                      : () async {
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

                          final confirmed = await ConfirmDialog.show(
                            title: "Compile & Mint Smart Contract?",
                            body:
                                "Are you sure you want to proceed?\nOnce compiled you will not be able to make any changes and the smart contract will be deployed to the chain.",
                            confirmText: "Compile & Mint",
                            cancelText: "Cancel",
                          );

                          if (confirmed == true) {
                            ref
                                .read(sessionProvider.notifier)
                                .setIsMintingOrCompiling(true);

                            final compileAnimation = Completer<BuildContext>();
                            _provider.showCompileAnimation(
                                context, compileAnimation);
                            final dialogContext = await compileAnimation.future;

                            try {
                              final sc = await ref
                                  .read(createSmartContractProvider.notifier)
                                  .compile();

                              if (sc != null) {
                                final success = await ref
                                    .read(createSmartContractProvider.notifier)
                                    .mint();

                                if (success) {
                                  await Future.delayed(const Duration(seconds: 3));
                                  Navigator.pop(dialogContext);
                                  final completeAnimation =
                                      Completer<BuildContext>();
                                  _provider.showCompileComplete(
                                      context, completeAnimation);
                                  final completedDialogContext =
                                      await completeAnimation.future;
                                  await Future.delayed(const Duration(seconds: 3));
                                  Navigator.pop(completedDialogContext);
                                  Toast.message(
                                      "Smart Contract minted successfully.");

                                  mintedComplete(sc.id, context, ref);
                                } else {
                                  Navigator.pop(dialogContext);

                                  Toast.error(
                                      "A problem occurred minting this smart contract.");
                                }
                              } else {
                                Navigator.pop(dialogContext);

                                Toast.error(
                                    "A problem occurred compiling this smart contract.");
                              }
                            } catch (e) {
                              Navigator.pop(dialogContext);

                              print(e);
                              ref
                                  .read(sessionProvider.notifier)
                                  .setIsMintingOrCompiling(false);
                            }
                          }
                          ref
                              .read(sessionProvider.notifier)
                              .setIsMintingOrCompiling(false);
                        },
                  icon: Icons.computer,
                ),
                // if (_model.isCompiled)
                //   AppButton(
                //     label: "Mint",
                //     helpType: HelpType.mint,
                //     disabled: ref.watch(sessionProvider).isMintingOrCompiling,
                //     onPressed: _model.isPublished
                //         ? null
                //         : () async {
                //             ref
                //                 .read(sessionProvider.notifier)
                //                 .setIsMintingOrCompiling(true);
                //             final confirmed = await ConfirmDialog.show(
                //               title: "Mint Smart Contract?",
                //               body:
                //                   "Are you sure you want to mint this smart contract on the chain?",
                //               confirmText: "Mint",
                //               cancelText: "Cancel",
                //             );

                //             if (confirmed == true) {
                //               try {
                //                 final success = await ref
                //                     .read(createSmartContractProvider.notifier)
                //                     .mint();

                //                 if (success) {
                //                   final compileAnimation =
                //                       Completer<BuildContext>();
                //                   _provider.showCompileAnimation(
                //                       context, compileAnimation, true);
                //                   await Future.delayed(Duration(seconds: 3));
                //                   final dialogContext =
                //                       await compileAnimation.future;
                //                   Navigator.pop(dialogContext);
                //                   final completeAnimation =
                //                       Completer<BuildContext>();
                //                   _provider.showCompileComplete(
                //                       context, completeAnimation, true);
                //                   final completedDialogContext =
                //                       await completeAnimation.future;
                //                   await Future.delayed(Duration(seconds: 3));
                //                   Navigator.pop(completedDialogContext);
                //                   Toast.message(
                //                       "Smart Contract minted successfully.");
                //                 }
                //               } catch (e) {
                //                 print(e);
                //                 ref
                //                     .read(sessionProvider.notifier)
                //                     .setIsMintingOrCompiling(false);
                //               }
                //             }
                //             ref
                //                 .read(sessionProvider.notifier)
                //                 .setIsMintingOrCompiling(false);
                //           },
                //     icon: Icons.publish,
                //   ),
                // AppButton(
                //   label: "Publish to Library",
                //   onPressed: () {},
                //   icon: Icons.publish,
                // ),
                if (!_model.isCompiled)
                  AppButton(
                    label: "Delete",
                    helpType: HelpType.delete,
                    onPressed: _model.isCompiled
                        ? null
                        : () async {
                            final confirmed = await ConfirmDialog.show(
                              title: "Delete Draft",
                              body:
                                  "Are you sure you wan't to delete this smart contract draft?",
                              destructive: true,
                              confirmText: "Delete",
                              cancelText: "Cancel",
                            );

                            if (!confirmed) {
                              return;
                            }

                            _provider.deleteDraft();
                            ref
                                .read(draftsSmartContractProvider.notifier)
                                .load();

                            Toast.message("Draft Delete");

                            AutoRouter.of(context).pop();
                          },
                    icon: Icons.delete,
                    variant: AppColorVariant.Danger,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
