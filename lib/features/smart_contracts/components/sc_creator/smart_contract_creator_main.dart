import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
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
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
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
    ref.read(nftDetailProvider(id).notifier).init();
    ref.read(createSmartContractProvider.notifier).clearSmartContract();

    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      AutoRouter.of(context).pop(id);
    });
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

    final confirmed = await ConfirmDialog.show(
      title: "Compile & Mint Smart Contract?",
      body:
          "Are you sure you want to proceed?\nOnce compiled you will not be able to make any changes and the smart contract will be deployed to the chain.",
      confirmText: "Compile & Mint",
      cancelText: "Cancel",
    );

    if (confirmed == true) {
      ref.read(sessionProvider.notifier).setIsMintingOrCompiling(true);

      final compileAnimation = Completer<BuildContext>();
      _provider.showCompileAnimation(context, compileAnimation);
      final dialogContext = await compileAnimation.future;

      try {
        final sc = await ref.read(createSmartContractProvider.notifier).compile();

        if (sc != null) {
          final success = await ref.read(createSmartContractProvider.notifier).mint();

          if (success) {
            await Future.delayed(const Duration(seconds: 3));
            Navigator.pop(dialogContext);
            final completeAnimation = Completer<BuildContext>();
            _provider.showCompileComplete(context, completeAnimation);
            final completedDialogContext = await completeAnimation.future;
            await Future.delayed(const Duration(seconds: 3));
            Navigator.pop(completedDialogContext);
            Toast.message("Smart Contract minted successfully.");

            if (!kIsWeb) {
              mintedComplete(sc.id, context, ref);
            }
          } else {
            Navigator.pop(dialogContext);

            Toast.error("A problem occurred minting this smart contract.");
          }
        } else {
          Navigator.pop(dialogContext);

          Toast.error("A problem occurred compiling this smart contract.");
        }
      } catch (e) {
        Navigator.pop(dialogContext);

        print(e);
        ref.read(sessionProvider.notifier).setIsMintingOrCompiling(false);
      }
    }
    ref.read(sessionProvider.notifier).setIsMintingOrCompiling(false);
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

    if (!confirmed) {
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
            child: Center(child: buildCompileButton(ref, _model, context)),
          ),
        ),
      ],
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
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
                  ],
                ),
                const FeaturesFormGroup(),
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
      disabled: ref.watch(sessionProvider).isMintingOrCompiling,
      onPressed: _model.isPublished
          ? null
          : () {
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
