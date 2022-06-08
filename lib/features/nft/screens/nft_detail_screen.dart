import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset_card.dart';
import 'package:rbx_wallet/features/asset/asset_thumbnail.dart';
import 'package:rbx_wallet/features/nft/components/nft_qr_code.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/modals/nft_management_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/modals/code_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/my_smart_contracts_provider.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class NftDetailScreen extends BaseScreen {
  final String id;
  final bool fromCreator;
  const NftDetailScreen(
    this.id, {
    Key? key,
    this.fromCreator = false,
  }) : super(key: key);

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
      title: nft != null ? Text(nft.currentEvolveName) : Text("NFT"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        if (nft != null)
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!nft.isPublished) HelpButton(HelpType.minting),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: AppBadge(
                    label: nft.isPublished ? "Minted" : "Minting...",
                    variant: nft.isPublished
                        ? AppColorVariant.Success
                        : AppColorVariant.Warning,
                    progressAnimation: !nft.isPublished,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: AppBadge(
                    label: nft.isPublic ? "Public" : "Private",
                    variant: nft.isPublic
                        ? AppColorVariant.Success
                        : AppColorVariant.Primary,
                  ),
                ),
              ],
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  nft.currentEvolveName,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 4,
                ),
                Text("ID: ${nft.id}"),
                SizedBox(
                  height: 4,
                ),
                if (nft.minterName.isNotEmpty)
                  Text(
                    "Minted By: ${nft.minterName}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  nft.currentEvolveDescription,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(nft.address),
                        subtitle: Text("Smart Contract Address"),
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
                  ],
                ),
                Divider(),
                Wrap(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Asset:",
                            style: Theme.of(context).textTheme.headline5),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 512),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AssetCard(nft.currentEvolveAsset),
                                  if (nft.additionalAssets.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Divider(),
                                          Text(
                                            "Additional Assets",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                          Wrap(
                                            children: nft.additionalAssets
                                                .map(
                                                  (a) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 6.0),
                                                    child: AssetThumbnail(a),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "QR Code:",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          NftQrCode(data: nft.explorerUrl),
                        ],
                      ),
                    )
                  ],
                ),
                Divider(),
                Text("Features:", style: Theme.of(context).textTheme.headline5),
                if (nft.features.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cancel,
                          size: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            "No features",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
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
              ],
            ),
          ),
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
                helpType: HelpType.transfer,
                icon: Icons.send,
                onPressed: nft.isPublished
                    ? () {
                        PromptModal.show(
                          title: "Transfer NFT",
                          validator: (value) => formValidatorRbxAddress(value),
                          labelText: "RBX Address",
                          confirmText: "Transfer",
                          onValidSubmission: (address) async {
                            final success = await _provider.transfer(address);
                            if (success) {
                              Toast.message(
                                  "Transfer transaction sent successfully!");
                            } else {
                              Toast.error();
                            }
                          },
                        );
                      }
                    : null,
              ),
              if (nft.manageable)
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
                helpType: HelpType.burn,
                variant: AppColorVariant.Danger,
                onPressed: nft.isPublished
                    ? () async {
                        final confirmed = await ConfirmDialog.show(
                          title: "Burn NFT?",
                          body: "Are you sure you want to burn ${nft.name}",
                          destructive: true,
                          confirmText: "Burn",
                          cancelText: "Cancel",
                        );

                        if (confirmed == true) {
                          final success = await _provider.burn();

                          if (success) {
                            Toast.message(
                                "Burn transaction sent successfully!");
                            ref.read(mySmartContractsProvider.notifier).load();
                            Navigator.of(context).pop();
                          } else {
                            Toast.error();
                          }
                        }
                      }
                    : null,
              ),
            ],
          ),
        )
      ],
    );
  }
}
