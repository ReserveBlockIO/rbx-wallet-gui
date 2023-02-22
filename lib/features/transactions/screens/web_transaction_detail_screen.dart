import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
            launchUrl(Uri.parse("${Env.explorerWebsiteBaseUrl}/transaction/$hash"));
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
    final address = ref.read(webSessionProvider).keypair?.public;

    return SingleChildScrollView(
      child: buildContent(context, address),
    );
  }

  // @override
  // Widget desktopBody(BuildContext context, WidgetRef ref) {
  //   final address = ref.read(webSessionProvider).keypair?.public;

  //   return SingleChildScrollView(
  //     child: buildContent(context, address),
  //   );
  // }

  Padding buildContent(BuildContext context, String? address) {
    final DateFormat formatter = DateFormat('MM-dd-yyyy hh:mm a');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.white10,
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
          Card(
            color: Colors.white10,
            child: ListTile(
              title: Text(formatter.format(tx.date)),
              subtitle: const Text("Date"),
            ),
          ),
          Card(
            color: Colors.white10,
            child: ListTile(
              title: Text("${tx.height}"),
              subtitle: const Text("Block Height"),
            ),
          ),
          Card(
            color: Colors.white10,
            child: ListTile(
              title: Text(tx.typeLabel),
              subtitle: const Text("Tx Type"),
            ),
          ),
          Card(
            color: Colors.white10,
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
          Card(
            color: Colors.white10,
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
          Card(
            color: Colors.white10,
            child: ListTile(
              title: Text("${tx.amount} RBX"),
              subtitle: const Text("Amount"),
            ),
          ),
          Card(
            color: Colors.white10,
            child: ListTile(
              title: Text("${tx.fee} RBX"),
              subtitle: const Text("Fee"),
            ),
          ),
          // ListTile(
          //   title: Text("${tx.nonce}"),
          //   subtitle: const Text("Nonce"),
          // ),
          // ListTile(
          //   title: Text(tx.signature),
          //   subtitle: const Text("Signature"),
          // ),
        ],
      ),
    );
  }
}
