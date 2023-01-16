import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../components/bulk_smart_contract_entry_list_tile.dart';
import '../models/bulk_smart_contract_entry.dart';
import '../providers/sc_wizard_provider.dart';
import 'smart_contract_wizard_screen.dart';
import '../../wallet/components/wallet_selector.dart';

class BulkCreateScreen extends BaseScreen {
  const BulkCreateScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Mint NFT Collection"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final items = ref.watch(scWizardProvider);

    if (items.isEmpty) {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Mint NFT Collection",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nihil enim hoc differt. Duo Reges: constructio interrete. Primum in nostrane potestate est, quid meminerimus? Quaerimus enim finem bonorum. Iam enim adesse poterit. Age sane, inquam.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white54,
                        blurRadius: 4,
                        // spreadRadius: 4,
                      )
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.75),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Collection Wizard",
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 500),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nihil enim hoc differt. Duo Reges: constructio interrete. Primum in nostrane potestate est, quid meminerimus?",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AppButton(
                            label: "Launch Wizard",
                            onPressed: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => SmartContractWizardScreen()),
                              );
                            },
                            variant: AppColorVariant.Success,
                            icon: Icons.auto_awesome,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white54,
                        blurRadius: 4,
                      )
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.75),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Upload CSV",
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 500),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nihil enim hoc differt. Duo Reges: constructio interrete. Primum in nostrane potestate est, quid meminerimus?",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppButton(
                                label: "Download Example CSV",
                                onPressed: () {},
                                variant: AppColorVariant.Light,
                                icon: Icons.download,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              AppButton(
                                label: "Download Template CSV",
                                onPressed: () {},
                                variant: AppColorVariant.Light,
                                icon: Icons.download,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AppButton(
                            label: "Upload CSV",
                            variant: AppColorVariant.Success,
                            icon: Icons.upload,
                            onPressed: () {
                              ref.read(scWizardProvider.notifier).uploadCsv();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final entry = items[index].entry;

                  return BulkSmartContractEntryListTile(entry: entry);
                }),
          ),
        ),
        Container(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  label: "Clear",
                  variant: AppColorVariant.Danger,
                  onPressed: () {
                    ref.read(scWizardProvider.notifier).clear();
                  },
                ),
                AppButton(
                  label: "Replace CSV",
                  variant: AppColorVariant.Primary,
                  onPressed: () {
                    ref.read(scWizardProvider.notifier).uploadCsv();
                  },
                ),
                AppButton(
                  label: "Compile & Mint",
                  variant: AppColorVariant.Success,
                  onPressed: () {
                    ref.read(scWizardProvider.notifier).mint();
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
