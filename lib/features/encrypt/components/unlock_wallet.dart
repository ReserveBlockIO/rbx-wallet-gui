import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/session_provider.dart';
import '../../../generated/assets.gen.dart';
import '../../../utils/toast.dart';
import '../providers/password_required_provider.dart';
import '../providers/startup_password_required_provider.dart';

class UnlockWallet extends StatefulWidget {
  final WidgetRef ref;
  const UnlockWallet({
    Key? key,
    required this.ref,
  }) : super(key: key);

  @override
  State<UnlockWallet> createState() => _UnlockWalletState();
}

class _UnlockWalletState extends State<UnlockWallet> {
  final FocusNode focusNode = FocusNode();
  String password = "";

  Future<void> submit() async {
    final success = await widget.ref.read(passwordRequiredProvider.notifier).unlock(password);
    if (success == true) {
      Toast.message("Account unlocked!");
      widget.ref.read(startupPasswordRequiredProvider.notifier).set(false);
      widget.ref.read(sessionProvider.notifier).finishSetup(true);
      await widget.ref.read(sessionProvider.notifier).loadWallets();
    } else {
      Toast.error("Incorrect account decryption password");
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
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
            const SizedBox(
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
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Encryption Password Required to continue validating.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            const SizedBox(
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
                    decoration: const InputDecoration(
                      hintText: "Account Password",
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
            const SizedBox(
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
