import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'vfx_adnr_component.dart';
import '../../../core/base_component.dart';
import '../../wallet/models/wallet.dart';

class AdnrList extends BaseComponent {
  const AdnrList({
    Key? key,
    required this.wallets,
  }) : super(key: key);

  final List<Wallet> wallets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: wallets.length,
      itemBuilder: (context, index) {
        final wallet = wallets[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: VfxAdnrCard(wallet: wallet),
        );
      },
    );
  }
}
