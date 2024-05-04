import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/components/tokenized_btc_action_buttons.dart';
import 'package:rbx_wallet/features/btc/providers/tokenized_btc_detail_provider.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class TokenizedBtcDetailScreen extends BaseScreen {
  final double tokenId;
  const TokenizedBtcDetailScreen({super.key, required this.tokenId});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenizedBtcDetailProvider(tokenId));

    if (token == null) {
      return AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
      );
    }

    return AppBar(
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      title: Text(token.tokenName),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Center(
            child: Text(
              "Balance: 0.0 BTC",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenizedBtcDetailProvider(tokenId));

    if (token == null) {
      return Center(
        child: Text("Token Not Found"),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: FutureBuilder<Nft?>(
                  future: NftService().retrieve(token.smartContractUid),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final nft = snapshot.data;

                      if (nft != null) {
                        final path = nft.currentEvolveAsset.localPath;
                        if (path != null) {
                          return Image.file(
                            File(path),
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          );
                        }
                      }
                    }
                    return Icon(FontAwesomeIcons.bitcoin);
                  }),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Token Details",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  _DetailRow(
                    label: "Name",
                    value: token.tokenName,
                  ),
                  _DetailRow(
                    label: "Description",
                    value: token.tokenDescription,
                  ),
                  _DetailRow(
                    label: "Owner",
                    value: token.rbxAddress,
                    withCopy: true,
                  ),
                  _DetailRow(
                    label: "BTC Address",
                    value: token.btcAddress ?? 'Not Generated',
                    withCopy: token.btcAddress != null,
                  ),
                  _DetailRow(
                    label: "Smart Contract ID",
                    value: token.smartContractUid,
                    withCopy: true,
                  ),
                  _DetailRow(
                    label: "Balance",
                    value: "0.0 BTC",
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Token Media",
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "This token does not contain any additional media.",
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.btcOrange.withOpacity(1),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TokenizedBtcActionButtons(token: token),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool withCopy;
  const _DetailRow({
    required this.label,
    required this.value,
    this.withCopy = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$label:",
            style: TextStyle(
              color: Theme.of(context).colorScheme.btcOrange,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Text(value),
          SizedBox(
            width: 6,
          ),
          if (withCopy)
            Transform.translate(
              offset: Offset(0, 2),
              child: InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: value));
                  Toast.message("$label copied to clipboard");
                },
                child: Icon(
                  Icons.copy,
                  size: 12,
                ),
              ),
            )
        ],
      ),
    );
  }
}
