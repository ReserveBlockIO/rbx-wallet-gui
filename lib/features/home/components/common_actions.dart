import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import 'package:rbx_wallet/features/navigation/utils.dart';
import 'package:rbx_wallet/features/wallet/utils.dart';

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
              AppVerticalIconButton(
                label: "Add\nAddress",
                prettyIconType: PrettyIconType.custom,
                icon: Icons.add,
                onPressed: () async {
                  await AccountUtils.promptVfxOrBtc(rootNavigatorKey.currentContext!, ref);
                },
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Add\nVault",
                icon: Icons.security,
                prettyIconType: PrettyIconType.lock,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.reserve);
                },
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Add\nDomain",
                icon: Icons.link,
                prettyIconType: PrettyIconType.domain,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.adnr);
                },
                color: AppColors.getWhite(ColorShade.s200),
              ),
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
                label: "TX\nHistory",
                icon: Icons.history,
                prettyIconType: PrettyIconType.transactions,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.transactions);
                },
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Mint\nNFT",
                icon: Icons.lightbulb_outline,
                prettyIconType: PrettyIconType.nft,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.smartContracts);
                },
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Mint\nToken",
                prettyIconType: PrettyIconType.fungibleToken,
                icon: Icons.toll,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.tokens);
                },
                color: AppColors.getWhite(ColorShade.s200),
              ),
              AppVerticalIconButton(
                label: "Tokenize\nBTC",
                prettyIconType: PrettyIconType.bitcoin,
                icon: FontAwesomeIcons.bitcoin,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.vbtc);
                },
                color: AppColors.getWhite(ColorShade.s200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
