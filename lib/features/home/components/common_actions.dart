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
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            AppVerticalIconButton(
              label: "Add\nAccount",
              icon: Icons.add,
              onPressed: () async {
                await AccountUtils.promptVfxOrBtc(rootNavigatorKey.currentContext!, ref);
              },
              size: AppVerticalIconButtonSize.sm,
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Add\nVault",
              icon: Icons.security,
              size: AppVerticalIconButtonSize.sm,
              onPressed: () {
                RootContainerUtils.navigateToTab(context, RootTab.reserve);
              },
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Add\nDomain",
              icon: Icons.link,
              size: AppVerticalIconButtonSize.sm,
              onPressed: () {
                RootContainerUtils.navigateToTab(context, RootTab.adnr);
              },
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Send\nCoin",
              icon: Icons.arrow_upward,
              size: AppVerticalIconButtonSize.sm,
              onPressed: () {
                RootContainerUtils.navigateToTab(context, RootTab.send);
              },
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Receive\nCoin",
              icon: Icons.arrow_downward,
              size: AppVerticalIconButtonSize.sm,
              onPressed: () {
                RootContainerUtils.navigateToTab(context, RootTab.receive);
              },
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "TX\nHistory",
              icon: Icons.history,
              size: AppVerticalIconButtonSize.sm,
              onPressed: () {
                RootContainerUtils.navigateToTab(context, RootTab.transactions);
              },
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Mint\nNFT",
              icon: Icons.lightbulb_outline,
              size: AppVerticalIconButtonSize.sm,
              onPressed: () {
                RootContainerUtils.navigateToTab(context, RootTab.smartContracts);
              },
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Mint\nToken",
              icon: Icons.toll,
              size: AppVerticalIconButtonSize.sm,
              onPressed: () {
                RootContainerUtils.navigateToTab(context, RootTab.tokens);
              },
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Tokenize\nBTC",
              icon: FontAwesomeIcons.bitcoin,
              size: AppVerticalIconButtonSize.sm,
              onPressed: () {
                RootContainerUtils.navigateToTab(context, RootTab.vbtc);
              },
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
          ],
        ),
      ),
    );
  }
}
