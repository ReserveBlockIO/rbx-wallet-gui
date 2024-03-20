import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/models/web_session_model.dart';
import 'package:rbx_wallet/features/web/components/web_wallet_type_switcher.dart';
import '../../../core/components/centered_loader.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../btc_web/components/web_btc_transaction_list.dart';
import '../../web/components/web_no_wallet.dart';
import '../components/web_transaction_card.dart';
import '../providers/web_transaction_list_provider.dart';

class WebTransactionScreen extends BaseScreen {
  const WebTransactionScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Transactions"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      actions: [
        WebWalletTypeSwitcher(),
        IconButton(
            onPressed: () {
              final address = ref.read(webSessionProvider).currentWallet?.address;
              if (address != null) {
                ref.read(webTransactionListProvider(address).notifier).refresh();
              }
            },
            icon: const Icon(Icons.refresh))
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final session = ref.watch(webSessionProvider);

    if (session.selectedWalletType == WalletType.btc) {
      if (session.btcKeypair == null) {
        return const WebNotWallet();
      }

      return WebBtcTransactionList(address: session.btcKeypair!.address);
    }

    final address = session.currentWallet?.address;

    if (address == null) {
      return const WebNotWallet();
    }

    final model = ref.watch(webTransactionListProvider(address));
    final transactions = model.transactions;

    if (transactions.isEmpty) {
      return Center(
        child: Text("No Transactions found for $address."),
      );
    }

    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WebTransactionCard(tx),
              if (index + 1 == transactions.length)
                _NextPageRequester(
                    isLoading: model.isLoading,
                    pageRequestFunction: () {
                      ref.read(webTransactionListProvider(address).notifier).fetchNextPage();
                    })
            ],
          );
        });
  }
}

class _NextPageRequester extends StatefulWidget {
  final Function pageRequestFunction;
  final bool isLoading;
  const _NextPageRequester({
    super.key,
    required this.pageRequestFunction,
    required this.isLoading,
  });

  @override
  State<_NextPageRequester> createState() => __NextPageRequesterState();
}

class __NextPageRequesterState extends State<_NextPageRequester> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300)).then((_) {
      widget.pageRequestFunction();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: widget.isLoading ? CenteredLoader() : SizedBox(),
    );
  }
}
