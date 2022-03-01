import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends BaseComponent {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 12.0,
            children: [
              IconButton(
                iconSize: 16,
                onPressed: () {
                  launch("https://discord.com/invite/PnS2HRETDh");
                },
                icon: FaIcon(
                  FontAwesomeIcons.discord,
                  color: Colors.white,
                ),
              ),
              IconButton(
                iconSize: 16,
                onPressed: () {
                  launch("https://github.com/ReserveBlockIO");
                },
                icon: FaIcon(
                  FontAwesomeIcons.github,
                  color: Colors.white,
                ),
              )
            ],
          ),
          if (ref.read(sessionProvider).packageInfo != null)
            Text(
              "RBXWallet v${ref.read(sessionProvider).packageInfo!.version}",
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 9,
                  ),
            )
        ],
      ),
    );
  }
}
