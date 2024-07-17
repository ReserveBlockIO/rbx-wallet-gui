import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset_thumbnail.dart';
import 'package:rbx_wallet/features/btc/components/tokenized_btc_action_buttons.dart';
import 'package:rbx_wallet/features/btc/models/tokenized_bitcoin.dart';
import 'package:rbx_wallet/features/btc/providers/tokenized_btc_detail_provider.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';
import 'package:rbx_wallet/features/nft/components/web_asset_thumbnail.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:collection/collection.dart';

class TokenizedBtcDetailScreen extends BaseScreen {
  final double tokenId;
  const TokenizedBtcDetailScreen({super.key, required this.tokenId});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenizedBtcDetailProvider(tokenId));

    if (token == null) {
      return AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
      );
    }

    return AppBar(
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      title: Text(token.tokenName),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Center(
            child: Tooltip(
              message: "Token Total Balance: ${token.balance} vBTC",
              child: Text(
                "My Balance: ${token.myBalance} vBTC",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenizedBtcDetailProvider(tokenId));

    if (token == null) {
      return Center(
        child: Text("Token Not Found"),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BtcTokenImage(
              nftId: token.smartContractUid,
              size: 200,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Token Details",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  _DetailRow(
                    label: "Name",
                    value: token.tokenName,
                  ),
                  _DetailRow(
                    label: "Description",
                    value: token.tokenDescription,
                  ),
                  _DetailRow(
                    label: "Owner",
                    value: token.rbxAddress,
                    withCopy: true,
                  ),
                  _DetailRow(
                    label: "BTC Deposit Address",
                    value: token.btcAddress ?? 'Not Generated',
                    withCopy: token.btcAddress != null,
                  ),
                  _DetailRow(
                    label: "Smart Contract ID",
                    value: token.smartContractUid,
                    withCopy: true,
                  ),
                  _DetailRow(
                    label: "My Balance",
                    value: "${token.myBalance} vBTC",
                  ),
                  _DetailRow(
                    label: "Token Total Balance",
                    value: "${token.balance} vBTC",
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Token Media",
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        _BtcTokenMedia(token: token),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.btcOrange.withOpacity(1),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TokenizedBtcActionButtons(token: token),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BtcTokenMedia extends BaseComponent {
  final TokenizedBitcoin token;
  const _BtcTokenMedia({
    super.key,
    required this.token,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(nftDetailProvider(token.smartContractUid).notifier);
    final nft = ref.watch(nftDetailProvider(token.smartContractUid));

    if (nft == null) {
      return SizedBox();
    }

    if (nft.additionalAssets.isEmpty) {
      return Text(
        "This token does not contain any additional media.",
        style: Theme.of(context).textTheme.caption,
      );
    }

    if (ref.watch(walletListProvider).firstWhereOrNull((element) => element.address == nft.currentOwner) == null) {
      return Text("Only the token owner can view the additional media.");
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: kIsWeb && nft.additionalAssetsWeb == null
          ? buildAssetsNotAvailable(provider, false)
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
                            size: 100,
                          ),
                        ),
                      )
                      .toList(),
                ),
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
                  "NFT assets have not been transfered to the VFX Web Wallet.",
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

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool withCopy;
  const _DetailRow({
    required this.label,
    required this.value,
    this.withCopy = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$label:",
            style: TextStyle(
              color: Theme.of(context).colorScheme.btcOrange,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Text(value),
          SizedBox(
            width: 6,
          ),
          if (withCopy)
            Transform.translate(
              offset: Offset(0, 2),
              child: InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: value));
                  Toast.message("$label copied to clipboard");
                },
                child: Icon(
                  Icons.copy,
                  size: 12,
                ),
              ),
            )
        ],
      ),
    );
  }
}

class BtcTokenImage extends StatefulWidget {
  final String nftId;
  final double size;
  const BtcTokenImage({
    super.key,
    required this.nftId,
    required this.size,
  });

  @override
  State<BtcTokenImage> createState() => _BtcTokenImageState();
}

class _BtcTokenImageState extends State<BtcTokenImage> {
  List<int>? bytes;

  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    final nft = await NftService().retrieve(widget.nftId);
    if (nft == null) {
      return;
    }

    for (final f in nft.features) {
      if (f['FeatureName'] == 3) {
        final imageBase = f['FeatureFeatures']['ImageBase'];
        if (imageBase != null) {
          final decodedB64 = base64Decode(imageBase);
          final decodedGzip = GZipDecoder().decodeBytes(decodedB64);
          setState(() {
            bytes = decodedGzip;
          });

          break;
        }
      }
    }

    if (bytes == null) {
      String? defaultb64 = await BtcService().defaultImage();
      if (defaultb64 != null) {
        Uint8List imageBytes = base64.decode(defaultb64);
        List<int> imageBytesList = imageBytes.toList();

        setState(() {
          bytes = imageBytesList;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Builder(
        builder: (context) {
          if (bytes != null) {
            return Image.memory(
              Uint8List.fromList(bytes!),
              width: widget.size,
              height: widget.size,
              fit: BoxFit.contain,
            );
          }

          return Icon(FontAwesomeIcons.bitcoin);
        },
      ),
    );
  }
}
