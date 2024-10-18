import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/providers/session_provider.dart';
import '../components/token_form.dart';
import '../../wallet/components/wallet_selector.dart';

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
    final currentWallet = ref.watch(sessionProvider.select((v) => v.currentWallet));

    if (currentWallet == null) {
      return Center(
        child: Text("No account selected"),
      );
    }
    if (currentWallet.isReserved) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Vault Accounts cann't mint tokens"),
            SizedBox(
              height: 8,
            ),
            WalletSelector(
              includeRbx: true,
              includeBtc: false,
              includeRa: false,
              withOptions: false,
              truncatedLabel: false,
              headerHasCopy: false,
            ),
          ],
        ),
      );
    }
    return const SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: TokenForm(),
    ));
  }
}
