import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class NftMangementModal extends BaseComponent {
  final String id;
  const NftMangementModal(this.id, {Key? key}) : super(key: key);

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

    final success = await _provider.setEvolve(stage);
    if (success) {
      Toast.message("Evolve transaction sent successfully!");
    } else {
      Toast.error();
    }
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(nftDetailProvider(id).notifier);
    final nft = ref.watch(nftDetailProvider(id));

    if (nft == null) return Container();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return NftDetailScreen(nft.id);
                      },
                    ),
                  );
                },
                child: Text(
                  "View NFT",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "Managing ${nft.name}",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white),
          ),
          Divider(),
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
              Divider(),
              Text(
                nft.evolveIsDynamic ? "Evolution" : "Manage Evolution",
                style: Theme.of(context).textTheme.headline5,
              ),
              if (!nft.evolveIsDynamic)
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
                          icon: FontAwesomeIcons.chevronCircleDown,
                          onPressed: nft.currentEvolvePhase.evolutionState > 0
                              ? () async {
                                  devolve(context, ref);
                                }
                              : null,
                        ),
                        AppButton(
                          label: "Evolve",
                          variant: AppColorVariant.Success,
                          icon: FontAwesomeIcons.chevronCircleUp,
                          onPressed: nft.currentEvolvePhase.evolutionState <
                                  nft.evolutionPhases.length
                              ? () async {
                                  evolve(context, ref);
                                }
                              : null,
                        ),
                        AppButton(
                          label: "Set Evolution",
                          variant: AppColorVariant.Primary,
                          icon: FontAwesomeIcons.chevronCircleUp,
                          onPressed: () {
                            PromptModal.show(
                              title: "Evolve To",
                              validator: (value) =>
                                  formValidatorNotEmpty(value, "Value"),
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
              _EvolutionStateRow(
                nft.baseEvolutionPhase,
                nftId: id,
                isDynamic: nft.evolveIsDynamic,
                index: 0,
              ),
              ...nft.evolutionPhases
                  .asMap()
                  .entries
                  .map((entry) => _EvolutionStateRow(
                        entry.value,
                        nftId: id,
                        isDynamic: nft.evolveIsDynamic,
                        index: entry.key + 1,
                      ))
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}

class _EvolutionStateRow extends BaseComponent {
  final String nftId;
  final EvolvePhase phase;
  final int index;
  final bool isDynamic;
  const _EvolutionStateRow(
    this.phase, {
    Key? key,
    required this.nftId,
    required this.isDynamic,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Container(
        color: phase.isCurrentState && !isDynamic
            ? Theme.of(context).colorScheme.success
            : Colors.transparent,
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
                            Image.file(
                              phase.asset!.file,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          if (phase.asset == null)
                            SizedBox(
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
                              onPressed: () {
                                openFile(phase.asset!.location);
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
                            Text("Name: ${phase.name}",
                                style: Theme.of(context).textTheme.headline4),
                            Text(
                              phase.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isDynamic)
                      SizedBox(
                        width: 100,
                        child: AppButton(
                          label: "Evolve",
                          onPressed: phase.isCurrentState
                              ? null
                              : () async {
                                  final confirmed = await ConfirmDialog.show(
                                    title: "Evolve?",
                                    body:
                                        "Are you sure you want to evolve to stage $index?",
                                    confirmText: "Evolve",
                                    cancelText: "Cancel",
                                  );
                                  if (confirmed == true) {
                                    final _provider = ref.read(
                                        nftDetailProvider(nftId).notifier);

                                    final success =
                                        await _provider.setEvolve(index);

                                    if (success) {
                                      Toast.message(
                                          "Evolve transaction sent successfully!");
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
