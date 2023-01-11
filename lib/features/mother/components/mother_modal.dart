import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/mother/components/mother_add_host_dialog.dart';
import 'package:rbx_wallet/features/mother/components/mother_create_host_dialog.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MotherModal extends BaseComponent {
  const MotherModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        ListTile(
          title: Text("Launch MOTHER"),
          leading: Icon(Icons.launch),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            launchUrlString("${Env.apiBaseUrl}/mother");
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text("Set Wallet as Host"),
          leading: Icon(Icons.cell_tower),
          trailing: Icon(Icons.chevron_right),
          onTap: () async {
            final data = await showDialog(
              context: context,
              builder: (context) => MotherCreateHostDialog(),
            );

            print(data);
            if (data != null) {
              Navigator.of(context).pop();
            }
          },
        ),
        ListTile(
          title: Text("Set Wallet as Follower"),
          leading: Icon(Icons.satellite_alt_outlined),
          trailing: Icon(Icons.chevron_right),
          onTap: () async {
            final data = await showDialog(
              context: context,
              builder: (context) => MotherAddHostDialog(),
            );

            print(data);
            if (data != null) {
              Navigator.of(context).pop();
            }
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
                  "MOTHER is a tool for monitoring the state of your remote validators.\n\nFirst you must setup one of your wallets as the HOST and then add your additional node as a FOLLOWER.\n\nOnce complete, you'll be able to view a dashboard tracking all of your node's activity from one wallet.\n\nNote: you must have port '${Env.validatorPort}' open on the HOST machine.",
            );
          },
        ),
      ],
    );
  }
}
