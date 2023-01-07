import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/transactions/providers/transaction_list_provider.dart';
import 'package:collection/collection.dart';

class MediaBackup extends BaseComponent {
  final Nft nft;
  const MediaBackup(this.nft, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tx = ref
        .watch(transactionListProvider(TransactionListType.All))
        .firstWhereOrNull((t) {
      if (t.type != 3) {
        return false;
      }

      if (t.nftData == null) {
        return false;
      }

      final List<dynamic> data = jsonDecode(t.nftData);
      if (data.isEmpty) {
        return false;
      }

      final d = data[0];
      if (d.containsKey('ContractUID') && d['ContractUID'] == nft.id) {
        return true;
      }
      return false;
    });

    if (tx == null) {
      return SizedBox();
    }

    final List<dynamic> data = jsonDecode(tx.nftData);
    final d = data[0];
    final backupUrl = d['BackupURL'];

    if (backupUrl == null || backupUrl == "NA") {
      return SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            "Media Backup URL:",
            style: Theme.of(context).textTheme.headline5,
          ),
          SelectableText(backupUrl),
        ],
      ),
    );
  }
}
