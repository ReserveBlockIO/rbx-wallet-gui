import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class RecoverButton extends BaseComponent {
  final Transaction transaction;
  const RecoverButton({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Recover",
      variant: AppColorVariant.Danger,
      disabled: ref.watch(pendingCallbackProvider).contains(transaction.hash),
      onPressed: () async {
        final password = await PromptModal.show(
          title: "Recover Transaction",
          body:
              "Recover should be used mainly for theft of coin or assets. Input your password to recover this transaction and funds/assets will be sent to your recovery address.",
          validator: (v) => null,
          lines: 1,
          obscureText: true,
          labelText: "Password",
        );

        if (password != null) {
          final hash = await ReserveAccountService().recoverTx(password, transaction.hash);
          if (hash != null) {
            final message = "Recover TX sent with hash of $hash. Funds/assets will be sent to your recovery address.";
            Toast.message(message);
            ref.read(pendingCallbackProvider.notifier).addHash(transaction.hash);

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
