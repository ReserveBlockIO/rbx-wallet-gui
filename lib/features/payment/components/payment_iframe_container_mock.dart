import 'package:flutter/widgets.dart';

class WebPaymentIFrameContainer extends StatefulWidget {
  final String fiatType;
  final double coinAmount;
  final String walletAddress;
  final double width;
  final double height;

  const WebPaymentIFrameContainer({
    super.key,
    this.fiatType = "USD",
    required this.coinAmount,
    required this.walletAddress,
    this.width = 400,
    this.height = 400,
  });

  @override
  State<WebPaymentIFrameContainer> createState() => _WebPaymentIFrameContainerState();
}

class _WebPaymentIFrameContainerState extends State<WebPaymentIFrameContainer> {
  @override
  Widget build(BuildContext context) {
    return Text("Not available on this platform");
  }
}
