import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

class InvalidWallet extends StatelessWidget {
  final String message;
  const InvalidWallet({
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
          const SizedBox(
            width: 350,
            child: WalletSelector(
              truncatedLabel: false,
              withOptions: false,
            ),
          )
        ],
      ),
    );
  }
}
