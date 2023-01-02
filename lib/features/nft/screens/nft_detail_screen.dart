import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/asset/asset_card.dart';
import 'package:rbx_wallet/features/asset/asset_thumbnail.dart';
import 'package:rbx_wallet/features/encrypt/utils.dart';
import 'package:rbx_wallet/features/nft/components/nft_qr_code.dart';
import 'package:rbx_wallet/features/nft/components/proxy_asset_card.dart';
import 'package:rbx_wallet/features/nft/components/proxy_asset_thumbnail.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/modals/nft_management_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/modals/code_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/my_smart_contracts_provider.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
import 'package:url_launcher/url_launcher.dart';

class NftDetailScreen extends BaseScreen {
  final String id;
  final bool fromCreator;

  const NftDetailScreen({
    @PathParam('id') required this.id,
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
      title: nft != null ? Text(nft.currentEvolveName) : const Text("NFT"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      // leading: AutoRouter.of(context).canPopSelfOrChildren
      //     ? IconButton(
      //         onPressed: () {
      //           AutoRouter.of(context).pop();
      //         },
      //         icon: Icon(
      //           Icons.navigate_before,
      //           size: 32,
      //         ))
      //     : GestureDetector(
      //         onTap: () {
      //           AutoRouter.of(context).push(WebDashboardContainerRoute());
      //         },
      //         child: SizedBox(
      //           width: 24,
      //           height: 24,
      //           child: Image.asset(
      //             Assets.images.animatedCube.path,
      //             scale: 1,
      //           ),
      //         ),
      //       ),
      actions: [
        if (nft != null)
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!nft.isPublished) const HelpButton(HelpType.minting),
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
      return CenteredLoader();
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
                const SizedBox(
                  height: 4,
                ),
                SelectableText("ID: ${nft.id}"),
                const SizedBox(
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
                const SizedBox(
                  height: 4,
                ),
                Text(
                  nft.currentEvolveDescription.replaceAll("\\n", "\n"),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const Divider(),
                Row(
                  children: [
                    if (nft.currentOwner.isNotEmpty)
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(nft.currentOwner,
                              style: TextStyle(
                                fontSize: 13,
                              )),
                          subtitle: const Text(
                            "Owner",
                          ),
                          leading: IconButton(
                            icon: const Icon(Icons.copy),
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
                          title: Text(nft.minterAddress,
                              style: TextStyle(
                                fontSize: 13,
                              )),
                          subtitle: const Text("Minter Address"),
                          leading: IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () {
                              copyToClipboard(nft.minterAddress);
                            },
                          ),
                        ),
                      ),
                  ],
                ),
                const Divider(),
                Wrap(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Asset:",
                            style: Theme.of(context).textTheme.headline5),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 512),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  kIsWeb
                                      ? nft.assetsAvailable
                                          ? ProxiedAssetCard(nft.proxiedAsset)
                                          : buildAssetsNotAvailable(_provider)
                                      : AssetCard(
                                          nft.currentEvolveAsset,
                                          nftId: nft.id,
                                        ),
                                  if (nft.additionalAssets.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Divider(),
                                          Text(
                                            "Additional Assets:",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          kIsWeb && !nft.assetsAvailable
                                              ? buildAssetsNotAvailable(
                                                  _provider, false)
                                              : kIsWeb
                                                  ? Wrap(
                                                      children:
                                                          (nft.additionalProxiedAssets ??
                                                                  [])
                                                              .map(
                                                                (a) => Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          6.0),
                                                                  child:
                                                                      ProxyAssetThumbnail(
                                                                          a),
                                                                ),
                                                              )
                                                              .toList(),
                                                    )
                                                  : Wrap(
                                                      children: nft
                                                          .additionalLocalAssets
                                                          .map(
                                                            (a) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          6.0),
                                                              child:
                                                                  AssetThumbnail(
                                                                a,
                                                                nftId: nft.id,
                                                              ),
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
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "QR Code:",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          NftQrCode(
                            data: nft.explorerUrl,
                            size: 200,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(),
                Text("Features:", style: Theme.of(context).textTheme.headline5),
                if (nft.features.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.cancel,
                          size: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0),
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
                          trailing: f.type == FeatureType.evolution
                              ? AppButton(
                                  label: "Reveal Evolve Stages",
                                  variant: AppColorVariant.Dark,
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.black87,
                                        builder: (context) {
                                          return ModalContainer(
                                              color: Colors.black26,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    EvolutionStateRow(
                                                      nft.baseEvolutionPhase,
                                                      nft: nft,
                                                      nftId: id,
                                                      canManageEvolve:
                                                          nft.canManageEvolve,
                                                      index: 0,
                                                    ),
                                                    ...nft
                                                        .updatedEvolutionPhases
                                                        .asMap()
                                                        .entries
                                                        .map(
                                                          (entry) =>
                                                              EvolutionStateRow(
                                                            entry.value,
                                                            nft: nft,
                                                            nftId: id,
                                                            canManageEvolve: nft
                                                                .canManageEvolve,
                                                            index:
                                                                entry.key + 1,
                                                            onAssociate: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        )
                                                        .toList(),
                                                  ],
                                                )
                                              ]);
                                        });
                                  },
                                )
                              : null,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        Text("Actions:", style: Theme.of(context).textTheme.headline5),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,

              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AppButton(
                    label: "Transfer",
                    // helpType: HelpType.transfer,
                    icon: Icons.send,
                    onPressed: nft.isPublished
                        ? () async {
                            if (!await passwordRequiredGuard(context, ref))
                              return;

                            PromptModal.show(
                              contextOverride: context,
                              title: "Transfer NFT",
                              validator: (value) =>
                                  formValidatorRbxAddress(value, true),
                              labelText: "RBX Address",
                              confirmText: "Continue",
                              onValidSubmission: (address) async {
                                bool? success;

                                address = address.trim().replaceAll("\n", "");

                                if (kIsWeb) {
                                  success =
                                      await _provider.transferWebOut(address);
                                  if (success == true) {
                                    Toast.message(
                                        "NFT Transfer sent successfully to $address!");
                                  } else {
                                    Toast.error();
                                  }
                                } else {
                                  PromptModal.show(
                                    contextOverride: context,
                                    title: "Backup URL (Optional)",
                                    body:
                                        "Paste in a public URL to a hosted zipfile containing the assets.",
                                    validator: (value) {
                                      return null;
                                    },
                                    labelText: "URL (Optional)",
                                    confirmText: "Transfer",
                                    onValidSubmission: (url) async {
                                      success = await _provider.transfer(
                                          address, url);
                                      if (success == true) {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  );
                                }
                              },
                            );
                          }
                        : null,
                  ),
                ),
                if (nft.manageable && nft.isMinter)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AppButton(
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
                              children: [NftMangementModal(nft.id, nft)],
                            );
                          },
                        );
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AppButton(
                    label: nft.isPublic ? "Make Private" : "Make Public",
                    icon:
                        nft.isPublic ? Icons.visibility_off : Icons.visibility,
                    onPressed: () {
                      _provider.togglePrivate();
                    },
                  ),
                ),
                if (nft.code != null)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AppButton(
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
                  ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AppButton(
                    label: "Burn",
                    icon: Icons.fire_hydrant,
                    // helpType: HelpType.burn,
                    variant: AppColorVariant.Danger,
                    onPressed: nft.isPublished
                        ? () async {
                            if (!await passwordRequiredGuard(context, ref))
                              return;
                            final confirmed = await ConfirmDialog.show(
                              title: "Burn NFT?",
                              body: "Are you sure you want to burn ${nft.name}",
                              destructive: true,
                              confirmText: "Burn",
                              cancelText: "Cancel",
                            );

                            if (confirmed == true) {
                              final success = kIsWeb
                                  ? await _provider.burnWeb()
                                  : await _provider.burn();

                              if (success) {
                                Toast.message(
                                    "Burn transaction sent successfully!");
                                ref
                                    .read(mySmartContractsProvider.notifier)
                                    .load();
                                Navigator.of(context).pop();
                              } else {
                                Toast.error();
                              }
                            }
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildAssetsNotAvailable(NftDetailProvider _provider,
      [bool includeButton = true]) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "NFT assets have not been transfered to the RBX Web Wallet.",
                  textAlign: TextAlign.center,
                ),
                if (includeButton)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: AppButton(
                      label: "Transfer Now",
                      onPressed: () async {
                        final success = await _provider.transferWebIn();

                        if (success == true) {
                          Toast.message(
                              "Transfer request has been broadcasted. Your assets should be available soon.");
                        }
                      },
                      variant: AppColorVariant.Success,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
