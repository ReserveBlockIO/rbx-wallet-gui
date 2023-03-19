import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/reserve/services/reserve_account_service.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/utils/toast.dart';
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
          }
        }
      },
    );
  }
}
