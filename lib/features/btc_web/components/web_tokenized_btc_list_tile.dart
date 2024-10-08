import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc_web/screens/web_tokenized_btc_detail_screen.dart';

import '../models/btc_web_vbtc_token.dart';

class WebTokenizedBtcListTile extends StatelessWidget {
  const WebTokenizedBtcListTile({
    super.key,
    required this.token,
  });

  final BtcWebVbtcToken token;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: token.imageUrl,
              height: 100,
              width: 100,
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              token.name,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            subtitle: Text(
              token.ownerAddress,
              style: TextStyle(
                color: token.ownerAddress.startsWith("xRBX") ? Colors.deepPurple.shade200 : null,
                fontSize: 16,
              ),
            ),
            trailing: Text(
              "${token.globalBalance} vBTC",
              style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => WebTokenizedBtcDetailScreen(scIdentifier: token.scIdentifier),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
