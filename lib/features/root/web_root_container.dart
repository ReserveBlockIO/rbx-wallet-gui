// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:rbx_wallet/app.dart';
// import 'package:rbx_wallet/core/web_router.gr.dart';
// import 'package:rbx_wallet/features/auth/screens/web_auth_screen.dart';

// class WebRootContainer extends StatelessWidget {
//   const WebRootContainer({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final List<PageRouteInfo> routes = [
//       WebAuthTabRouter(),
//       WebDashboardTabRouter(),
//     ];
//     return AutoTabsScaffold(
//       scaffoldKey: rootScaffoldKey,
//       routes: routes,
//       builder: (context, child, animated) {
//         return Column(
//           children: [
//             Expanded(
//               child: child,
//             )
//           ],
//         );
//       },
//     );
//   }
// }
