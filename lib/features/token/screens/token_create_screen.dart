import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/token/components/token_form.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

class TokenCreateScreen extends BaseScreen {
  const TokenCreateScreen({super.key})
      : super(
          backgroundColor: Colors.black87,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black54,
      title: Text("Create Fungible Token"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(sessionProvider).currentWallet;

    if (currentWallet == null) {
      return Center(
        child: Text("No Wallet Selected"),
      );
    }
    if (currentWallet.isReserved) {
      return Center(
        child: Text("Vault Accounts can not mint tokens"),
      );
    }
    return const SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: TokenForm(),
    ));
  }
}
