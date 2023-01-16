import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_wizard_grid.dart';

class SmartContractWizardScreen extends BaseScreen {
  const SmartContractWizardScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("NFT Collection Wizard"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: ScWizardGrid(),
    );
  }
}
