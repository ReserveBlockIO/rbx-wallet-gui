import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/basic_properties_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/features_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/primary_asset_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/modals/code_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class SmartContractCreatorMain extends BaseComponent {
  const SmartContractCreatorMain({Key? key}) : super(key: key);

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
                BasicPropertiesFormGroup(),
                Row(
                  children: [
                    Expanded(child: PrimaryAssetFormGroup()),
                    // Expanded(child: ThumbnailAssetFormGroup()),
                  ],
                ),
                FeaturesFormGroup(),
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
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: AppButton(
        //     label: "Compile Test Button",
        //     onPressed: () async {
        //       final compileAnimation = Completer<BuildContext>();
        //       _provider.showCompileAnimation(context, compileAnimation);
        //       final dialogContext = await compileAnimation.future;
        //       await Future.delayed(Duration(seconds: 5));
        //       Navigator.pop(dialogContext);

        //       // await Future.delayed(Duration(milliseconds: 150));

        //       final completeAnimation = Completer<BuildContext>();
        //       _provider.showCompileComplete(context, completeAnimation);
        //       final completedDialogContext = await completeAnimation.future;
        //       await Future.delayed(Duration(seconds: 3));
        //       Navigator.pop(completedDialogContext);
        //     },
        //   ),
        // ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  label: "View Code",
                  onPressed: _model.code.isNotEmpty
                      ? () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return CodeModal(_model.code);
                            },
                          );
                        }
                      : null,
                  icon: Icons.code,
                ),
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
                if (!_model.isCompiled)
                  AppButton(
                    label: "Compile",
                    helpType: HelpType.compile,
                    onPressed: () async {
                      final confirmed = await ConfirmDialog.show(
                        title: "Compile Smart Contract?",
                        body:
                            "Are you sure you want to proceed?\nOnce compiled you will not be able to make any changes.",
                        confirmText: "Compile",
                        cancelText: "Cancel",
                      );

                      if (confirmed == true) {
                        final sc = await ref
                            .read(createSmartContractProvider.notifier)
                            .compile();

                        if (sc != null) {
                          final compileAnimation = Completer<BuildContext>();
                          _provider.showCompileAnimation(
                              context, compileAnimation);

                          final dialogContext = await compileAnimation.future;
                          await Future.delayed(Duration(seconds: 3));
                          Navigator.pop(dialogContext);
                          final completeAnimation = Completer<BuildContext>();
                          _provider.showCompileComplete(
                              context, completeAnimation);
                          final completedDialogContext =
                              await completeAnimation.future;
                          await Future.delayed(Duration(seconds: 3));
                          Navigator.pop(completedDialogContext);
                          Toast.message(
                              "Smart Contract compiled successfully.");
                        }
                      }
                    },
                    icon: Icons.computer,
                  ),
                if (_model.isCompiled)
                  AppButton(
                    label: "Mint",
                    helpType: HelpType.mint,
                    onPressed: _model.isPublished
                        ? null
                        : () async {
                            final confirmed = await ConfirmDialog.show(
                              title: "Mint Smart Contract?",
                              body:
                                  "Are you sure you want to mint this smart contract on the chain?",
                              confirmText: "Mint",
                              cancelText: "Cancel",
                            );

                            if (confirmed == true) {
                              final success = await ref
                                  .read(createSmartContractProvider.notifier)
                                  .mint();

                              if (success) {
                                final compileAnimation =
                                    Completer<BuildContext>();
                                _provider.showCompileAnimation(
                                    context, compileAnimation, true);
                                await Future.delayed(Duration(seconds: 3));
                                final dialogContext =
                                    await compileAnimation.future;
                                Navigator.pop(dialogContext);
                                final completeAnimation =
                                    Completer<BuildContext>();
                                _provider.showCompileComplete(
                                    context, completeAnimation, true);
                                final completedDialogContext =
                                    await completeAnimation.future;
                                await Future.delayed(Duration(seconds: 3));
                                Navigator.pop(completedDialogContext);
                                Toast.message(
                                    "Smart Contract minted successfully.");
                              }
                            }
                          },
                    icon: Icons.publish,
                  ),
                // AppButton(
                //   label: "Publish to Library",
                //   onPressed: () {},
                //   icon: Icons.publish,
                // ),
                AppButton(
                  label: "Delete",
                  helpType: HelpType.delete,
                  onPressed: _model.isCompiled ? null : () {},
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
