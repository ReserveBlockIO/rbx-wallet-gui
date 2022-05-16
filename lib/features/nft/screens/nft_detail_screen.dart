import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/modals/nft_management_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/modals/code_modal.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class NftDetailScreen extends BaseScreen {
  // final Nft nft;
  final String id;
  const NftDetailScreen(this.id, {Key? key}) : super(key: key);

  void copyToClipboard(String val) async {
    await Clipboard.setData(
      ClipboardData(text: val),
    );
    Toast.message("$val copied to clipboard");
  }

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final nft = ref.watch(nftDetailProvider(id));

    return AppBar(
      title: nft != null ? Text(nft.name) : Text("NFT"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        if (nft != null)
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
    final _provider = ref.watch(nftDetailProvider(id).notifier);
    final nft = ref.watch(nftDetailProvider(id));

    if (nft == null) {
      return Container();
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(
          //   "Name: ${nft.name}",
          //   style: Theme.of(context)
          //       .textTheme
          //       .headline5!
          //       .copyWith(color: Colors.white),
          // ),
          Text(
            nft.description,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(nft.id),
                  subtitle: Text("Contract Address"),
                  leading: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      copyToClipboard(nft.id);
                    },
                  ),
                ),
              ),
              if (nft.minterAddress.isNotEmpty)
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(nft.minterAddress),
                    subtitle: Text("Minter Address"),
                    leading: IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        copyToClipboard(nft.minterAddress);
                      },
                    ),
                  ),
                ),
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(nft.address),
                  subtitle: Text("Owner Address"),
                  leading: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      copyToClipboard(nft.address);
                    },
                  ),
                ),
              ),
            ],
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
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(nft.primaryAsset.icon),
                            title: Text(nft.primaryAsset.fileType),
                            subtitle: Text("File Type"),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.line_weight),
                            contentPadding: EdgeInsets.zero,
                            title: Text(nft.primaryAsset.filesizeLabel),
                            subtitle: Text("File Size"),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                if (!nft.manageable)
                  AppButton(
                    label: "Manage",
                    icon: Icons.settings,
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.black87,
                        context: context,
                        builder: (context) {
                          return ModalContainer(
                            color: Colors.black26,
                            children: [NftMangementModal(nft.id)],
                          );
                        },
                      );
                    },
                  ),
                AppButton(
                  label: nft.isPublic ? "Make Private" : "Make Public",
                  icon: nft.isPublic ? Icons.visibility_off : Icons.visibility,
                  onPressed: () {
                    _provider.togglePrivate();
                  },
                ),
                if (nft.code != null)
                  AppButton(
                    label: "View Code",
                    icon: Icons.code,
                    variant: AppColorVariant.Primary,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CodeModal(nft.code!);
                        },
                      );
                    },
                  ),
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
