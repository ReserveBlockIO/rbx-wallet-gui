import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/colors.dart';
import '../providers/btc_web_transaction_list_provider.dart';
import '../../transactions/providers/web_transaction_list_provider.dart';
import '../../../utils/toast.dart';

import '../../../core/theme/components.dart';
import '../../../generated/assets.gen.dart';
import '../components/web_btc_tokenized_action_buttons.dart';
import '../components/web_btc_transaction_list_tile.dart';
import '../models/btc_web_vbtc_token.dart';
import '../providers/btc_web_vbtc_token_detail_provider.dart';

class WebTokenizedBtcDetailScreen extends BaseScreen {
  final String scIdentifier;
  const WebTokenizedBtcDetailScreen({super.key, @PathParam("scId") required this.scIdentifier});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(btcWebVbtcTokenDetailProvider(scIdentifier));

    final myAddress = ref.watch(webSessionProvider.select((value) => value.keypair?.address));

    return data.when(
      loading: () => AppBar(
        title: Text('loading'),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
      ),
      data: (token) {
        if (token == null) {
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
                  token.name,
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
                  if (myAddress != null) {
                    return Text(
                      "My Balance: ${token.balanceForAddress(myAddress)} vBTC",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    );
                  }
                  return Text(
                    "Global Balance: ${token.globalBalance} vBTC",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
      error: (_, __) => AppBar(
        title: Text("error"),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(btcWebVbtcTokenDetailProvider(scIdentifier));

    final myAddress = ref.watch(webSessionProvider.select((value) => value.keypair?.address));

    return data.when(
        data: (token) {
          if (token == null) {
            return Center(
              child: Text("Token Not Found"),
            );
          }

          final isOwner = myAddress == token.ownerAddress;

          final btcTxs = ref.watch(btcWebTransactionListProvider(token.depositAddress));

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
                        child: CachedNetworkImage(
                          imageUrl: token.imageUrl,
                          height: 200,
                          width: 200,
                          errorWidget: (context, _, __) {
                            return Image.asset(
                              Assets.images.vbtcPng.path,
                              width: 200,
                              height: 200,
                            );
                          },
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
                            _TokenDetailRefresher(
                              scId: token.scIdentifier,
                            ),
                            _DetailRow(
                              label: "Name",
                              value: token.name,
                            ),
                            _DetailRow(
                              label: "Description",
                              value: token.description,
                              inExpanded: true,
                            ),
                            _DetailRow(
                              label: "Owner",
                              value: token.ownerAddress,
                              withCopy: true,
                            ),
                            _DetailRow(
                              label: "BTC Deposit Address",
                              value: token.depositAddress,
                              withCopy: true,
                            ),
                            _DetailRow(
                              label: "Smart Contract ID",
                              value: token.scIdentifier,
                              withCopy: true,
                            ),
                            if (myAddress != null)
                              _DetailRow(
                                label: "My Balance",
                                value: "${token.balanceForAddress(myAddress)} vBTC",
                              ),
                            if (isOwner)
                              _DetailRow(
                                label: "Token Total Balance",
                                value: "${token.globalBalance} vBTC",
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
                SizedBox(
                  height: 8,
                ),
                _VbtcActionButtonsContainer(token: token, isOwner: isOwner),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     "Ownership:",
                //     style: TextStyle(
                //       decoration: TextDecoration.underline,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                // ListView.builder(
                //     itemCount: token.addresses.entries.length,
                //     shrinkWrap: true,
                //     itemBuilder: (context, index) {
                //       final entry = token.addresses.entries.toList()[index];
                //       final address = entry.key;
                //       final balance = entry.value;

                //       final percent = token.globalBalance > 0 ? balance / token.globalBalance : null;

                //       return Padding(
                //         padding: const EdgeInsets.only(bottom: 16.0),
                //         child: AppCard(
                //           padding: 0,
                //           child: ListTile(
                //             title: Text("$balance VBTC"),
                //             subtitle: Text(address),
                //             trailing: percent != null ? Text("${percent * 100}%") : null,
                //           ),
                //         ),
                //       );
                //     }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Transactions:",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                  ),
                ),
                if (btcTxs.isEmpty) Text("No Transactions"),
                ListView.builder(
                  itemCount: btcTxs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final tx = btcTxs[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: WebBtcTransactionListTile(
                        transaction: tx,
                        address: token.depositAddress,
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
        error: (_, __) => const Text("Error"),
        loading: () => const CenteredLoader());
  }
}

class _VbtcActionButtonsContainer extends StatefulWidget {
  const _VbtcActionButtonsContainer({
    required this.token,
    required this.isOwner,
  });

  final BtcWebVbtcToken token;
  final bool isOwner;

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
              child: WebTokenizedBtcActionButtons(token: widget.token, isOwner: widget.isOwner),
            ),
          );
        });
  }
}

class _TokenDetailRefresher extends ConsumerStatefulWidget {
  final String scId;
  const _TokenDetailRefresher({super.key, required this.scId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __TokenDetailRefresherState();
}

class __TokenDetailRefresherState extends ConsumerState<_TokenDetailRefresher> {
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      ref.invalidate(btcWebVbtcTokenDetailProvider(widget.scId));
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
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
