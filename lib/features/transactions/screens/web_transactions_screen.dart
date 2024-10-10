import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/web_session_model.dart';
import '../../../core/providers/currency_segmented_button_provider.dart';
import '../../btc_web/providers/btc_web_transaction_list_provider.dart';
import '../../web/components/web_wallet_type_switcher.dart';
import '../../../core/components/centered_loader.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../btc_web/components/web_btc_transaction_list.dart';
import '../../web/components/web_no_wallet.dart';
import '../components/vfx_transaction_filter_button.dart';
import '../components/web_transaction_card.dart';
import '../models/web_transaction.dart';
import '../providers/vfx_transaction_filter_provider.dart';
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
    final session = ref.watch(webSessionProvider);

    return AppBar(
      title: const Text("Transactions"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      actions: [
        if (session.selectedWalletType == WalletType.rbx) VfxTransactionFilterButton(),
        WebWalletTypeSwitcher(),
        Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: IconButton(
              onPressed: () {
                if (ref.read(webSessionProvider).selectedWalletType == WalletType.btc) {
                  final address = ref.read(webSessionProvider).btcKeypair?.address;
                  if (address != null) {
                    ref.read(btcWebTransactionListProvider(address).notifier).reload();
                  }
                  return;
                }

                final address = ref.read(webSessionProvider).currentWallet?.address;
                if (address != null) {
                  ref.read(webTransactionListProvider(address).notifier).refresh();
                }
              },
              icon: const Icon(
                Icons.refresh,
                size: 16,
              )),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final session = ref.watch(webSessionProvider);

    final filters = ref.watch(vfxTransactionFilterProvider);

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
    List<WebTransaction> transactions = model.transactions;
    if (filters.txTypes.isNotEmpty) {
      transactions = transactions.where((t) => filters.txTypes.contains(t.type)).toList();
    }

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
