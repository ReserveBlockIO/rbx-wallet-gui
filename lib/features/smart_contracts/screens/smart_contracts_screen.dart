import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

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
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Image.asset(
          Assets.images.gridBg.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black38,
            border: Border(
              top: BorderSide(color: Colors.white30, width: 2),
              bottom: BorderSide(color: Colors.white30, width: 2),
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // _BigButton(
                //   title: "Templated Smart Contract",
                //   iconData: FontAwesomeIcons.magic,
                //   body: "Start with a predefined smart contract template",
                //   onPressed: () {
                //     AutoRouter.of(context).push(TemplateChooserScreenRoute());
                //   },
                // ),
                _BigButton(
                  title: "Create a Smart Contract & Mint",
                  iconData: Icons.create,
                  body:
                      "Start with a basline smart contract and add customized features",
                  onPressed: () async {
                    final id = await AutoRouter.of(context)
                        .push(const SmartContractCreatorContainerScreenRoute());

                    if (id != null) {
                      ref.read(nftDetailProvider("$id").notifier).init();
                      ref
                          .read(createSmartContractProvider.notifier)
                          .clearSmartContract();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return NftDetailScreen("$id");
                          },
                        ),
                      );
                    }
                  },
                ),
                _BigButton(
                  title: "Launch IDE",
                  iconData: Icons.code,
                  body:
                      "Open the online IDE to write your own Trillium code for your smart contract",
                  onPressed: () {
                    launchUrl(Uri.parse("https://trillium.rbx.network/"));
                  },
                ),
                // _BigButton(
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

class _BigButton extends StatelessWidget {
  final String title;
  final String body;
  final IconData iconData;
  final Function() onPressed;
  const _BigButton({
    Key? key,
    required this.title,
    required this.body,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              width: 3),
          boxShadow: const [
            BoxShadow(blurRadius: 12.0, color: Colors.white12),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    size: 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      body,
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
