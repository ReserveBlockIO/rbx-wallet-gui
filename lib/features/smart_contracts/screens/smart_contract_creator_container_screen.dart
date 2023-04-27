import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../../core/dialogs.dart';
import '../providers/create_smart_contract_provider.dart';

class SmartContractCreatorContainerScreen extends BaseScreen {
  const SmartContractCreatorContainerScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);
    return AppBar(
        title: Text(_model.isCompiled ? "View Compiled Smart Contract" : "Create Smart Contract"),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () async {
            final confirmed = await ConfirmDialog.show(
              title: "Are you sure you want to close the smart contract creator?",
              body: "All unsaved changes will be lost.",
              cancelText: "Cancel",
              confirmText: "Continue",
            );

            if (confirmed == true) {
              ref.read(createSmartContractProvider.notifier).clearSmartContract();
              AutoRouter.of(context).pop();
            }
          },
          icon: const Icon(Icons.close),
        ),
        // actions: [HelpButton(HelpType.smartContract)],
        actions: [
          // TextButton(
          //   onPressed: () {
          //     AutoRouter.of(context).push(const SmartContractDraftsScreenRoute());
          //   },
          //   child: const Text(
          //     "My Drafts",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        ]);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const Padding(padding: EdgeInsets.all(0), child: AutoRouter());
  }
}
