import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../nft/providers/transferred_provider.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../bridge/models/log_entry.dart';
import '../../bridge/providers/log_provider.dart';
import '../services/reserve_account_service.dart';
import '../../transactions/models/transaction.dart';
import '../../../utils/toast.dart';
import "../providers/pending_callback_provider.dart";

class CallbackButton extends BaseComponent {
  final Transaction transaction;
  const CallbackButton({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Callback",
      disabled: ref.watch(pendingCallbackProvider).contains(transaction.hash),
      variant: AppColorVariant.Warning,
      onPressed: () async {
        final password = await PromptModal.show(
          title: "Callback Transaction",
          body:
              "Callbacks can be used to return the funds/assets to the same account for escrow purposes. Input your password to callback this transaction.",
          validator: (v) => null,
          lines: 1,
          obscureText: true,
          labelText: "Password",
          revealObscure: true,
        );

        if (password != null) {
          final hash = await ReserveAccountService().callBack(password, transaction.hash);
          if (hash != null) {
            final message = "Callback TX sent with hash of $hash";
            ref.read(pendingCallbackProvider.notifier).addHash(transaction.hash);

            Toast.message(message);
            ref.read(logProvider.notifier).append(
                  LogEntry(
                    message: message,
                    textToCopy: hash,
                    variant: AppColorVariant.Success,
                  ),
                );
            ref.read(transferredProvider.notifier).clear();
          }
        }
      },
    );
  }
}
