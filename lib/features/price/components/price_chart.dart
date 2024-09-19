import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:http/http.dart' as http;

class PriceChart extends StatefulWidget {
  const PriceChart({super.key});

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  List<Candle> candles = [];
  bool themeIsDark = true;

  @override
  void initState() {
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
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
