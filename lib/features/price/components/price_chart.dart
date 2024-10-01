import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/currency_segmented_button.dart';
import 'package:rbx_wallet/core/providers/currency_segmented_button_provider.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/theme/colors.dart';
import '../models/price_history_item.dart';

class PriceChartScreen extends BaseScreen {
  const PriceChartScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(currencySegementedButtonProvider);

    return AppBar(
      title: Text(mode == CurrencyType.btc ? "BTC Price History" : "VFX Price History"),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: CurrencySegementedButton(
              includeAny: false,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(currencySegementedButtonProvider);

    if (mode == CurrencyType.btc) {
      return PriceChart(
        key: Key("btc_chart"),
        isBtc: true,
      );
    }
    return PriceChart(
      key: Key("vfx_chart"),
      isBtc: false,
    );
  }
}

class PriceChart extends StatefulWidget {
  final bool isBtc;
  const PriceChart({super.key, required this.isBtc});

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  late final Timer timer;
  bool ready = true;
  List<PriceHistoryItem> items = [];

  late final TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: const InteractiveTooltip(format: 'point.x : point.y'),
    );
    timer = Timer.periodic(Duration(seconds: 60), (timer) {
      load();
    });
    load();

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> load() async {
    final results = await ExplorerService().listPriceHistory(widget.isBtc ? 'btc' : 'vfx');

    if (results.isNotEmpty) {
      setState(() {
        items = results;
        ready = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      // title: ChartTitle(text: widget.isBtc ? "BTC Price History" : "VFX Price History"),
      primaryXAxis: DateTimeAxis(
        majorGridLines: MajorGridLines(width: 0),
        intervalType: DateTimeIntervalType.days,
      ),
      primaryYAxis: NumericAxis(
        // minimum: 1,
        // maximum: 1.35,
        // interval: 0.05,
        labelFormat: r'${value}',
        title: AxisTitle(text: 'USDT'),
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
      ),
      series: [
        LineSeries<PriceHistoryItem, DateTime>(
          dataSource: items,
          xValueMapper: (item, _) => item.dateTime,
          yValueMapper: (item, _) => item.value,
          color: widget.isBtc ? AppColors.getBtc() : AppColors.getBlue(),
          width: 1,
        ),
      ],
      trackballBehavior: _trackballBehavior,
    );
  }
}
