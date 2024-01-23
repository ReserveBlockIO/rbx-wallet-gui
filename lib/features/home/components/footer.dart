import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/app_constants.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/env.dart';
import '../../easter/secret_button.dart';

class Footer extends BaseComponent {
  final Color? backgroundColor;
  const Footer({Key? key, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: backgroundColor ?? Colors.black.withOpacity(.9),
      height: 70,
      child: Stack(
        children: [
          Padding(
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
                          launchUrl(Uri.parse("https://discord.com/invite/PnS2HRETDh"));
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.discord,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        iconSize: 16,
                        onPressed: () {
                          launchUrl(Uri.parse("https://github.com/ReserveBlockIO"));
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "RBXWallet version $APP_VERSION ${Env.isTestNet ? '[TESTNET]' : ''}",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 9,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SecretButton(
              onPressed: () {
                AutoRouter.of(context).push(const ConfigContainerScreenRoute());
              },
            ),
          )
        ],
      ),
    );
  }
}
