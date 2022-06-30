import 'package:auto_route/auto_route.dart';
import 'package:rbx_wallet/features/auth/screens/web_auth_screen.dart';
import 'package:rbx_wallet/features/home/screens/web_home_screen.dart';
import 'package:rbx_wallet/features/nft/screens/web_nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/screens/web_nft_list_screen.dart';
import 'package:rbx_wallet/features/root/web_dashboard_container.dart';
import 'package:rbx_wallet/features/send/screens/web_send_screen.dart';

const List<AutoRoute> webRoutes = [
  // AutoRoute(initial: true, path: "", name: "WebAuthRoute", page: WebAuthScreen),
  AutoRoute(
    // initial: true,
    path: '',
    name: "WebAuthRouter",
    page: EmptyRouterPage,
    children: [
      AutoRoute(path: "", page: WebAuthScreen),
    ],
  ),
  webDashboardTabRouter,
  RedirectRoute(path: '*', redirectTo: '/'),
];

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route,Screen', routes: webRoutes)
class $WebRouter {}

const webDashboardTabRouter = AutoRoute(
  path: "dashboard",
  page: WebDashboardContainer,
  initial: true,
  children: [
    AutoRoute(
      initial: true,
      path: 'home',
      name: "WebHomeTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(initial: true, path: "", page: WebHomeScreen),
      ],
    ),
    AutoRoute(
      initial: true,
      path: 'send',
      name: "WebSendTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(initial: true, path: "", page: WebSendScreen),
      ],
    ),
    AutoRoute(
      initial: true,
      path: 'nfts',
      name: "WebNftTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(initial: true, path: "", page: WebNftListScreen),
        AutoRoute(path: "detail/:identifier", page: WebNftDetailScreen),
      ],
    ),
  ],
);
