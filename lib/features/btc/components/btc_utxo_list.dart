import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/btc/providers/combined_btc_utxo_list_provider.dart';
import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';

class BtcUtxoList extends BaseComponent {
  const BtcUtxoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utxos = ref.watch(combinedBtcUtxoListProvider);

    if (utxos.isEmpty) {
      return Center(
        child: Text("No UTXOs"),
      );
    }

    return ListView.builder(
      itemCount: utxos.length,
      itemBuilder: (context, index) {
        final utxo = utxos[index];

        return Container(
          decoration: BoxDecoration(
            color: Color(0xFF050505),
            boxShadow: glowingBoxBtc,
          ),
          child: ListTile(
            dense: true,
            title: Text("Address: ${utxo.address}"),
            subtitle: Text("TX ID: ${utxo.hash}"),
            leading: Text("${utxo.value}"),
            trailing: utxo.isUsed
                ? AppBadge(
                    label: "Used",
                    variant: AppColorVariant.Btc,
                  )
                : AppBadge(
                    label: "Unused",
                    variant: AppColorVariant.Primary,
                  ),
          ),
        );
      },
    );
  }
}
