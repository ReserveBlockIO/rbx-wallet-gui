import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/dialogs.dart';

enum HelpType {
  unknown,
  smartContractName,
  ownerAddress,
}

class HelpButton extends StatelessWidget {
  final HelpType type;
  const HelpButton(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.help,
        color: Theme.of(context).colorScheme.secondary,
        size: 18,
      ),
      onPressed: () {
        InfoDialog.show(
          title: _title,
          body: _body,
          closeText: _closeText,
          icon: Icons.help,
        );
      },
    );
  }

  String get _title {
    switch (type) {
      case HelpType.smartContractName:
        return "Smart Contract Name";
      case HelpType.ownerAddress:
        return "Owner Address";
      default:
        return "Not implemented";
    }
  }

  String get _body {
    switch (type) {
      case HelpType.smartContractName:
        return "Name your smart contract something wicked sick.";
      case HelpType.ownerAddress:
        return "This is who will own the smart contract.";
      default:
        return "Not implemented";
    }
  }

  String get _closeText {
    final list = [
      'Thanks!',
      'Close',
      'Great tip!',
      "Alright",
      "Cheers!",
      "Ok",
    ];
    return (list..shuffle()).first;
  }
}
