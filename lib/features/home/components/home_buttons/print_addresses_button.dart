import 'package:flutter/material.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../bridge/models/log_entry.dart';
import '../../../bridge/providers/log_provider.dart';
import '../../../wallet/providers/wallet_list_provider.dart';

class PrintAdressesButton extends BaseComponent {
  const PrintAdressesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cliStarted = ref.watch(sessionProvider).cliStarted;

    return AppButton(
      label: "Print Addresses",
      icon: Icons.wallet,
      onPressed: !cliStarted
          ? null
          : () {
              final _log = ref.read(logProvider.notifier);

              _log.append(LogEntry(
                message: "Wallet Addresses:",
                variant: AppColorVariant.Secondary,
              ));

              final wallets = ref.read(walletListProvider);
              for (final wallet in wallets) {
                _log.append(LogEntry(
                  message: "${wallet.address} (${wallet.balance} RBX)",
                  variant: AppColorVariant.Success,
                  textToCopy: wallet.address,
                ));
              }
            },
    );
  }
}
