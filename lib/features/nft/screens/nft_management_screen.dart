import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/utils/validation.dart';

class NftMangementScreen extends BaseScreen {
  final Nft nft;
  const NftMangementScreen(this.nft, {Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Manage ${nft.name}"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
                "Manage Evolution",
                style: Theme.of(context).textTheme.headline5,
              ),
              Card(
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(
                        label: "Devolve",
                        variant: AppColorVariant.Danger,
                        icon: FontAwesomeIcons.chevronCircleDown,
                        onPressed: () async {
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
                        },
                      ),
                      AppButton(
                        label: "Evolve",
                        variant: AppColorVariant.Success,
                        icon: FontAwesomeIcons.chevronCircleUp,
                        onPressed: () async {
                          final confirmed = await ConfirmDialog.show(
                            title: "Evolve?",
                            body:
                                "Are you sure you want to evolve this NFT one stage?",
                            confirmText: "Evolve",
                            cancelText: "Cancel",
                          );
                          if (confirmed == true) {
                            //TODO: devolve that bad boy
                          }
                        },
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
              _EvolutionStateRow(),
              _EvolutionStateRow(),
              _EvolutionStateRow(),
            ],
          ),
        ],
      ),
    );
  }
}

class _EvolutionStateRow extends StatelessWidget {
  const _EvolutionStateRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Center(
                child: Text(
                  "1.",
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
                  Image.network(
                    "https://placekitten.com/300/300",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black38,
                  ),
                  AppButton(
                    label: "Open File",
                    type: AppButtonType.Text,
                    variant: AppColorVariant.Light,
                    onPressed: () {},
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
                    Text("Name: Gold",
                        style: Theme.of(context).textTheme.headline4),
                    Text("Value: 12",
                        style: Theme.of(context).textTheme.headline6),
                    Text(
                      "Nulla quis lorem ut libero malesuada feugiat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.",
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: AppButton(
                label: "Evolve",
                onPressed: () async {
                  final confirmed = await ConfirmDialog.show(
                    title: "Evolve?",
                    body: "Are you sure you want to evolve to stage 1?",
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
    );
  }
}
