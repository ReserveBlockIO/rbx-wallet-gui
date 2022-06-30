import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';

class AuthTypeModal extends StatelessWidget {
  final Function() handleMneumonic;
  final Function() handleUsername;
  final Function(BuildContext context)? handlePrivateKey;

  const AuthTypeModal({
    Key? key,
    required this.handleUsername,
    required this.handleMneumonic,
    this.handlePrivateKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalContainer(
      withDecor: false,
      withClose: false,
      padding: 16.0,
      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      children: [
        ListTile(
          leading: Icon(FontAwesomeIcons.paragraph),
          title: Text(
            "With Mneumonic",
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: 32,
          ),
          onTap: handleMneumonic,
        ),
        Divider(height: 1),
        ListTile(
          leading: Icon(Icons.email),
          title: Text(
            "With Email & Password",
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: 32,
          ),
          onTap: handleUsername,
        ),
        if (handlePrivateKey != null) Divider(height: 1),
        if (handlePrivateKey != null)
          ListTile(
            leading: Icon(FontAwesomeIcons.key),
            title: Text(
              "With Private Key",
            ),
            trailing: Icon(
              Icons.chevron_right,
              size: 32,
            ),
            onTap: () {
              handlePrivateKey!(context);
            },
          ),
      ],
    );
  }
}
