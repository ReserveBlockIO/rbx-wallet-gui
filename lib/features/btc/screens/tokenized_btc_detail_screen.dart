import 'dart:convert';

import 'package:archive/archive_io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/colors.dart';
import '../../asset/asset_thumbnail.dart';
import '../components/btc_transaction_list_tile.dart';
import '../components/tokenized_btc_action_buttons.dart';
import '../models/tokenized_bitcoin.dart';
import '../providers/btc_transaction_list_provider.dart';
import '../providers/tokenized_btc_detail_provider.dart';
import '../../nft/components/web_asset_thumbnail.dart';
import '../../nft/providers/nft_detail_provider.dart';
import '../../nft/services/nft_service.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../../../generated/assets.gen.dart';
import '../../../utils/toast.dart';
import 'package:collection/collection.dart';

import '../../../core/theme/components.dart';

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
    final nft = ref.watch(nftDetailProvider(token.smartContractUid));

    if (nft == null) {
      return AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
      );
    }

    return AppBar(
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/connector1.png',
            width: 155 / 4,
            height: 118 / 4,
            isAntiAlias: true,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              token.tokenName,
              style: TextStyle(fontSize: 28),
            ),
          ),
          Image.asset(
            'assets/images/connector2.png',
            width: 155 / 4,
            height: 118 / 4,
            isAntiAlias: true,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Builder(builder: (context) {
              if (nft.currentOwner != token.rbxAddress && token.myBalance == 0) {
                return Text(
                  "Confirming Balance...",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                );
              }
              return Tooltip(
                message: "Token Total Balance: ${token.balance} vBTC",
                child: Text(
                  "My Balance: ${token.myBalance} vBTC",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              );
            }),
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
    final nft = ref.watch(nftDetailProvider(token.smartContractUid));

    if (nft == null) {
      return CenteredLoader();
    }

    final scOwner = nft.currentOwner;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppCard(
            padding: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: BtcTokenImage(
                    nftId: token.smartContractUid,
                    size: 200,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "Token Details",
                      //   style: TextStyle(
                      //     decoration: TextDecoration.underline,
                      //     fontSize: 18,
                      //     color: AppColors.getBlue(ColorShade.s50),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      _DetailRow(
                        label: "Name",
                        value: token.tokenName,
                      ),
                      _DetailRow(
                        label: "Description",
                        value: token.tokenDescription,
                        inExpanded: true,
                      ),
                      _DetailRow(
                        label: "Owner",
                        value: token.rbxAddress,
                        withCopy: true,
                      ),
                      if (scOwner != token.rbxAddress)
                        _DetailRow(
                          label: "Smart Contract Owner",
                          value: scOwner,
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
                        value: scOwner != token.rbxAddress && token.myBalance == 0 ? "Confirming Balance..." : "${token.myBalance} vBTC",
                      ),
                      if (scOwner == token.rbxAddress)
                        _DetailRow(
                          label: "Token Total Balance",
                          value: "${token.balance} vBTC",
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          if (nft.additionalAssets.isNotEmpty) ...[
            Text(
              "Token Media",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18,
                color: AppColors.getBlue(ColorShade.s50),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            _BtcTokenMedia(token: token),
            SizedBox(
              height: 16,
            ),
          ],
          SizedBox(
            height: 8,
          ),
          _VbtcActionButtonsContainer(token: token, scOwner: scOwner),
          SizedBox(
            height: 16,
          ),
          Builder(builder: (context) {
            final transactions =
                ref.watch(btcTransactionListProvider).where((tx) => tx.toAddress == token.btcAddress || tx.fromAddress == token.btcAddress).toList();
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "BTC Transactions",
                  style: TextStyle(decoration: TextDecoration.underline, fontSize: 18, color: AppColors.getBtc()),
                ),
                SizedBox(
                  height: 8,
                ),
                if (transactions.isEmpty)
                  Text(
                    "No BTC Transactions",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                SizedBox(
                  height: 8,
                ),
                if (token.btcAddress != null)
                  ...transactions.asMap().entries.map((entry) {
                    final index = entry.key;
                    final tx = entry.value;
                    return Padding(
                      padding: EdgeInsets.only(bottom: index + 1 == transactions.length ? 36 : 12.0),
                      child: BtcTransactionListTile(
                        transaction: tx,
                      ),
                    );
                  }).toList()
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _VbtcActionButtonsContainer extends StatefulWidget {
  const _VbtcActionButtonsContainer({
    required this.token,
    required this.scOwner,
  });

  final TokenizedBitcoin token;
  final String scOwner;

  @override
  State<_VbtcActionButtonsContainer> createState() => _VbtcActionButtonsContainerState();
}

class _VbtcActionButtonsContainerState extends State<_VbtcActionButtonsContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
      value: 0,
    )..repeat(reverse: true); // Looping the animation

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.btcOrange.withOpacity(1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.getBlue(ColorShade.s100),
                width: 1,
              ),
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                stops: [0, _animation.value, 1],
                colors: [
                  AppColors.getBlue(ColorShade.s100),
                  AppColors.getBlue(ColorShade.s200),
                  AppColors.getBtc(),
                ],
              ),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TokenizedBtcActionButtons(token: widget.token, scOwner: widget.scOwner),
            ),
          );
        });
  }
}

class _BtcTokenMedia extends BaseComponent {
  final TokenizedBitcoin token;
  const _BtcTokenMedia({
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
        style: Theme.of(context).textTheme.bodySmall,
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
                  "NFT assets have not been transfered to the VFX Web Account.",
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
  final bool inExpanded;
  const _DetailRow({
    required this.label,
    required this.value,
    this.withCopy = false,
    this.inExpanded = false,
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
          inExpanded ? Expanded(child: Text(value)) : Text(value),
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
        final String? imageBase = f['FeatureFeatures']['ImageBase'];
        if (imageBase != null) {
          try {
            final decodedB64 = base64Decode(imageBase);
            final decodedGzip = GZipDecoder().decodeBytes(decodedB64);
            setState(() {
              bytes = decodedGzip;
            });
          } catch (e) {
            // Probably just an old file
          }

          break;
        }
      }
    }

    // if (bytes == null) {
    //   String? defaultb64 = await BtcService().defaultImage();
    //   if (defaultb64 != null) {
    //     Uint8List imageBytes = base64.decode(defaultb64);
    //     List<int> imageBytesList = imageBytes.toList();

    //     setState(() {
    //       bytes = imageBytesList;
    //     });
    //   }
    // }
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

          // return Icon(FontAwesomeIcons.bitcoin);
          return Image.asset(
            Assets.images.vbtcGif.path,
            width: widget.size,
            height: widget.size,
          );
        },
      ),
    );
  }
}
