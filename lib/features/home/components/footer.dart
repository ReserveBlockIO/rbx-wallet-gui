import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends BaseComponent {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
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
              Text(
                "RBXWallet v$APP_VERSION ${Env.isTestNet ? '[TESTNET]' : ''}",
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 9,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
