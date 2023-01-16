import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/sc_wizard_minting_progress_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/sc_wizard_provider.dart';
import '../../../core/base_screen.dart';
import '../components/sc_wizard_grid.dart';

class SmartContractWizardScreen extends BaseScreen {
  const SmartContractWizardScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

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
    return Column(
      children: [
        const Expanded(child: ScWizardGrid()),
        Container(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  label: "Compile & Mint",
                  onPressed: () {
                    ref.read(scWizardProvider.notifier).mint(context);
                  },
                  variant: AppColorVariant.Success,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
