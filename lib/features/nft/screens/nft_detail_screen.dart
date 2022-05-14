import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/components/nft_grid.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/validation.dart';

class NftDetailScreen extends BaseScreen {
  final Nft nft;
  const NftDetailScreen(this.nft, {Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(nft.name),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AppBadge(
              label: nft.isPublic ? "Public" : "Private",
              variant: nft.isPublic
                  ? AppColorVariant.Success
                  : AppColorVariant.Danger,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Name: ${nft.name}",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
          Text(
            "Description: ${nft.description}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Divider(),
          SelectableText(
            "Identifier: ${nft.id}",
            style: Theme.of(context).textTheme.caption,
          ),
          SelectableText(
            "Owner: ${nft.address}",
            style: Theme.of(context).textTheme.caption,
          ),
          Divider(),
          Text("Asset:", style: Theme.of(context).textTheme.headline5),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 512),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nft.primaryAsset.isImage
                        ? Image.file(
                            nft.primaryAsset.file,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          )
                        : Icon(Icons.file_present_outlined),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppButton(
                          label: "Open Folder",
                          icon: Icons.folder_open,
                          onPressed: () {
                            openFile(nft.primaryAsset.folder);
                          },
                        ),
                        SizedBox(width: 4),
                        AppButton(
                          label: "Open Asset",
                          icon: Icons.file_open,
                          onPressed: () {
                            openFile(nft.primaryAsset.location);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          Text("Features:", style: Theme.of(context).textTheme.headline5),
          if (nft.features.isEmpty) Text("No features"),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: nft.featureList
                .map(
                  (f) => ListTile(
                    leading: Icon(f.icon),
                    title: Text(f.nameLabel),
                    subtitle: Text(f.description),
                  ),
                )
                .toList(),
          ),
          Divider(),
          Text("Actions:", style: Theme.of(context).textTheme.headline5),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppButton(
                  label: "Transfer",
                  icon: Icons.send,
                  onPressed: () {
                    PromptModal.show(
                      title: "Transfer NFT",
                      validator: (value) => formValidatorRbxAddress(value),
                      labelText: "RBX Address",
                      confirmText: "Transfer",
                      onValidSubmission: (val) {
                        print(val);
                        //TODO: handle transfer
                      },
                    );
                  },
                ),
                SizedBox(width: 4),
                AppButton(
                  label: "Evolve",
                  icon: Icons.upgrade,
                  variant: AppColorVariant.Secondary,
                ),
                SizedBox(width: 4),
                AppButton(
                  label: "Burn",
                  icon: Icons.fire_hydrant,
                  variant: AppColorVariant.Danger,
                  onPressed: () async {
                    final confirmed = await ConfirmDialog.show(
                        title: "Burn NFT?",
                        body: "Are you sure you want to burn ${nft.name}",
                        destructive: true,
                        confirmText: "Burn",
                        cancelText: "Cancel");

                    if (confirmed == true) {
                      //TODO: handle burn
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
