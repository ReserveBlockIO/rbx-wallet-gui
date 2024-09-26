import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:rbx_wallet/core/base_screen.dart';

class PriceChartScreen extends BaseScreen {
  const PriceChartScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Price History"),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return PriceChart();
  }
}

class PriceChart extends StatefulWidget {
  const PriceChart({super.key});

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  List<Candle> candles = [];
  bool themeIsDark = true;

  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
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

  void load() {
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse("https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>).map((e) => Candle.fromJson(e)).toList().reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Candlesticks(
      candles: candles,
    );
  }
}
