import 'dart:convert';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/env.dart';

class WebPaymentIFrameContainer extends StatefulWidget {
  final String fiatType;
  final double coinAmount;
  final String walletAddress;
  final double width;
  final double height;
  final String coinType;

  const WebPaymentIFrameContainer({
    super.key,
    this.fiatType = "USD",
    required this.coinAmount,
    required this.walletAddress,
    this.width = 400,
    this.height = 400,
    this.coinType = 'rbx',
  });

  @override
  State<WebPaymentIFrameContainer> createState() => _WebPaymentIFrameContainerState();
}

class _WebPaymentIFrameContainerState extends State<WebPaymentIFrameContainer> {
  late Widget iframeWidget;

  final IFrameElement iframeElement = IFrameElement();

  String? error;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() {
    if (Env.paymentDomain == null) {
      print("Payment not available in this environment");
      setState(() {
        error = "Payment not available in this environment";
      });
      return;
    }

    iframeElement.height = '${widget.width}';
    iframeElement.width = '${widget.height}';
    iframeElement.src = kDebugMode ? "/assets/html/payment.html" : "/assets/assets/html/payment.html";
    iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => iframeElement,
    );

    iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );

    iframeElement.onLoad.listen((event) {
      final payload = {
        "width": widget.width,
        "height": widget.height,
        "fiatType": widget.fiatType,
        "coinType": widget.coinType,
        "coinAmount": widget.coinAmount,
        "walletAddress": widget.walletAddress,
      };

      Future.delayed(Duration(milliseconds: 500)).then((value) {
        iframeElement.contentWindow?.postMessage(jsonEncode(payload), "*");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(color: Colors.black),
      child: error != null ? Center(child: Text(error!)) : iframeWidget,
    );
  }
}
