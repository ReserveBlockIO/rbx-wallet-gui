import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import 'package:rbx_wallet/features/navigation/utils.dart';
import 'package:rbx_wallet/features/wallet/utils.dart';

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
                icon: Icons.add,
                onPressed: () async {
                  await AccountUtils.promptVfxOrBtc(rootNavigatorKey.currentContext!, ref);
                },
                size: AppVerticalIconButtonSize.sm,
                color: AppColors.getWhite(ColorShade.s200),
                hoverColor: AppColors.getWhite(),
              ),
              AppVerticalIconButton(
                label: "Add\nVault",
                icon: Icons.security,
                size: AppVerticalIconButtonSize.sm,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.reserve);
                },
                color: AppColors.getWhite(ColorShade.s200),
                hoverColor: AppColors.getWhite(),
              ),
              AppVerticalIconButton(
                label: "Add\nDomain",
                icon: Icons.link,
                size: AppVerticalIconButtonSize.sm,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.adnr);
                },
                color: AppColors.getWhite(ColorShade.s200),
                hoverColor: AppColors.getWhite(),
              ),
              AppVerticalIconButton(
                label: "Send\nCoin",
                icon: Icons.arrow_upward,
                size: AppVerticalIconButtonSize.sm,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.send);
                },
                color: AppColors.getWhite(ColorShade.s200),
                hoverColor: AppColors.getWhite(),
              ),
              AppVerticalIconButton(
                label: "Receive\nCoin",
                icon: Icons.arrow_downward,
                size: AppVerticalIconButtonSize.sm,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.receive);
                },
                color: AppColors.getWhite(ColorShade.s200),
                hoverColor: AppColors.getWhite(),
              ),
              AppVerticalIconButton(
                label: "TX\nHistory",
                icon: Icons.history,
                size: AppVerticalIconButtonSize.sm,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.transactions);
                },
                color: AppColors.getWhite(ColorShade.s200),
                hoverColor: AppColors.getWhite(),
              ),
              AppVerticalIconButton(
                label: "Mint\nNFT",
                icon: Icons.lightbulb_outline,
                size: AppVerticalIconButtonSize.sm,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.smartContracts);
                },
                color: AppColors.getWhite(ColorShade.s200),
                hoverColor: AppColors.getWhite(),
              ),
              AppVerticalIconButton(
                label: "Mint\nToken",
                icon: Icons.toll,
                size: AppVerticalIconButtonSize.sm,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.tokens);
                },
                color: AppColors.getWhite(ColorShade.s200),
                hoverColor: AppColors.getWhite(),
              ),
              AppVerticalIconButton(
                label: "Tokenize\nBTC",
                icon: FontAwesomeIcons.bitcoin,
                size: AppVerticalIconButtonSize.sm,
                onPressed: () {
                  RootContainerUtils.navigateToTab(context, RootTab.vbtc);
                },
                color: AppColors.getWhite(ColorShade.s200),
                hoverColor: AppColors.getWhite(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
