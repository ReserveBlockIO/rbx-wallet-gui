import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../models/transaction.dart';

class CompactTransactionListTile extends BaseComponent {
  final Transaction transaction;

  const CompactTransactionListTile(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Wallet? toWallet = ref.read(walletListProvider.notifier).getWallet(transaction.toAddress);

    final Wallet? fromWallet = ref.read(walletListProvider.notifier).getWallet(transaction.fromAddress);

    final toMe = toWallet != null;
    final fromMe = fromWallet != null;

    return ListTile(
      leading: Builder(builder: (context) {
        if (toMe && fromMe) {
          return const Icon(Icons.refresh);
        }

        if (toMe) {
          return const Icon(Icons.move_to_inbox);
        }

        if (fromMe) {
          return const Icon(Icons.outbox);
        }

        return const Icon(Icons.star, color: Colors.transparent);
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
