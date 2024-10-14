import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/big_button.dart';
import '../../../core/components/back_to_home_button.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../wallet/components/wallet_selector.dart';

class DstLandingScreen extends BaseScreen {
  const DstLandingScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("P2P Auctions"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [
        WalletSelector(
          includeBtc: false,
          withOptions: false,
        )
      ],
      // leading: BackToHomeButton(),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        // Image.asset(
        //   Assets.images.gridBg.path,
        //   width: double.infinity,
        //   height: double.infinity,
        //   fit: BoxFit.cover,
        // ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black38,
            // border: Border(
            //   top: BorderSide(color: Colors.white30, width: 2),
            //   bottom: BorderSide(color: Colors.white30, width: 2),
            // ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BigButton(
                  title: "Connect to Auction House",
                  iconData: Icons.connect_without_contact,
                  body: "Connect to a remote auction house to trade NFTs.",
                  onPressed: () async {
                    // AutoRouter.of(context).push(RemoteShopListScreenRoute());
                    AutoRouter.of(context).push(RemoteShopContainerScreenRoute());
                  },
                ),
                BigButton(
                  title: "Manage my Auction House",
                  iconData: Icons.house,
                  body: "Manage your account's auction house and trade NFTs.",
                  onPressed: () async {
                    AutoRouter.of(context).push(MyCollectionsListScreenRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
