import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/core/theme/components.dart';

import '../models/price_data.dart';
import '../providers/price_detail_providers.dart';

enum CoinPriceSummaryType {
  vfx("VFX", Color(0xFF73c4fa)),
  btc("BTC", Color(0xfff7931a)),
  ;

  final String label;
  final Color color;
  const CoinPriceSummaryType(this.label, this.color);
}

class CoinPriceSummary extends BaseComponent {
  final CoinPriceSummaryType type;
  final List<Widget> actions;
  const CoinPriceSummary({
    super.key,
    required this.type,
    required this.actions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = type == CoinPriceSummaryType.vfx ? ref.watch(vfxPriceDataDetailProvider) : ref.watch(btcPriceDataDetailProvider);

    return AppCard(
      fullHeight: true,
      padding: 4,
      child: Center(
        // child: _CoinPriceSummaryContent(type: type),
        child: data.when(
          data: (priceData) {
            if (priceData == null) {
              return Text("Error Loading Data");
            }
            return _CoinPriceSummaryContent(
              type: type,
              data: priceData,
              actions: actions,
            );
          },
          error: (e, _) => Text("Error Loading Data"),
          loading: () => CenteredLoader(),
        ),
      ),
    );
  }
}

class _CoinPriceSummaryContent extends StatelessWidget {
  final PriceData data;
  final List<Widget> actions;
  const _CoinPriceSummaryContent({
    super.key,
    required this.type,
    required this.data,
    required this.actions,
  });

  final CoinPriceSummaryType type;

  @override
  Widget build(BuildContext context) {
    final isUp = data.percentChange1h > 0 && data.percentChange1h != 0;
    final isDown = data.percentChange1h < 0 && data.percentChange1h != 0;
    final noChange = data.percentChange1h == 0;

    late final IconData changeIconData;
    late final Color changeColor;
    late final String changeTooltip;
    if (isUp) {
      changeIconData = Icons.arrow_drop_up;
      changeColor = AppColors.getSpringGreen();
      changeTooltip = "${data.percentChange1h.toStringAsFixed(2)}% (1h)";
    } else if (isDown) {
      changeIconData = Icons.arrow_drop_down;
      changeColor = Colors.red.shade700;
      changeTooltip = "${(-data.percentChange1h).toStringAsFixed(2)}% (1h)";
    } else {
      changeIconData = Icons.refresh;
      changeColor = Theme.of(context).colorScheme.warning;
      changeTooltip = "0% (1h)";
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            type.label,
            style: TextStyle(
              fontSize: 22,
              color: type.color,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  changeIconData,
                  color: Colors.transparent,
                  size: 48,
                ),
                Opacity(
                  opacity: 0,
                  child: Transform.translate(
                    offset: Offset(-6, 0),
                    child: Text(
                      changeTooltip,
                      style: TextStyle(
                        fontSize: 14,
                        color: changeColor,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            color: Colors.white24,
                            blurRadius: 24,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "\$${data.usdtPrice.toStringAsFixed(4)}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  changeIconData,
                  color: changeColor,
                  size: 48,
                  shadows: [
                    Shadow(
                      color: Colors.white38,
                      blurRadius: 32,
                    )
                  ],
                ),
                Transform.translate(
                  offset: Offset(-6, 0),
                  child: Text(
                    changeTooltip,
                    style: TextStyle(
                      fontSize: 14,
                      color: changeColor,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          color: Colors.white24,
                          blurRadius: 24,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Wrap(
            spacing: 16,
            children: actions,
          )
        ],
      ),
    );
  }
}
