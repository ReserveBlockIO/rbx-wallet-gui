import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/dialogs.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../utils/toast.dart';
import '../../../bridge/services/bridge_service.dart';
import '../../../encrypt/providers/wallet_is_encrypted_provider.dart';
import '../../../global_loader/global_loading_provider.dart';

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
      label: "Create HD Account",
      icon: Icons.hd_outlined,
      onPressed: !ref.watch(sessionProvider.select((v) => v.cliStarted))
          ? null
          : () async {
              if (ref.read(walletIsEncryptedProvider)) {
                Toast.error("You can not create an HD account with an encrypted wallet.");
                return;
              }

              final String? mneumonic = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // buttonPadding: EdgeInsets.all(8.0),
                    // actionsPadding: EdgeInsets.all(0.0),
                    title: const Text("HD Account"),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
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
                          const Text("By creating an HD account you are creating a function to recover your private keys by use of recovery phrase."),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                              "Once generated, any keys you create will use this phrase to seed the private key generation. Therefore, you will only need to remember this to deterministically recover your keys."),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "This is an advanced feature and is not recommended unless you are familiar with Hierarchical Deterministic concepts.\n\nAny keys created prior to this will not be recoverable through this phrase so please ensure they are backed up as well.",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Divider(),
                          const Text(
                            "Generate with strength:",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
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
                              const SizedBox(
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
      title: const Text("Recovery Phrase Generated"),
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
          child: const Text(
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
            const Text("Copy your recovery phrase to a secure location."),
            Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Recovery Phrase"),
                  ),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  initialValue: mneumonic,
                  readOnly: true,
                  minLines: 1,
                  maxLines: 6,
                ),
                // IconButton(onPressed:  (){}, icon: Icon(Icons.copy))
                const SizedBox(
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
