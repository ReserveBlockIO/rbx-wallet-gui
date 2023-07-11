import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/big_button.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../../core/breakpoints.dart';
import '../../../core/web_router.gr.dart';
import '../../../generated/assets.gen.dart';
import '../../../utils/guards.dart';
import '../../nft/providers/nft_detail_provider.dart';
import '../../wallet/components/wallet_selector.dart';
import '../components/import_smart_contract_button.dart';
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
      title: const Text("Create Smart Contract"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
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
                _Buttons(),
                SizedBox(
                  height: 16,
                ),
                ImportSmartContractButton(
                  elevated: false,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Buttons extends BaseComponent {
  const _Buttons({
    super.key,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ButtonCreateSingle(),
        _ButtonMintCollection(),
        _ButtonMintToken(),
        _ButtonLaunchIDE(),
      ],
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _ButtonCreateSingle()),
              Expanded(child: _ButtonMintCollection()),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _ButtonMintToken()),
              Expanded(child: _ButtonLaunchIDE()),
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonLaunchIDE extends StatelessWidget {
  const _ButtonLaunchIDE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BigButton(
      title: "Launch IDE",
      iconData: Icons.code,
      body: "Open the online IDE to write your own Trillium code for your smart contract.",
      onPressed: () {
        launchUrl(Uri.parse("https://trillium.rbx.network/"));
      },
    );
  }
}

class _ButtonMintToken extends StatelessWidget {
  const _ButtonMintToken({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BigButton(
      title: "Mint Fungible Token",
      iconData: Icons.toll,
      body: "Create a token-based Smart Contract and mint the supply.",
      onPressed: () {
        AutoRouter.of(context).push(const EmbeddedTokenCreateScreenRoute());
      },
    );
  }
}

class _ButtonMintCollection extends StatelessWidget {
  const _ButtonMintCollection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BigButton(
      title: "Mint NFT Collection",
      iconData: Icons.auto_awesome,
      body: "Mint multiple Smart Contracts into a collection.",
      onPressed: () {
        AutoRouter.of(context).push(const BulkCreateScreenRoute());
      },
    );
  }
}

class _ButtonCreateSingle extends BaseComponent {
  const _ButtonCreateSingle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BigButton(
      title: "Single Smart Contract",
      iconData: Icons.create,
      body: "Start with a baseline smart contract and add customized features.",
      onPressed: () async {
        if (!kDebugMode) {
          if (!widgetGuardWalletIsSynced(ref)) {
            return;
          }
        }

        if (ref.read(sessionProvider).currentWallet?.isReserved == true) {
          Toast.error("Reserve Accounts cannot mint smart contracts");
          return;
        }

        ref.read(createSmartContractProvider.notifier).clearSmartContract();
        final id = await AutoRouter.of(context).push(const SmartContractCreatorContainerScreenRoute());

        if (id != null) {
          ref.read(nftDetailProvider("$id").notifier).init();
          ref.read(createSmartContractProvider.notifier).clearSmartContract();

          AutoRouter.of(context).push(NftDetailScreenRoute(id: "$id"));
        }
      },
    );
  }
}
