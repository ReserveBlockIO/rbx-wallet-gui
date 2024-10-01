
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../providers/sc_wizard_log_provider.dart';
import '../providers/sc_wizard_log_visible_provider.dart';
import '../../global_loader/global_loading_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../wallet/components/wallet_selector.dart';
import '../providers/sc_wizard_provider.dart';
import 'smart_contract_wizard_screen.dart';

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
    return Stack(
      children: [
        SingleChildScrollView(
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
              // Padding(
              //   padding: const EdgeInsets.all(16),
              //   child: Center(
              //     child: ConstrainedBox(
              //       constraints: const BoxConstraints(maxWidth: 500),
              //       child: const Text(
              //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nihil enim hoc differt. Duo Reges: constructio interrete. Primum in nostrane potestate est, quid meminerimus? Quaerimus enim finem bonorum. Iam enim adesse poterit. Age sane, inquam.",
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
              // ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.white54,
                          blurRadius: 4,
                          // spreadRadius: 4,
                        )
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.75),
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Collection Wizard",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(16),
                          //   child: Center(
                          //     child: ConstrainedBox(
                          //       constraints: const BoxConstraints(maxWidth: 500),
                          //       child: const Text(
                          //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nihil enim hoc differt. Duo Reges: constructio interrete. Primum in nostrane potestate est, quid meminerimus?",
                          //         textAlign: TextAlign.center,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: AppButton(
                              label: "Launch Wizard",
                              onPressed: () async {
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SmartContractWizardScreen()),
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
                constraints: const BoxConstraints(maxWidth: 600),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.white54,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.75),
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Upload JSON / CSV",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 500),
                                child: const Text(
                                  "Create a collection with a JSON or CSV file. See the example files below and use them as a template. Upon uploading the file you will be able to configure and tweak the settings through the wizard's UI.\n\nThis is an advanced feature for users who want to compile and mint collections outside of the graphical user interface.",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "JSON",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    AppButton(
                                      label: "Download Example JSON",
                                      onPressed: () {
                                        launchUrlString(
                                            "https://firebasestorage.googleapis.com/v0/b/vfx-storage.appspot.com/o/nft-metadata-example.json?alt=media&token=6ce020f6-81e4-49ce-aa52-983f51a077f7");
                                      },
                                      variant: AppColorVariant.Light,
                                      icon: Icons.download,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: AppButton(
                                        label: "Upload JSON",
                                        variant: AppColorVariant.Success,
                                        icon: Icons.upload,
                                        onPressed: () async {
                                          if (kIsWeb) {
                                            ref
                                                .read(globalLoadingProvider
                                                    .notifier)
                                                .start();
                                          } else {
                                            ref
                                                .read(scWizardLogVisibleProvider
                                                    .notifier)
                                                .start();
                                          }

                                          final shouldPush = await ref
                                              .read(scWizardProvider.notifier)
                                              .uploadJson();
                                          if (kIsWeb) {
                                            ref
                                                .read(globalLoadingProvider
                                                    .notifier)
                                                .complete();
                                          } else {
                                            ref
                                                .read(scWizardLogVisibleProvider
                                                    .notifier)
                                                .complete();
                                          }

                                          if (shouldPush == true) {
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SmartContractWizardScreen()),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "CSV",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    AppButton(
                                      label: "Download Example CSV",
                                      onPressed: () {
                                        // openFile(File(Assets.docs.nftMetadataExampleCsv));
                                        launchUrlString(
                                            "https://firebasestorage.googleapis.com/v0/b/vfx-storage.appspot.com/o/nft-metadata-example.csv?alt=media&token=3c6613c3-362b-4cda-982e-edf2757e1bdd");
                                      },
                                      variant: AppColorVariant.Light,
                                      icon: Icons.download,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: AppButton(
                                        label: "Upload CSV",
                                        variant: AppColorVariant.Success,
                                        icon: Icons.upload,
                                        onPressed: () async {
                                          if (kIsWeb) {
                                            ref
                                                .read(globalLoadingProvider
                                                    .notifier)
                                                .start();
                                          } else {
                                            ref
                                                .read(scWizardLogVisibleProvider
                                                    .notifier)
                                                .start();
                                          }

                                          final shouldPush = await ref
                                              .read(scWizardProvider.notifier)
                                              .uploadCsv();

                                          if (kIsWeb) {
                                            ref
                                                .read(globalLoadingProvider
                                                    .notifier)
                                                .complete();
                                          } else {
                                            ref
                                                .read(scWizardLogVisibleProvider
                                                    .notifier)
                                                .complete();
                                          }
                                          if (shouldPush == true) {
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SmartContractWizardScreen()),
                                            );
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (ref.watch(scWizardLogVisibleProvider)) ...[ScWizardLogWindow()]
      ],
    );

    // return Column(
    //   children: [
    //     Expanded(
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: ListView.builder(
    //             itemCount: items.length,
    //             itemBuilder: (context, index) {
    //               final entry = items[index].entry;

    //               return BulkSmartContractEntryListTile(entry: entry);
    //             }),
    //       ),
    //     ),
    //     Container(
    //       color: Colors.black54,
    //       child: Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             AppButton(
    //               label: "Clear",
    //               variant: AppColorVariant.Danger,
    //               onPressed: () {
    //                 ref.read(scWizardProvider.notifier).clear();
    //               },
    //             ),
    //             AppButton(
    //               label: "Replace CSV",
    //               variant: AppColorVariant.Primary,
    //               onPressed: () {
    //                 ref.read(scWizardProvider.notifier).uploadCsv();
    //               },
    //             ),
    //             AppButton(
    //               label: "Compile & Mint",
    //               variant: AppColorVariant.Success,
    //               onPressed: () {
    //                 ref.read(scWizardProvider.notifier).mint();
    //               },
    //             )
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}

class ScWizardLogWindow extends BaseComponent {
  const ScWizardLogWindow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(builder: (context) {
      final logs = ref.watch(scWizardLogProvider);

      return Container(
        color: Colors.black38,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Importing",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Container(
                width: 400,
                height: 300,
                decoration:
                    BoxDecoration(color: Colors.black87, boxShadow: glowingBox),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    controller:
                        ref.read(scWizardLogProvider.notifier).scrollController,
                    itemCount: logs.length,
                    itemBuilder: (context, index) {
                      final log = logs[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Container(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(log),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
