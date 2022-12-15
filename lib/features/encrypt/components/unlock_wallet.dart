import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/encrypt/providers/startup_password_required_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class UnlockWallet extends StatefulWidget {
  final Reader read;
  const UnlockWallet({
    Key? key,
    required this.read,
  }) : super(key: key);

  @override
  State<UnlockWallet> createState() => _UnlockWalletState();
}

class _UnlockWalletState extends State<UnlockWallet> {
  String password = "";

  Future<void> submit() async {
    final success = await BridgeService().unlockWallet(password);

    if (success == true) {
      Toast.message("Wallet unlocked!");
      widget.read(startupPasswordRequiredProvider.notifier).set(false);
      widget.read(sessionProvider.notifier).finishSetup();
    } else {
      Toast.error("Incorrect wallet decryption password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black54,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Encryption Password Required to continue validating."),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Wallet Password"),
                autofocus: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                onFieldSubmitted: (val) {
                  setState(() {
                    password = val;
                  });
                  submit();
                },
              ),
            ),
            SizedBox(
              height: 8,
            ),
            AppButton(
              label: "Unlock",
              onPressed: password.isEmpty
                  ? null
                  : () {
                      submit();
                    },
            )
          ],
        )),
      ),
    );
  }
}
