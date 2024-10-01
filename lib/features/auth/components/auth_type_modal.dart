import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';

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
          leading: const Icon(Icons.email),
          title: const Text(
            "Email & Password",
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 32,
          ),
          onTap: handleUsername,
        ),
        const Divider(height: 1),
        ListTile(
          leading: const Icon(FontAwesomeIcons.paragraph),
          title: const Text(
            "Mneumonic (HD account)",
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 32,
          ),
          onTap: handleMneumonic,
        ),
        if (handlePrivateKey != null) const Divider(height: 1),
        if (handlePrivateKey != null)
          ListTile(
            leading: const Icon(FontAwesomeIcons.key),
            title: const Text(
              "Private Key",
            ),
            trailing: const Icon(
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
