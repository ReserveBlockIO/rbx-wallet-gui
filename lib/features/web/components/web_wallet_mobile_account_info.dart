import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/colors.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/components.dart';
import '../../transactions/models/web_transaction.dart';
import '../providers/account_info_visible_provider.dart';

class WebMobileAccountInfo extends BaseComponent {
  const WebMobileAccountInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionModel = ref.watch(webSessionProvider);
    final visibilityProvider = ref.read(webMobileAccountInfoVisibleProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            visibilityProvider.setVisible(0);
          },
          child: AppCard(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            fullWidth: true,
            padding: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/cube_still.png",
                  width: 32,
                  height: 32,
                ),
                Text(
                  '${(sessionModel.balance ?? 0) + (sessionModel.raBalance ?? 0)} VFX',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.getBlue(),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            visibilityProvider.setVisible(1);
          },
          child: AppCard(
            margin: EdgeInsets.symmetric(vertical: 8),
            fullWidth: true,
            padding: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/vbtc_small.png",
                  width: 32,
                  height: 32,
                ),
                Text(
                  '0 vBTC',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.getWhite(),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            visibilityProvider.setVisible(2);
          },
          child: AppCard(
            margin: EdgeInsets.symmetric(vertical: 8),
            fullWidth: true,
            padding: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  FontAwesomeIcons.bitcoin,
                  color: AppColors.getBtc(),
                  size: 28,
                ),
                Text(
                  '${(sessionModel.btcBalanceInfo?.btcBalance ?? 0)} BTC',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.getBtc(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
