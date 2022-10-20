import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class NftMangementModal extends BaseComponent {
  final String id;
  final Nft nft;
  const NftMangementModal(this.id, this.nft, {Key? key}) : super(key: key);

  void evolve(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmDialog.show(
      title: "Evolve?",
      body: "Are you sure you want to evolve this NFT one stage?",
      confirmText: "Evolve",
      cancelText: "Cancel",
    );
    if (confirmed == true) {
      final _provider = ref.read(nftDetailProvider(id).notifier);
      final success = await _provider.evolve();
      if (success) {
        Toast.message("Evolve transaction sent successfully!");
        showEvolveMessage();
      } else {
        Toast.error();
      }
    }
  }

  void devolve(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmDialog.show(
      title: "Devolve?",
      body: "Are you sure you want to devolve this NFT one stage?",
      confirmText: "Devolve",
      cancelText: "Cancel",
    );
    if (confirmed == true) {
      final _provider = ref.read(nftDetailProvider(id).notifier);
      final success = await _provider.devolve();
      if (success) {
        Toast.message("Devolve transaction sent successfully!");
        showEvolveMessage();
      } else {
        Toast.error();
      }
    }
  }

  void setEvolve(
    BuildContext context,
    WidgetRef ref,
    int stage,
  ) async {
    final _provider = ref.read(nftDetailProvider(id).notifier);
    final _model = ref.read(nftDetailProvider(id));
    final success = await _provider.setEvolve(stage, _model!.currentOwner);
    if (success) {
      Toast.message("Evolve transaction sent successfully!");
      await showEvolveMessage();
      Navigator.of(context).pop();
    } else {
      Toast.error();
    }
  }

  Future<void> showEvolveMessage() async {
    await InfoDialog.show(
      title: "Evolve transaction sent successfully",
      body: "This screen will reflect the change once the block is crafted and block height has synced with this transaction.",
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // if (nft.isProcessing)
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         width: 16,
          //         height: 16,
          //         child: CircularProgressIndicator(
          //           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 8,
          //       ),
          //       Text("Evolve Transaction Processing..."),
          //     ],
          //   ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                label: "Close",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              AppButton(
                label: "View NFT",
                onPressed: () {
                  Navigator.of(context).pop();
                  // AutoRouter.of(context).push(NftDetailScreenRoute(id: nft.id));
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => NftDetailScreen(id: nft.id)));
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Managing ${nft.name}",
                style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
              ),
              Builder(builder: (context) {
                final nftIds = ref.watch(nftListProvider).data.results.map((n) => n.id).toList();

                if (nftIds.contains(nft.id)) {
                  return AppBadge(
                    label: "Owned by Me",
                    variant: AppColorVariant.Success,
                  );
                }

                return AppBadge(
                  label: "Transferred",
                  variant: AppColorVariant.Danger,
                );
              })
            ],
          ),
          // Text("Owner: ${nft.currentOwner} "),
          // Text("Minter: ${nft.minterAddress}"),
          SizedBox(
            height: 6,
          ),
          Text(
            "Current Stage: ${nft.currentEvolvePhase.name}",
            style: TextStyle(fontSize: 18),
          ),
          // if (nft.canEvolve)
          //   Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Evolution History",
          //         style: Theme.of(context).textTheme.headline5,
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.star),
          //         title: Text("Stage 0 (Base)"),
          //         subtitle: Text("05/15/2022 4:03 PM"),
          //       ),
          //     ],
          //   ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Text(
                nft.evolveIsDynamic ? "Evolution" : "Manage Evolution",
                style: Theme.of(context).textTheme.headline5,
              ),
              if (nft.manageable && false)
                Card(
                  color: Colors.white10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(
                          label: "Devolve",
                          variant: AppColorVariant.Danger,
                          icon: FontAwesomeIcons.circleChevronDown,
                          onPressed: nft.currentEvolvePhase.evolutionState + 1 > 0
                              ? () async {
                                  devolve(context, ref);
                                }
                              : null,
                        ),
                        AppButton(
                          label: "Evolve",
                          variant: AppColorVariant.Success,
                          icon: FontAwesomeIcons.circleChevronUp,
                          onPressed: nft.currentEvolvePhase.evolutionState <= nft.evolutionPhases.length
                              ? () async {
                                  evolve(context, ref);
                                }
                              : null,
                        ),
                        AppButton(
                          label: "Set Evolution",
                          variant: AppColorVariant.Primary,
                          icon: FontAwesomeIcons.circleChevronUp,
                          helpType: HelpType.setEvolution,
                          onPressed: () {
                            PromptModal.show(
                              title: "Evolve To",
                              validator: (value) => formValidatorNotEmpty(value, "Value"),
                              labelText: "Value",
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]"),
                                )
                              ],
                              onValidSubmission: (val) async {
                                final i = int.tryParse(val);
                                if (i != null) {
                                  setEvolve(context, ref, i);
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              EvolutionStateRow(
                nft.baseEvolutionPhase,
                nft: nft,
                nftId: id,
                canManageEvolve: nft.manageable,
                index: 0,
              ),
              ...nft.updatedEvolutionPhases
                  .asMap()
                  .entries
                  .map(
                    (entry) => EvolutionStateRow(
                      entry.value,
                      nft: nft,
                      nftId: id,
                      canManageEvolve: nft.manageable,
                      index: entry.key + 1,
                    ),
                  )
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}

class EvolutionStateRow extends BaseComponent {
  final String nftId;
  final Nft nft;
  final EvolvePhase phase;
  final int index;
  final bool canManageEvolve;
  const EvolutionStateRow(
    this.phase, {
    Key? key,
    required this.nftId,
    required this.nft,
    required this.canManageEvolve,
    required this.index,
  }) : super(key: key);

  Future<void> showEvolveMessage() async {
    InfoDialog.show(
      title: "Evolve transaction sent successfully",
      body: "This screen will reflect the change once the block is crafted and block height has synced with this transaction.",
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String descriptionText = phase.description;

    if (phase.dateTime != null) {
      descriptionText =
          "Evolve Date: ${phase.dateLabelLocalized} ${phase.timeLabelLocalized} ${DateTime.now().timeZoneName.toString()} \n${phase.description}";
    } else if (phase.blockHeight != null) {
      descriptionText = "Evolve Block Height: ${phase.blockHeight}\n${phase.description}";
    }

    // final isCurrent = nft.currentEvolvePhase.evolutionState + 1 == index;
    // final isCurrent = nft.currentEvolveAsset.localPath == phase.asset!.localPath;
    // const isCurrent = false; // TEMP
    final isCurrent = phase.isCurrentState;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Container(
        color: isCurrent ? Theme.of(context).colorScheme.success : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            color: Colors.black,
            child: Card(
              color: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Center(
                        child: Text(
                          "${phase.evolutionState}.",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          if (phase.asset != null && phase.asset!.isImage)
                            phase.asset!.localPath != null
                                ? Image.file(
                                    File(phase.asset!.localPath!),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Text(""),
                          if (phase.asset == null)
                            const SizedBox(
                              width: 100,
                              height: 100,
                            ),
                          Container(
                            color: Colors.black38,
                          ),
                          if (phase.asset != null)
                            AppButton(
                              label: "Open File",
                              type: AppButtonType.Text,
                              variant: AppColorVariant.Light,
                              onPressed: () async {
                                final path = await SmartContractService().getAssetPath(nftId, phase.asset!.name!);
                                if (path != null) {
                                  openFile(File(path));
                                }
                              },
                            )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${phase.name}", style: Theme.of(context).textTheme.headline4),
                            Text(
                              descriptionText,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (canManageEvolve)
                      SizedBox(
                        width: 100,
                        child: AppButton(
                          label: "Evolve",
                          onPressed: isCurrent
                              ? null
                              : () async {
                                  final confirmed = await ConfirmDialog.show(
                                    title: "Evolve?",
                                    body: "Are you sure you want to evolve to stage $index?",
                                    confirmText: "Evolve",
                                    cancelText: "Cancel",
                                  );
                                  if (confirmed == true) {
                                    final _provider = ref.read(nftDetailProvider(nftId).notifier);
                                    final _model = ref.read(nftDetailProvider(nftId));

                                    final success = await _provider.setEvolve(index, _model!.currentOwner);

                                    if (success) {
                                      Toast.message("Evolve transaction sent successfully!");
                                      await showEvolveMessage();
                                      Navigator.of(context).pop();
                                    } else {
                                      Toast.error();
                                    }
                                  }
                                },
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
