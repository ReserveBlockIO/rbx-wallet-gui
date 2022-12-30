import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/encrypt/providers/wallet_is_encrypted_provider.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class HdWalletButton extends BaseComponent {
  const HdWalletButton({
    Key? key,
  }) : super(key: key);

  Future<void> create(BuildContext context, WidgetRef ref, int strength) async {
    ref.read(globalLoadingProvider.notifier).start();
    final mnumonic = await BridgeService().getHdWallet(strength);
    ref.read(globalLoadingProvider.notifier).complete();

    if (mnumonic != null) {
      Navigator.of(context).pop(mnumonic);
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Create HD Wallet",
      onPressed: () async {
        final String? mneumonic = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // buttonPadding: EdgeInsets.all(8.0),
              // actionsPadding: EdgeInsets.all(0.0),
              title: Text("HD Wallet"),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              ],
              content: SizedBox(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("By creating an HD wallet you are creating a function to recover your private keys by use of recovery phrase."),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        "Once generated, any keys you create will use this phrase to seed the private key generation. Therefore, you will only need to remember this to deterministically recover your keys."),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "This is an advanced feature and is not recommended unless you are familiar with Hierarchical Deterministic concepts.\n\nAny keys created prior to this will not be recoverable through this phrase so please ensure they are backed up as well.",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Divider(),
                    Text(
                      "Generate with strength:",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppButton(
                          label: "12 Words",
                          onPressed: () async {
                            await create(context, ref, 12);
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        AppButton(
                          label: "24 Words",
                          onPressed: () async {
                            await create(context, ref, 24);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );

        if (mneumonic != null) {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return RecoveryPhraseDialog(mneumonic: mneumonic);
            },
          );
        }
      },
    );
  }
}

class RecoveryPhraseDialog extends StatelessWidget {
  const RecoveryPhraseDialog({
    Key? key,
    required this.mneumonic,
  }) : super(key: key);

  final String mneumonic;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Recovery Phrase Generated"),
      actions: [
        TextButton(
          onPressed: () async {
            final confirmed = await ConfirmDialog.show(
              title: "Close Recovery Phrase?",
              body: "Are you sure you have copied your recovery phrase to a secure location?",
              confirmText: "Agree and Close",
              cancelText: "Cancel",
            );

            if (confirmed == true) {
              Navigator.of(context).pop();
            }
          },
          child: Text(
            "Done",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Copy your recovery phrase to a secure location."),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Recovery Phrase"),
                  ),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  initialValue: mneumonic,
                  readOnly: true,
                  minLines: 1,
                  maxLines: 6,
                ),
                // IconButton(onPressed:  (){}, icon: Icon(Icons.copy))
                SizedBox(
                  height: 16,
                ),
                AppButton(
                  label: "Copy to Clipboard",
                  icon: Icons.copy,
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: mneumonic));
                    Toast.message("Mneumonic copied to clipboard");
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
