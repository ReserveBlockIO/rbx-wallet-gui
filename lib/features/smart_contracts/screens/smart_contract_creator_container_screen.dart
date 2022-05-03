import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/dialogs.dart';

class SmartContractCreatorContainerScreen extends BaseScreen {
  const SmartContractCreatorContainerScreen({Key? key})
      : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Create Smart Contract"),
      leading: IconButton(
        onPressed: () async {
          final confirmed = await ConfirmDialog.show(
              title:
                  "Are you sure you want to close the Smart Contract creator?");

          if (confirmed == true) {
            AutoRouter.of(context).popUntilRoot();
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
