import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/modals/nft_management_modal.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/web_nft_detail_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/modals/code_modal.dart';
import 'package:rbx_wallet/utils/validation.dart';

class WebNftDetailScreen extends BaseScreen {
  final String identifier;

  const WebNftDetailScreen({
    Key? key,
    @PathParam('identifier') required this.identifier,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("NFTs"),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webNftDetailProvider(identifier));

    return data.when(
        loading: () => const CenteredLoader(),
        data: (nft) => nft != null ? _NftDetail(nft) : const Text("Error."),
        error: (_, __) => const Text("Error"));
  }
}

class _NftDetail extends BaseComponent {
  final Nft nft;
  const _NftDetail(
    this.nft, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nft.name,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(nft.description),
        const Divider(),
        Text("Minted by: ${nft.minterName}"),
        Text("Minter Address: ${nft.minterAddress}"),
        Text("Owner Address: ${nft.currentOwner}"),
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
                ),
              )
              .toList(),
        ),
        const Divider(),
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
                            // final success = await _provider.transfer(address);
                            // if (success) {
                            //   Toast.message(
                            //       "Transfer transaction sent successfully!");
                            // } else {
                            //   Toast.error();
                            // }
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
                  // _provider.togglePrivate();
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
                          // final success = await _provider.burn();

                          // if (success) {
                          //   Toast.message(
                          //       "Burn transaction sent successfully!");
                          //   ref.read(mySmartContractsProvider.notifier).load();
                          //   Navigator.of(context).pop();
                          // } else {
                          //   Toast.error();
                          // }
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
