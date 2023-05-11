import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_wizard_screen.dart';
import '../../../core/components/big_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/base_screen.dart';
import '../../../core/breakpoints.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/web_router.gr.dart';
import '../../../generated/assets.gen.dart';
import '../../web/components/web_no_wallet.dart';
import 'smart_contracts_screen.dart';

class WebSmartContractLandingScreen extends BaseScreen {
  const WebSmartContractLandingScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          // backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Create Smart Contract"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final keypair = ref.read(webSessionProvider).keypair;

    if (keypair == null) {
      return const WebNotWallet();
    }

    final isMobile = BreakPoints.useMobileLayout(context);

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
            color: Colors.black,
            border: Border(
                // top: BorderSide(color: Colors.white30, width: 2),
                // bottom: BorderSide(color: Colors.white30, width: 2),
                ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BigButton(
                    title: "Create a Smart Contract & Mint",
                    iconData: Icons.create,
                    body: "Start with a baseline smart contract and add customized features",
                    onPressed: () {
                      AutoRouter.of(context).push(const WebCreateSmartContractScreenRoute());
                    },
                  ),
                  BigButton(
                    title: "Mint NFT Collection",
                    iconData: Icons.auto_awesome,
                    body: "Mint multiple Smart Contracts into a collection",
                    onPressed: () {
                      AutoRouter.of(context).push(const WebBulkCreateScreenRoute());

                      // AutoRouter.of(context).push(WebSmartContractWizardScreenRoute());
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => const SmartContractWizardScreen()),
                      // );
                    },
                  ),
                  BigButton(
                    title: "Launch IDE",
                    iconData: Icons.code,
                    body: "Open the online IDE to write your own Trillium code for your smart contract",
                    onPressed: () async {
                      if (isMobile) {
                        final confirmed = await ConfirmDialog.show(
                            title: "Launch IDE on mobile?",
                            body: "The IDE is optimized for larger screens. Would you like to proceed?",
                            confirmText: "Launch IDE");
                        if (confirmed != true) {
                          return;
                        }
                      }

                      launchUrl(Uri.parse("https://trillium.rbx.network/"));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
