import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../providers/btc_account_list_provider.dart';
import 'btc_adnr_card.dart';

class BtcAdnrList extends BaseComponent {
  const BtcAdnrList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(btcAccountListProvider);
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final account = accounts[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: BtcAdnrCard(account: account),
        );
      },
    );
  }
}
