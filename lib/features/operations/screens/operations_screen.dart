import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

import '../../home/components/home_buttons.dart';

class OperationsScreen extends BaseScreen {
  const OperationsScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Operations"),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actions: [
        WalletSelector(),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topCenter,
      child: HomeButtons(
        includeRestoreHd: ref.watch(walletListProvider).isEmpty,
      ),
    );
  }
}
