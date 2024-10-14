import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/big_button.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/components/back_to_home_button.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../../core/web_router.gr.dart';
import '../../../utils/guards.dart';
import '../../nft/providers/nft_detail_provider.dart';
import '../providers/create_smart_contract_provider.dart';

class SmartContractsScreen extends BaseScreen {
  const SmartContractsScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Smart Contracts"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
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
            border: Border(
                // top: BorderSide(color: Colors.white30, width: 2),
                // bottom: BorderSide(color: Colors.white30, width: 2),
                ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // BigButton(
                //   title: "Templated Smart Contract",
                //   iconData: FontAwesomeIcons.magic,
                //   body: "Start with a predefined smart contract template",
                //   onPressed: () {
                //     AutoRouter.of(context).push(TemplateChooserScreenRoute());
                //   },
                // ),
                BigButton(
                  title: "Create a Smart Contract & Mint",
                  iconData: Icons.receipt_long,
                  body: "Start with a baseline smart contract and add customized features",
                  onPressed: () async {
                    if (!kDebugMode) {
                      if (!widgetGuardWalletIsSynced(ref)) {
                        return;
                      }
                    }

                    if (ref.read(sessionProvider).btcSelected) {
                      Toast.error("Please choose a VFX account to begin creating a smart contract.");
                      return;
                    }

                    if (ref.read(sessionProvider).currentWallet?.isReserved == true) {
                      Toast.error("Vault Accounts cannot mint smart contracts");
                      return;
                    }

                    ref.read(createSmartContractProvider.notifier).clearSmartContract();
                    final id = await AutoRouter.of(context).push(const SmartContractCreatorContainerScreenRoute());

                    if (id != null) {
                      ref.read(nftDetailProvider("$id").notifier).init();
                      ref.read(createSmartContractProvider.notifier).clearSmartContract();

                      // AutoRouter.of(context).push(NftDetailScreenRoute(id: "$id"));
                    }
                  },
                ),
                // if (kDebugMode)
                BigButton(
                  title: "Mint NFT Collection",
                  iconData: Icons.auto_awesome,
                  body: "Mint multiple Smart Contracts into a collection",
                  onPressed: () {
                    AutoRouter.of(context).push(const BulkCreateScreenRoute());
                  },
                ),
                BigButton(
                  title: "Launch IDE",
                  iconData: Icons.code,
                  body: "Open the online IDE to write your own Trillium code for your smart contract",
                  onPressed: () {
                    launchUrl(Uri.parse("https://trillium.rbx.network/"));
                  },
                ),
                // BigButton(
                //   title: "My Smart Contracts",
                //   iconData: Icons.folder,
                //   body:
                //       "View existing smart contracts that you have compiled or continue where you left off with a saved draft",
                //   onPressed: () {
                //     AutoRouter.of(context).push(MySmartContractsScreenRoute());
                //   },
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
