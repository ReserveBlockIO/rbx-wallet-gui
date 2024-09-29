import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../utils/toast.dart';
import '../../transactions/providers/transaction_list_provider.dart';
import '../models/nft.dart';

class MediaBackup extends BaseComponent {
  final Nft nft;
  const MediaBackup(this.nft, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tx = ref.watch(transactionListProvider(TransactionListType.All)).firstWhereOrNull((t) {
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
      return const SizedBox();
    }

    final List<dynamic> data = jsonDecode(tx.nftData);
    final d = data[0];
    final backupUrl = d['BackupURL'];

    if (backupUrl == null || backupUrl == "NA") {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            "Media Backup URL:",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SelectableText(backupUrl),
          const SizedBox(
            height: 6,
          ),
          AppButton(
            label: "Copy URL",
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: backupUrl));
              Toast.message("URL copied to clipboard");
            },
            icon: Icons.copy,
          )
        ],
      ),
    );
  }
}
