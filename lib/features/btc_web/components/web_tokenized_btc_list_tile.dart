import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/colors.dart';
import '../screens/web_tokenized_btc_detail_screen.dart';
import '../../../generated/assets.gen.dart';

import '../../../core/base_component.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/web_router.gr.dart';
import '../models/btc_web_vbtc_token.dart';

class WebTokenizedBtcListTile extends BaseComponent {
  const WebTokenizedBtcListTile({
    super.key,
    required this.token,
  });

  final BtcWebVbtcToken token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(webSessionProvider.select((v) => v.keypair?.address));
    final isOwner = address == token.ownerAddress;

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
              errorWidget: (context, _, __) {
                return Image.asset(
                  Assets.images.vbtcPng.path,
                  width: 100,
                  height: 100,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              "${token.name}${isOwner ? ' (Owner)' : ''}",
              style: TextStyle(
                fontSize: 22,
                color: token.ownerAddress.startsWith("xRBX") ? AppColors.getReserve() : Colors.white,
              ),
            ),
            subtitle: Text(
              "${address != null ? token.balanceForAddress(address) : token.globalBalance} vBTC",
              style: TextStyle(
                color: Theme.of(context).colorScheme.btcOrange,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              AutoRouter.of(context).push(
                WebTokenizedBtcDetailScreenRoute(scIdentifier: token.scIdentifier),
              );
            },
          ),
        ),
      ],
    );
  }
}
