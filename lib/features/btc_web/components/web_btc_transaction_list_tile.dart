import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc_web/models/btc_web_transaction.dart';

class WebBtcTransactionListTile extends StatelessWidget {
  final BtcWebTransaction transaction;
  const WebBtcTransactionListTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      decoration: BoxDecoration(
        boxShadow: glowingBoxBtc,
      ),
      child: Card(
        child: Text(transaction.hash),
      ),
    );
  }
}
