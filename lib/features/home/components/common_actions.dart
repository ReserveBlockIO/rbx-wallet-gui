import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app.dart';
import '../../../core/base_component.dart';
import '../../../core/env.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/components.dart';
import '../../navigation/utils.dart';
import '../../wallet/utils.dart';

import '../../../core/theme/pretty_icons.dart';

class CommonActions extends BaseComponent {
  const CommonActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      padding: 6,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // AppVerticalIconButton(
              //   label: "Add\nAddress",
              //   prettyIconType: PrettyIconType.custom,
              //   icon: Icons.add,
              //   onPressed: () async {
              //     await AccountUtils.promptVfxOrBtc(rootNavigatorKey.currentContext!, ref);
              //   },
              //   color: AppColors.getWhite(ColorShade.s200),
              // ),
              // AppVerticalIconButton(
              //   label: "Add\nVault",
              //   icon: Icons.security,
              //   prettyIconType: PrettyIconType.lock,
              //   onPressed: () {
              //     RootContainerUtils.navigateToTab(context, RootTab.reserve);
              //   },
              //   color: AppColors.getWhite(ColorShade.s200),
              // ),
              // AppVerticalIconButton(
              //   label: "Add\nDomain",
              //   icon: Icons.link,
              //   prettyIconType: PrettyIconType.domain,
              //   onPressed: () {
              //     RootContainerUtils.navigateToTab(context, RootTab.adnr);
              //   },
              //   color: AppColors.getWhite(ColorShade.s200),
              // ),
              AppVerticalIconButton(
                label: "Send\nCoin",
                prettyIconType: PrettyIconType.send,
                icon: Icons.arrow_upward,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.send);
                },
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Receive\nCoin",
                icon: Icons.arrow_downward,
                prettyIconType: PrettyIconType.receive,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.receive);
                },
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Transfer",
                icon: Icons.history,
                prettyIconType: PrettyIconType.transactions,
                onPressed: () {},
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Tokens",
                prettyIconType: PrettyIconType.fungibleToken,
                icon: Icons.toll,
                onPressed: () {},
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Tutorials",
                prettyIconType: PrettyIconType.custom,
                icon: FontAwesomeIcons.video,
                iconScale: 0.7,
                onPressed: () {},
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Open\nExplorer",
                icon: Icons.open_in_browser,
                prettyIconType: PrettyIconType.custom,
                onPressed: () {
                  launchUrl(Uri.parse(Env.baseExplorerUrl));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
