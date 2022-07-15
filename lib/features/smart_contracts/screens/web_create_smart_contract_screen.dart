import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/smart_contract_creator_main.dart';
import 'package:rbx_wallet/features/web/components/web_no_wallet.dart';

class WebCreateSmartContractScreen extends BaseScreen {
  const WebCreateSmartContractScreen({Key? key})
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
    return const SmartContractCreatorMain();
  }
}
