import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/env.dart';

class WebPaymentIFrameContainer extends StatefulWidget {
  const WebPaymentIFrameContainer({super.key});

  @override
  State<WebPaymentIFrameContainer> createState() => _WebPaymentIFrameContainerState();
}

class _WebPaymentIFrameContainerState extends State<WebPaymentIFrameContainer> {
  late Widget iframeWidget;

  final IFrameElement iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    iframeElement.height = '500';
    iframeElement.width = '500';

    iframeElement.src = Env.paymentEmbedUrl;
    // iframeElement.src = "https://www.reserveblock.io/";
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
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        height: 500,
        child: iframeWidget,
      ),
    );
  }
}
