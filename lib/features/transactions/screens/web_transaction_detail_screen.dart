import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/transactions/models/web_transaction.dart';
import 'package:rbx_wallet/features/transactions/providers/web_transaction_detail_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class WebTransactionDetailScreen extends BaseScreen {
  final String hash;

  const WebTransactionDetailScreen({
    Key? key,
    @PathParam('hash') required this.hash,
  }) : super(
          key: key,
          backgroundColor: Colors.black87,
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
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webTransactionDetailProvider(hash));

    return data.when(
      loading: () => CenteredLoader(),
      error: (_, __) => Text("An error occurred"),
      data: (tx) => tx == null ? Text("Error") : _TransactionDetails(tx),
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
    final address = ref.read(webSessionProvider).keypair?.public;

    return SingleChildScrollView(
      child: buildContent(context, address),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final address = ref.read(webSessionProvider).keypair?.public;

    return Center(
      child: buildContent(context, address),
    );
  }

  Padding buildContent(BuildContext context, String? address) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(tx.hash),
              subtitle: const Text("Tx Hash"),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  copyToClipboard(tx.hash);
                },
              ),
            ),
            ListTile(
              title: Text(tx.parseTimeStamp),
              subtitle: const Text("Date"),
            ),
            ListTile(
              title: Text("${tx.height}"),
              subtitle: const Text("Block Height"),
            ),
            ListTile(
              title: Text(tx.typeLabel),
              subtitle: const Text("Tx Type"),
            ),
            ListTile(
              title: Text("${tx.toAddress} ${address == tx.toAddress ? '[ME]' : ''}"),
              subtitle: const Text("To"),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  copyToClipboard(tx.toAddress);
                },
              ),
            ),
            ListTile(
              title: Text("${tx.fromAddress} ${address == tx.fromAddress ? '[ME]' : ''}"),
              subtitle: const Text("From"),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  copyToClipboard(tx.fromAddress);
                },
              ),
            ),
            ListTile(
              title: Text("${tx.amount} RBX"),
              subtitle: const Text("Amount"),
            ),
            ListTile(
              title: Text("${tx.fee} RBX"),
              subtitle: const Text("Fee"),
            ),
            ListTile(
              title: Text("${tx.nonce}"),
              subtitle: const Text("Nonce"),
            ),
            ListTile(
              title: Text(tx.signature),
              subtitle: const Text("Signature"),
            ),
          ],
        ),
      ),
    );
  }
}
