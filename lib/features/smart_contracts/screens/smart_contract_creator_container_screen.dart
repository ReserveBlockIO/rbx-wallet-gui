import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';

class SmartContractCreatorContainerScreen extends BaseScreen {
  const SmartContractCreatorContainerScreen({Key? key})
      : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);
    return AppBar(
      title: Text(_model.isCompiled
          ? "View Compiled Smart Contract"
          : "Create Smart Contract"),
      leading: IconButton(
        onPressed: () async {
          final confirmed = await ConfirmDialog.show(
              title:
                  "Are you sure you want to close the Smart Contract creator?");

          if (confirmed == true) {
            AutoRouter.of(context).pop();
          }
        },
        icon: Icon(Icons.close),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Padding(padding: const EdgeInsets.all(0), child: AutoRouter());
  }
}
