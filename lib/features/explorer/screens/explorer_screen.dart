import 'package:flutter/material.dart';

import '../../../core/base_screen.dart';
import '../../wallet/components/wallet_selector.dart';

class ExplorerScreen extends BaseStatefulScreen {
  const ExplorerScreen({Key? key}) : super(key: key);

  @override
  ExplorerScreenState createState() => ExplorerScreenState();
}

class ExplorerScreenState extends BaseScreenState<ExplorerScreen> {
  @override
  AppBar? appBar(BuildContext context) {
    return AppBar(
      title: const Text("Explorer"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    // final webview = await WebviewWindow.create();
    // webview.launch("https://rbx.network/");
    // setState(() {
    //   _ready = true;
    // });
  }

  // @override
  @override
  Widget build(BuildContext context) {
    // return WebViewPlatform.set;
    return Container();
  }
}
