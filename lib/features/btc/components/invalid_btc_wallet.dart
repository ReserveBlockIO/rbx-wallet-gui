import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/components/btc_wallet_selector.dart';

class InvalidBtcWallet extends StatelessWidget {
  final String message;
  const InvalidBtcWallet({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text(
            "Change Wallet:",
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 350,
            color: Theme.of(context).colorScheme.btcDark.withOpacity(0.3),
            child: BtcWalletSelector(
              truncateAddress: false,
              withActions: false,
            ),
          )
        ],
      ),
    );
  }
}
