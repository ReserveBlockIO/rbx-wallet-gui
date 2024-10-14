import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../nft/components/nft_list_tile.dart';
import '../../nft/components/nft_navigator.dart';
import '../../nft/models/nft.dart';
import '../../nft/providers/nft_list_provider.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../../web_shop/providers/web_listed_nfts_provider.dart';

class NftSelector extends BaseComponent {
  final Function(Nft nft) onSelect;
  final String? labelOverride;
  final bool disabled;

  const NftSelector({
    Key? key,
    required this.onSelect,
    this.labelOverride,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: labelOverride ?? "Choose NFT",
      onPressed: disabled
          ? null
          : () async {
              if (kIsWeb) {
                await ref.read(webListedNftsProvider.notifier).refresh(ref.read(webSessionProvider).keypair?.address);
              }

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
