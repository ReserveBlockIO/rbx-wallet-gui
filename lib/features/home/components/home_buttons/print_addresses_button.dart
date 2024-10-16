import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../btc/providers/btc_account_list_provider.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../bridge/models/log_entry.dart';
import '../../../bridge/providers/log_provider.dart';
import '../../../reserve/providers/reserve_account_provider.dart';
import '../../../wallet/providers/wallet_list_provider.dart';

class PrintAdressesButton extends BaseComponent {
  const PrintAdressesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cliStarted = ref.watch(sessionProvider.select((v) => v.cliStarted));

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
                    message: wallet.isReserved
                        ? "${wallet.address} (Available: ${wallet.availableBalance} VFX)"
                        : "${wallet.address} (${wallet.balance} VFX)",
                    variant: AppColorVariant.Light,
                    colorOverride: wallet.isReserved ? Colors.deepPurple.shade200 : null,
                    textToCopy: wallet.address,
                    trailing: wallet.isReserved
                        ? InkWell(
                            child: Icon(
                              Icons.help,
                              size: 14,
                              color: Colors.deepPurple.shade200,
                            ),
                            onTap: () {
                              ref.read(reserveAccountProvider.notifier).showBalanceInfo(context, wallet);
                            },
                          )
                        : null));
              }

              for (final b in ref.read(btcAccountListProvider)) {
                _log.append(LogEntry(
                  message: "${b.address} (${b.balance} BTC)",
                  variant: AppColorVariant.Btc,
                  textToCopy: b.address,
                ));
              }
            },
    );
  }
}
