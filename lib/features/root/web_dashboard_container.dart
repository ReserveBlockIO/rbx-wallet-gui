import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/chat/components/web_chat_notifier.dart';

import '../../core/base_component.dart';
import '../../core/env.dart';
import '../../core/web_router.gr.dart';
import 'navigation/components/web_drawer.dart';

GlobalKey<ScaffoldState> webDashboardScaffoldKey = GlobalKey<ScaffoldState>();

class WebRouteIndex {
  static get home => 0;
  static get send => 1;
  static get recieve => 2;
  static get transactions => 3;
  static get nfts => 4;
  static get smartContracts => 5;
  static get shop => 6;
  static get adnrs => 7;
}

class WebDashboardContainer extends StatelessWidget {
  WebDashboardContainer({Key? key}) : super(key: key);

  final List<PageRouteInfo> routes = [
    const WebHomeTabRouter(),
    const WebSendTabRouter(),
    const WebReceiveTabRouter(),
    const WebTransactionsTabRouter(),
    const WebNftTabRouter(),
    const WebSmartContractTabRouter(),
    const WebShopTabRouter(),
    const WebAdnrTabRouter(),
    const WebSignTxTabRouter(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: routes,
      scaffoldKey: webDashboardScaffoldKey,
      builder: (context, child, animated) => _ContentWrapper(
        child: child,
      ),
    );
  }
}

class _ContentWrapper extends BaseComponent {
  final Widget child;

  const _ContentWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (Env.isTestNet)
          Container(
            width: double.infinity,
            color: Colors.green.shade800,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child: Text(
                  "RBX TESTNET",
                  style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        if (kIsWeb) WebChatNotifier(ref: ref, address: ref.watch(webSessionProvider).keypair?.address),
        if (!kIsWeb) WebChatNotifier(ref: ref, address: ref.watch(sessionProvider).currentWallet?.address),
        Expanded(
          child: Row(
            children: [
              Container(
                width: 250,
                decoration: const BoxDecoration(color: Colors.black87),
                child: WebMenu(),
              ),
              Expanded(child: child),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      if (Env.isTestNet)
        Container(
          width: double.infinity,
          color: Colors.green.shade800,
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Center(
              child: Text(
                "RBX TESTNET",
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      if (kIsWeb) WebChatNotifier(ref: ref, address: ref.watch(webSessionProvider).keypair!.address),
      Expanded(child: child),
    ]);
  }
}
