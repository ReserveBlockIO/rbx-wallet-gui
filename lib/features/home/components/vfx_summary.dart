import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/core/theme/components.dart';

enum CoinPriceSummaryType {
  vfx("VFX", Color(0xFF73c4fa)),
  btc("BTC", Color(0xfff7931a)),
  ;

  final String label;
  final Color color;
  const CoinPriceSummaryType(this.label, this.color);
}

class CoinPriceSummary extends StatelessWidget {
  final CoinPriceSummaryType type;

  const CoinPriceSummary({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      fullHeight: true,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              type.label,
              style: TextStyle(
                fontSize: 28,
                color: type.color,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_drop_up,
                    color: Colors.transparent,
                    size: 64,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "0.11 USDT",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_up,
                    color: AppColors.getSpringGreen(),
                    size: 64,
                    shadows: [
                      Shadow(
                        color: Colors.white38,
                        blurRadius: 24,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                AppVerticalIconButton(
                  onPressed: () {},
                  icon: FontAwesomeIcons.chartLine,
                  label: "View\nChart",
                  iconScale: 0.8,
                ),
                AppVerticalIconButton(
                  onPressed: () {},
                  icon: FontAwesomeIcons.store,
                  label: "View\nTrades",
                  iconScale: 0.8,
                ),
                AppVerticalIconButton(
                  onPressed: () {},
                  icon: FontAwesomeIcons.coins,
                  label: "Get\nVFX",
                  iconScale: 0.8,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
