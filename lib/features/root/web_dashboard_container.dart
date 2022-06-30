import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';

GlobalKey<ScaffoldState> webDashboardScaffoldKey = GlobalKey<ScaffoldState>();

class WebRouteIndex {
  static get home => 0;
  static get send => 1;
  static get nfts => 2;
}

class WebDashboardContainer extends StatelessWidget {
  WebDashboardContainer({Key? key}) : super(key: key);

  final List<PageRouteInfo> routes = [
    const WebHomeTabRouter(),
    const WebSendTabRouter(),
    const WebNftTabRouter()
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

class _ContentWrapper extends StatelessWidget {
  final Widget child;

  const _ContentWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
