import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/mother/components/mother_add_host_dialog.dart';
import 'package:rbx_wallet/features/mother/components/mother_create_host_dialog.dart';
import 'package:rbx_wallet/features/mother/models/mother_child.dart';
import 'package:rbx_wallet/features/mother/screens/mother_dashboard_screen.dart';
import 'package:rbx_wallet/features/mother/services/mother_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MotherModal extends BaseComponent {
  final MotherData? motherData;
  final List<MotherChild> children;
  const MotherModal(this.motherData, this.children, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectedToMother = ref.watch(walletInfoProvider)?.connectedToMother == true;

    return ModalContainer(
      padding: 16.0,
      withDecor: false,
      withClose: false,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Monitor Tx Hashes & Addresses Expo Remote",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                  ),
                  Text(
                    "MOTHER is a tool for monitoring the state of your remote validators.",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            AppButton(
              label: "Close",
              onPressed: () {
                Navigator.of(context).pop();
              },
              type: AppButtonType.Text,
              variant: AppColorVariant.Light,
            ),
          ],
        ),
        Divider(),
        Text(
          "Status",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        Text("Is Host: ${motherData != null ? 'YES' : 'NO'}"),
        Text("Is Remote: ${connectedToMother ? 'YES' : 'NO'}"),
        if (motherData != null) Text("Children: ${children.length}"),
        Divider(),
        if (motherData != null)
          ListTile(
            title: Text("Launch MOTHER"),
            leading: Icon(Icons.launch),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              AutoRouter.of(context).push(MotherDashboardScreenRoute());
            },
          ),
        ListTile(
          title: Text(motherData == null ? "Set Wallet as Host" : "Update Host Info"),
          leading: Icon(Icons.cell_tower),
          trailing: Icon(Icons.chevron_right),
          onTap: () async {
            final data = await showDialog(
              context: context,
              builder: (context) => MotherCreateHostDialog(forUpdate: motherData != null),
            );

            if (data != null) {
              Navigator.of(context).pop();
            }
          },
        ),
        if (motherData != null)
          ListTile(
            title: Text("Stop Host"),
            leading: Icon(
              Icons.stop,
              color: Colors.red,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final confirmed = await ConfirmDialog.show(
                title: "Stop MOTHER Host?",
                body: "Are you sure you want to stop running this wallet as a MOTHER host?",
                confirmText: "Stop",
                cancelText: "Cancel",
              );

              if (confirmed == true) {
                final success = await MotherService().stopHost();
                if (success == true) {
                  final restart = await ConfirmDialog.show(
                    title: "CLI Restart Required",
                    body: "Would you like to restart now?",
                    confirmText: "Restart",
                    cancelText: "Later",
                  );

                  if (restart == true) {
                    ref.read(sessionProvider.notifier).restartCli();
                  }
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        if (!connectedToMother)
          ListTile(
            title: Text("Set Wallet as Remote"),
            leading: Icon(Icons.satellite_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final data = await showDialog(
                context: context,
                builder: (context) => MotherAddHostDialog(),
              );

              if (data != null) {
                Navigator.of(context).pop();
              }
            },
          ),
        if (connectedToMother)
          ListTile(
            title: Text("Stop Remote"),
            leading: Icon(
              Icons.stop,
              color: Colors.red,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final confirmed = await ConfirmDialog.show(
                title: "Stop Remote",
                body: "Are you sure you want to remove this node as a REMOTE?\n\nA CLI restart will be required.",
                confirmText: "Stop & Restart CLI",
                cancelText: "Cancel",
              );
              if (confirmed == true) {
                final path = await configPath();
                final currentLines = await File(path).readAsLines();
                final List<String> updatedLines = [];

                for (final line in currentLines) {
                  if (!line.contains("Mother")) {
                    updatedLines.add(line);
                  }
                }
                await File(path).writeAsString(updatedLines.join('\n'));
                await ref.read(sessionProvider.notifier).restartCli();
                Navigator.of(context).pop();
                Toast.message("REMOTE node has been removed from MOTHER");
              }
              // InfoDialog.show(
              //   title: "Stop Remote",
              //   content: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("In order to stop the REMOTE you need to update your configuration file."),
              //       SizedBox(height: 8),
              //       InkWell(
              //         onTap: () async {
              //           final path = await configPath();
              //           openFile(File(path));
              //         },
              //         child: Text(
              //           "1. Open Config",
              //           style: TextStyle(decoration: TextDecoration.underline),
              //         ),
              //       ),
              //       SizedBox(height: 16),
              //       Text("2. Remove the following entries:"),
              //       Text(
              //         "-> MotherAddress",
              //         style: Theme.of(context).textTheme.caption,
              //       ),
              //       Text(
              //         "-> MotherPassword",
              //         style: Theme.of(context).textTheme.caption,
              //       ),
              //       SizedBox(height: 16),
              //       Text("4. Save the config file."),
              //       SizedBox(height: 16),
              //       InkWell(
              //         onTap: () async {
              //           ref.read(sessionProvider.notifier).restartCli();
              //           Navigator.of(context).pop();
              //         },
              //         child: Text(
              //           "3. Restart the CLI",
              //           style: TextStyle(
              //             decoration: TextDecoration.underline,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // );

              // if (data != null) {
              //   Navigator.of(context).pop();
              // }
            },
          ),
        ListTile(
          title: Text("What is MOTHER?"),
          leading: Icon(Icons.help),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            InfoDialog.show(
              title: "Monitor Tx Hashes & Addresses Expo Remote",
              body:
                  "MOTHER is a tool for monitoring the state of your remote validators.\n\nFirst you must setup one of your wallets as the HOST and then add your additional node as a REMOTE.\n\nWhen adding a REMOTE node, you will need to know the IP address and the password for the HOST.\n\nOnce complete, you'll be able to view a dashboard tracking all of your node's activity from one wallet.\n\nNote: you must have port '${Env.validatorPort}' open on the HOST machine.",
            );
          },
        ),
      ],
    );
  }
}
