import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/encrypt/providers/password_required_provider.dart';
import 'package:rbx_wallet/features/encrypt/providers/startup_password_required_provider.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
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
  final FocusNode focusNode = FocusNode();
  String password = "";

  Future<void> submit() async {
    final success = await widget.read(passwordRequiredProvider.notifier).unlock(password);
    if (success == true) {
      Toast.message("Wallet unlocked!");
      widget.read(startupPasswordRequiredProvider.notifier).set(false);
      widget.read(sessionProvider.notifier).finishSetup();
      await widget.read(sessionProvider.notifier).loadWallets();
    } else {
      Toast.error("Incorrect wallet decryption password");
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                color: Colors.black,
                width: 100,
                child: Image.asset(
                  Assets.images.animatedCube.path,
                  scale: 1,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Image.asset(
                Assets.images.rbxWallet.path,
                width: 160,
                height: 27,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Encryption Password Required to continue validating.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              width: 300,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(password.isEmpty ? 0.4 : 0.8),
                      blurRadius: 6.0,
                      spreadRadius: 3.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Wallet Password",
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    focusNode: focusNode,
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
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  // BoxShadow(
                  //   color: password.isEmpty ? Colors.white24 : Colors.white60,
                  //   blurRadius: 8.0,
                  //   spreadRadius: 3.0,
                  // ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: IconButton(
                    onPressed: password.isEmpty
                        ? null
                        : () {
                            submit();
                          },
                    icon: Icon(
                      password.isEmpty ? Icons.lock_outline : Icons.lock_open,
                      color: Colors.black,
                      // color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
