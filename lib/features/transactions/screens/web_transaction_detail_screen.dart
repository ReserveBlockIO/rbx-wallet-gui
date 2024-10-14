import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/components.dart';
import '../../../core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../web_shop/components/complete_sale_button.dart';

import '../../../core/base_component.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/env.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../utils/toast.dart';
import '../models/web_transaction.dart';
import '../providers/web_transaction_detail_provider.dart';

class WebTransactionDetailScreen extends BaseScreen {
  final String hash;

  const WebTransactionDetailScreen({
    Key? key,
    @PathParam('hash') required this.hash,
  }) : super(
          key: key,
          backgroundColor: Colors.black,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Transaction Detail"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          onPressed: () {
            launchUrl(Uri.parse("${Env.baseExplorerUrl}/transaction/$hash"));
          },
          icon: const Icon(Icons.open_in_new),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webTransactionDetailProvider(hash));

    return data.when(
      loading: () => const CenteredLoader(),
      error: (_, __) => const Text("An error occurred"),
      data: (tx) => tx == null ? const Text("Error") : _TransactionDetails(tx),
    );
  }
}

class _TransactionDetails extends BaseComponent {
  final WebTransaction tx;
  const _TransactionDetails(this.tx, {Key? key}) : super(key: key);

  Future<void> copyToClipboard(String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    Toast.message("'$value' Copied to clipboard");
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final address = ref.read(webSessionProvider).keypair?.address;

    return SingleChildScrollView(
      child: buildContent(context, address, ref),
    );
  }

  // @override
  // Widget desktopBody(BuildContext context, WidgetRef ref) {
  //   final address = ref.read(webSessionProvider).keypair?.address;

  //   return SingleChildScrollView(
  //     child: buildContent(context, address),
  //   );
  // }

  Padding buildContent(BuildContext context, String? address, WidgetRef ref) {
    final DateFormat formatter = DateFormat('MM-dd-yyyy hh:mm a');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: CompleteSaleButton(
              tx: tx,
              fallbackWidget: SizedBox(),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCard(
              padding: 0,
              child: ListTile(
                title: SelectableText(tx.hash),
                subtitle: const Text("Tx Hash"),
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    copyToClipboard(tx.hash);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCard(
              padding: 0,
              child: ListTile(
                title: Text(formatter.format(tx.date)),
                subtitle: const Text("Date"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCard(
              padding: 0,
              child: ListTile(
                title: Text("${tx.height}"),
                subtitle: const Text("Block Height"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCard(
              padding: 0,
              child: ListTile(
                title: Text(tx.typeLabel),
                subtitle: const Text("Tx Type"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCard(
              padding: 0,
              child: ListTile(
                title: SelectableText("${tx.toAddress} ${address == tx.toAddress ? '[ME]' : ''}"),
                subtitle: const Text("To"),
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    copyToClipboard(tx.toAddress);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCard(
              padding: 0,
              child: ListTile(
                title: SelectableText("${tx.fromAddress} ${address == tx.fromAddress ? '[ME]' : ''}"),
                subtitle: const Text("From"),
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    copyToClipboard(tx.fromAddress);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCard(
              padding: 0,
              child: ListTile(
                title: Text("${tx.subTxAmount ?? tx.amount} VFX"),
                subtitle: const Text("Amount"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCard(
              padding: 0,
              child: ListTile(
                title: Text("${tx.fee} VFX"),
                subtitle: const Text("Fee"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
