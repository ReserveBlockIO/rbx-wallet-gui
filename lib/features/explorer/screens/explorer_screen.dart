import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

class ExplorerScreen extends BaseStatefulScreen {
  const ExplorerScreen({Key? key}) : super(key: key);

  @override
  _ExplorerScreenState createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends BaseScreenState<ExplorerScreen> {
  bool _ready = false;

  @override
  AppBar? appBar(BuildContext context) {
    return AppBar(
      title: Text("Explorer"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [WalletSelector()],
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
