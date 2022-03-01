import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

class CompactTransactionListTile extends BaseComponent {
  final Transaction transaction;

  const CompactTransactionListTile(this.transaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Wallet? toWallet =
        ref.read(walletListProvider.notifier).getWallet(transaction.toAddress);

    final Wallet? fromWallet = ref
        .read(walletListProvider.notifier)
        .getWallet(transaction.fromAddress);

    final toMe = toWallet != null;
    final fromMe = fromWallet != null;

    return ListTile(
      leading: Builder(builder: (context) {
        if (toMe && fromMe) {
          return Icon(Icons.refresh);
        }

        if (toMe) {
          return Icon(Icons.move_to_inbox);
        }

        if (fromMe) {
          return Icon(Icons.outbox);
        }

        return Icon(Icons.star, color: Colors.transparent);
      }),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Hash: ${transaction.hash}"),
          if (toMe) Text("From: ${transaction.fromAddress}"),
          if (fromMe) Text("To: ${transaction.toAddress}"),
        ],
      ),
      subtitle: Text("Date: ${transaction.parseTimeStamp}"),
    );
  }
}
