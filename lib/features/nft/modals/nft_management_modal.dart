import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/validation.dart';

class NftMangementModal extends BaseComponent {
  final String id;
  const NftMangementModal(this.id, {Key? key}) : super(key: key);

  // @override
  // AppBar? appBar(BuildContext context, WidgetRef ref) {
  //   final nft = ref.watch(nftDetailProvider(id));
  //   return AppBar(
  //     title: Text("Manage ${nft != null ? nft.name : 'NFT'}"),
  //     backgroundColor: Colors.black12,
  //     shadowColor: Colors.transparent,
  //   );
  // }

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
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          Text(
            "Managing ${nft.name}",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white),
          ),
          Divider(),
          if (nft.canEvolve)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Evolution History",
                  style: Theme.of(context).textTheme.headline5,
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Stage 1 (Stage Name)"),
                  subtitle: Text("01/01/2022 12:03 AM"),
                ),
              ],
            ),
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
                                  final confirmed = await ConfirmDialog.show(
                                    title: "Devolve?",
                                    body:
                                        "Are you sure you want to devolve this NFT one stage?",
                                    confirmText: "Devolve",
                                    cancelText: "Cancel",
                                  );
                                  if (confirmed == true) {
                                    //TODO: devolve that bad boy
                                  }
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
                                  final confirmed = await ConfirmDialog.show(
                                    title: "Evolve?",
                                    body:
                                        "Are you sure you want to evolve this NFT one stage?",
                                    confirmText: "Evolve",
                                    cancelText: "Cancel",
                                  );
                                  if (confirmed == true) {
                                    //TODO: evolve that bad boy
                                  }
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
                              onValidSubmission: (val) async {},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              _EvolutionStateRow(nft.baseEvolutionPhase,
                  isDynamic: nft.evolveIsDynamic),
              ...nft.evolutionPhases
                  .map((e) =>
                      _EvolutionStateRow(e, isDynamic: nft.evolveIsDynamic))
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}

class _EvolutionStateRow extends StatelessWidget {
  final EvolvePhase phase;
  final bool isDynamic;
  const _EvolutionStateRow(this.phase, {Key? key, required this.isDynamic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                        "Are you sure you want to evolve to stage 1?",
                                    confirmText: "Evolve",
                                    cancelText: "Cancel",
                                  );
                                  if (confirmed == true) {
                                    //TODO: evolve that bad boy
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
