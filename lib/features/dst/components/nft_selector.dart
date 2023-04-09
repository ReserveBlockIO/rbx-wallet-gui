import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/features/nft/components/nft_list_tile.dart';
import 'package:rbx_wallet/features/nft/components/nft_navigator.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';

class NftSelector extends BaseComponent {
  final Function(Nft nft) onSelect;
  final String? labelOverride;

  const NftSelector({
    Key? key,
    required this.onSelect,
    this.labelOverride,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: labelOverride ?? "Choose NFT",
      onPressed: () async {
        final Nft? nft = await showModalBottomSheet(
            context: context,
            builder: (context) {
              return NftSelectorModal();
            });

        if (nft != null) {
          onSelect(nft);
        }
      },
    );
  }
}

class NftSelectorModal extends BaseComponent {
  const NftSelectorModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final d = ref.watch(nftListProvider);
    final nfts = d.data.results;

    return ModalContainer(
      withDecor: false,
      withClose: false,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select NFT",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Close",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: NftNavigator(minted: false),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: nfts.length,
          itemBuilder: (context, index) {
            final nft = nfts[index];
            return NftListTile(nft, showListedStatus: true, onPressedOverride: () {
              Navigator.of(context).pop(nft);
            });
          },
        )
      ],
    );
  }
}
