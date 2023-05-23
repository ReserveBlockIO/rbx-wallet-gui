import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../global_loader/global_loading_provider.dart';
import '../models/nft.dart';
import '../../sc_property/models/sc_property.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../asset/asset_card.dart';
import '../../asset/asset_thumbnail.dart';
import '../../bridge/services/bridge_service.dart';
import '../../encrypt/utils.dart';
import '../../smart_contracts/components/sc_creator/common/help_button.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../../smart_contracts/components/sc_creator/modals/code_modal.dart';
import '../../smart_contracts/models/feature.dart';
import '../../smart_contracts/providers/my_smart_contracts_provider.dart';
import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../components/media_backup.dart';
import '../components/nft_qr_code.dart';
import '../components/web_asset_card.dart';
import '../components/web_asset_thumbnail.dart';
import '../modals/nft_management_modal.dart';
import '../providers/nft_detail_provider.dart';
import '../providers/transferred_provider.dart';
import '../utils.dart';

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
                    variant: nft.isPublished ? AppColorVariant.Success : AppColorVariant.Warning,
                    progressAnimation: !nft.isPublished,
                  ),
                ),
                if (nft.isListed(ref))
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: AppBadge(
                      label: "Listed",
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
    final _provider = ref.read(nftDetailProvider(id).notifier);
    final nft = ref.watch(nftDetailProvider(id));

    if (nft == null) {
      return const CenteredLoader();
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
                if (nft.isLocked)
                  Container(
                    decoration: BoxDecoration(color: Colors.red.shade800),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.lock,
                            size: 16,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "NFT Locked",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                Text(
                  nft.currentEvolveName,
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
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
                    style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
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
                              style: TextStyle(fontSize: 13, color: nft.currentOwner.startsWith("xRBX") ? Colors.deepPurple.shade200 : Colors.white)),
                          subtitle: const Text(
                            "Owner",
                          ),
                          leading: IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () {
                              copyToClipboard(nft.currentOwner);
                            },
                          ),
                        ),
                      ),
                    if (nft.minterAddress.isNotEmpty)
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(nft.minterAddress,
                              style: const TextStyle(
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
                if (nft.nextOwner != null && nft.nextOwner!.isNotEmpty)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(nft.nextOwner!,
                        style: TextStyle(fontSize: 13, color: nft.nextOwner!.startsWith("xRBX") ? Colors.deepPurple.shade200 : Colors.white)),
                    subtitle: const Text(
                      "Next Owner",
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        copyToClipboard(nft.nextOwner!);
                      },
                    ),
                  ),
                const Divider(),
                Wrap(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Asset:", style: Theme.of(context).textTheme.headline5),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: glowingBox,
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 512),
                            child: Card(
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    kIsWeb
                                        ? nft.currentEvolveAssetWeb != null
                                            ? WebAssetCard(nft, nft.currentEvolveAssetWeb)
                                            : buildAssetsNotAvailable(_provider)
                                        : AssetCard(
                                            nft.currentEvolveAsset,
                                            ownerAddress: nft.nextOwner ?? nft.currentOwner,
                                            nftId: nft.id,
                                            isPrimaryAsset: true,
                                          ),
                                    if (nft.additionalAssets.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Divider(),
                                            Text(
                                              "Additional Assets:",
                                              style: Theme.of(context).textTheme.headline5,
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            kIsWeb && nft.additionalAssetsWeb == null
                                                ? buildAssetsNotAvailable(_provider, false)
                                                : kIsWeb
                                                    ? Wrap(
                                                        children: (nft.additionalAssetsWeb ?? [])
                                                            .map(
                                                              (a) => Padding(
                                                                padding: const EdgeInsets.only(right: 6.0),
                                                                child: WebAssetThumbnail(
                                                                  a,
                                                                  nft: nft,
                                                                ),
                                                              ),
                                                            )
                                                            .toList(),
                                                      )
                                                    : Wrap(
                                                        children: nft.additionalLocalAssets
                                                            .map(
                                                              (a) => Padding(
                                                                padding: const EdgeInsets.only(right: 6.0),
                                                                child: AssetThumbnail(
                                                                  a,
                                                                  nftId: nft.id,
                                                                  ownerAddress: nft.nextOwner ?? nft.currentOwner,
                                                                  isPrimaryAsset: false,
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
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 216),
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
                            withOpen: true,
                          ),
                          MediaBackup(nft),
                        ],
                      ),
                    )
                  ],
                ),
                if (nft.currentEvolveProperties.isNotEmpty) ...[
                  const Divider(),
                  Text("Properties:", style: Theme.of(context).textTheme.headline5),
                  SizedBox(
                    height: 8,
                  ),
                  NftPropertiesWrap(
                    properties: nft.currentEvolveProperties,
                  )
                ],
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
                                    print(nft.updatedEvolutionPhases);

                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.black87,
                                        builder: (context) {
                                          return ModalContainer(color: Colors.black26, children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                EvolutionStateRow(
                                                  nft.baseEvolutionPhase,
                                                  nft: nft,
                                                  nftId: id,
                                                  canManageEvolve: nft.canManageEvolve,
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
                                                        canManageEvolve: nft.canManageEvolve,
                                                        index: entry.key + 1,
                                                        onAssociate: () {
                                                          Navigator.of(context).pop();
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
        if (!nft.isLocked) Text("Actions:", style: Theme.of(context).textTheme.headline5),
        if (!nft.isLocked)
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
                              String? reservePassword;
                              int? delayHours;
                              String? fromAddress;

                              if (nft.isListed(ref)) {
                                Toast.error("This NFT is listed in your auction house. Please remove the listing before transferring.");
                                return;
                              }

                              if (!kIsWeb) {
                                if (!await passwordRequiredGuard(context, ref)) {
                                  return;
                                }

                                Wallet? wallet = ref.read(walletListProvider).firstWhereOrNull((w) => w.address == nft.currentOwner);
                                if (wallet == null) {
                                  Toast.error("No wallet selected");
                                  return;
                                }

                                fromAddress = wallet.address;

                                if (wallet.balance < MIN_RBX_FOR_SC_ACTION) {
                                  Toast.error("Not enough balance for transaction");
                                  return;
                                }

                                final _nft = await setAssetPath(nft);

                                final filesReady = await _nft.areFilesReady();

                                if (!filesReady) {
                                  Toast.error("Media files not found on this machine.");
                                  return;
                                }
                                if (wallet.isReserved) {
                                  reservePassword = await PromptModal.show(
                                    title: "Reserve Account Password",
                                    validator: (_) => null,
                                    labelText: "Password",
                                    lines: 1,
                                    obscureText: true,
                                  );
                                  if (reservePassword == null) {
                                    return;
                                  }

                                  final hoursString = await PromptModal.show(
                                    title: "Timelock Duration",
                                    validator: (_) => null,
                                    labelText: "Hours (24 Minimum)",
                                    initialValue: "24",
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  );

                                  delayHours = (hoursString != null ? int.tryParse(hoursString) : 24) ?? 24;
                                  if (delayHours < 24) {
                                    delayHours = 24;
                                  }
                                }
                              }

                              PromptModal.show(
                                contextOverride: context,
                                title: "Transfer NFT",
                                validator: (value) => formValidatorRbxAddress(value, true),
                                labelText: "RBX Address",
                                confirmText: "Continue",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9.]')),
                                ],
                                lines: 1,
                                onValidSubmission: (address) async {
                                  bool? success;

                                  address = address.trim().replaceAll("\n", "");

                                  if (kIsWeb) {
                                    ref.read(globalLoadingProvider.notifier).start();
                                    success = await _provider.transferWebOut(address);
                                    if (success == true) {
                                      ref.read(transferredProvider.notifier).addId(id);

                                      Toast.message("NFT Transfer sent successfully to $address!");
                                      Navigator.of(context).pop();
                                    } else {
                                      Toast.error();
                                    }
                                    ref.read(globalLoadingProvider.notifier).complete();
                                  } else {
                                    final isValid = await BridgeService().validateSendToAddress(address);
                                    if (!isValid) {
                                      Toast.error("Invalid Address");
                                      return;
                                    }

                                    PromptModal.show(
                                      contextOverride: context,
                                      title: "Backup URL (Optional)",
                                      body: "Paste in a public URL to a hosted zipfile containing the assets.",
                                      validator: (value) {
                                        return null;
                                      },
                                      labelText: "URL (Optional)",
                                      confirmText: "Transfer",
                                      onValidSubmission: (url) async {
                                        final confirmed = await ConfirmDialog.show(
                                          title: "Confirm Transfer",
                                          body:
                                              "Please confirm you want to send the NFT to \"$address\".${reservePassword == null ? '\n\nIf this address is not correct, there will be no way to recover the ownership of the NFT.' : ''}",
                                          confirmText: "Send",
                                        );

                                        if (confirmed == true) {
                                          final success = reservePassword != null
                                              ? await _provider.transferFromReserveAccount(
                                                  toAddress: address,
                                                  fromAddress: fromAddress!,
                                                  password: reservePassword,
                                                  backupUrl: url,
                                                  delayHours: delayHours!)
                                              : await _provider.transfer(address, url);

                                          if (!success) {
                                            return;
                                          }

                                          await InfoDialog.show(
                                            title: "Transfer in Progress",
                                            body:
                                                "Please ensure to keep your wallet open until this NFT transfer transaction appears in your transaction list.\n\nTo monitor the asset transfer progress, open your 'nftlog.txt' in your databases folder.",
                                            closeText: "Okay",
                                          );

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
                  // if (!kIsWeb)
                  //   Padding(
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: AppButton(
                  //       label: nft.isPublic ? "Make Private" : "Make Public",
                  //       icon: nft.isPublic ? Icons.visibility_off : Icons.visibility,
                  //       onPressed: () {
                  //         _provider.togglePrivate();
                  //       },
                  //     ),
                  //   ),
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
                              if (nft.isListed(ref)) {
                                Toast.error("This NFT is listed in your auction house. Please remove the listing before burning.");
                                return;
                              }

                              if (!await passwordRequiredGuard(context, ref)) return;
                              final confirmed = await ConfirmDialog.show(
                                title: "Burn NFT?",
                                body: "Are you sure you want to burn ${nft.name}",
                                destructive: true,
                                confirmText: "Burn",
                                cancelText: "Cancel",
                              );

                              if (confirmed == true) {
                                ref.read(globalLoadingProvider.notifier).start();
                                final success = kIsWeb ? await _provider.burnWeb() : await _provider.burn();

                                if (success) {
                                  Toast.message("Burn transaction sent successfully!");
                                  ref.read(mySmartContractsProvider.notifier).load();
                                  Navigator.of(context).pop();
                                  ref.read(globalLoadingProvider.notifier).complete();
                                } else {
                                  ref.read(globalLoadingProvider.notifier).complete();

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

  Widget buildAssetsNotAvailable(NftDetailProvider _provider, [bool includeButton = true]) {
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
                const Text(
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
                          Toast.message("Transfer request has been broadcasted. Your assets should be available soon.");
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

class NftPropertiesWrap extends StatelessWidget {
  final Color? cardColor;
  final List<ScProperty> properties;

  const NftPropertiesWrap({
    Key? key,
    required this.properties,
    this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // mainAxisSize: MainAxisSize.min,
      spacing: 12,
      runSpacing: 12,
      children: properties.map((p) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: glowingBox,
            ),
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: ListTile(
                  // dense: true,
                  visualDensity: VisualDensity.compact,
                  leading: Builder(builder: (context) {
                    switch (p.type) {
                      case ScPropertyType.color:
                        return Icon(
                          Icons.color_lens,
                          color: colorFromHex(p.value),
                        );
                      case ScPropertyType.number:
                        return Icon(Icons.numbers);
                      default:
                        return Icon(Icons.text_fields);
                    }
                  }),
                  title: Text(p.value),
                  subtitle: Text(p.name),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
