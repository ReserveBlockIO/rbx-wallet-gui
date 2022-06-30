import 'package:flutter/material.dart';

class ImportWalletButton extends StatelessWidget {
  const ImportWalletButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem(
      child: const Text("Import Wallet"),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.red,
              width: 100,
              height: 100,
            );
          },
        );
      },
    );
  }
}
