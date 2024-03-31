import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/btc/screens/tokenize_btc_screen.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/nft/utils.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/components/badges.dart';
import '../../nft/screens/nft_detail_screen.dart';
import '../providers/btc_pending_tokenized_address_list_provider.dart';
import '../providers/tokenized_bitcoin_list_provider.dart';

class TokenizeBtcListScreen extends BaseScreen {
  const TokenizeBtcListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text("Tokenized Bitcoins"),
      actions: [
        // Padding(
        //   padding: const EdgeInsets.only(right: 8.0),
        //   child: AppButton(
        //     label: "Tokenize BTC",
        //     variant: AppColorVariant.Btc,
        //     icon: FontAwesomeIcons.bitcoin,
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => TokenizeBtcScreen(),
        //         ),
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final tokens = ref.watch(tokenizedBitcoinListProvider);

    final pendingIds = ref.watch(btcPendingTokenizedAddressListProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppButton(
            label: "Tokenize BTC",
            variant: AppColorVariant.Btc,
            icon: FontAwesomeIcons.bitcoin,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TokenizeBtcScreen(),
                ),
              );
            },
          ),
        ),
        Divider(),
        Expanded(
          child: tokens.isEmpty
              ? Center(
                  child: Text("No Tokenized Bitcoin found in wallet."),
                )
              : ListView.builder(
                  itemCount: tokens.length,
                  itemBuilder: (context, index) {
                    final token = tokens[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: glowingBoxBtc,
                        ),
                        child: Card(
                          color: Colors.black,
                          child: ListTile(
                            title: Text(token.tokenName),
                            subtitle: Text(token.btcAddress != null ? token.btcAddress! : "No BTC Address"),
                            // leading: Icon(FontAwesomeIcons.bitcoin),
                            leading: FutureBuilder<Nft?>(
                                future: NftService().retrieve(token.smartContractUid),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final nft = snapshot.data;

                                    if (nft != null) {
                                      final path = nft.currentEvolveAsset.localPath;
                                      if (path != null) {
                                        return Image.file(
                                          File(path),
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        );
                                      }
                                    }
                                  }
                                  return Icon(FontAwesomeIcons.bitcoin);
                                }),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (token.btcAddress == null) {
                                      if (pendingIds.contains(token.smartContractUid)) {
                                        return AppBadge(
                                          label: "BTC Address Pending",
                                          variant: AppColorVariant.Btc,
                                        );
                                      }

                                      return AppButton(
                                        label: "Generate BTC Address",
                                        variant: AppColorVariant.Btc,
                                        icon: Icons.star,
                                        onPressed: () async {
                                          final confirmed = await ConfirmDialog.show(
                                            title: "Generate BTC Address",
                                            body: "Are you sure you want to generate this token's BTC address?",
                                            confirmText: "Generate",
                                            cancelText: "Cance",
                                          );
                                          if (confirmed == true) {
                                            ref.read(globalLoadingProvider.notifier).start();
                                            final address = await BtcService().generateTokenizedBitcoinAddress(token.smartContractUid);
                                            ref.read(globalLoadingProvider.notifier).complete();

                                            if (address == null) {
                                              return;
                                            }

                                            Toast.message("BTC Address generated ($address)");
                                            ref.read(logProvider.notifier).append(
                                                  LogEntry(
                                                    message: "BTC Address generated ($address)",
                                                    textToCopy: address,
                                                    variant: AppColorVariant.Btc,
                                                  ),
                                                );
                                            ref.read(tokenizedBitcoinListProvider.notifier).refresh();
                                            ref.read(btcPendingTokenizedAddressListProvider.notifier).addScId(token.smartContractUid);
                                          }
                                        },
                                      );
                                    }

                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AppButton(
                                          label: "Copy BTC Address",
                                          icon: Icons.copy,
                                          variant: AppColorVariant.Btc,
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        AppButton(
                                          label: "Transfer",
                                          onPressed: () async {
                                            final nft = await NftService().retrieve(token.smartContractUid);
                                            if (nft == null) {
                                              Toast.error("Could not resolve nft from ${token.smartContractUid}");
                                              return;
                                            }
                                            await initTransferNftProcess(context, ref, nft, backupRequired: true);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => NftDetailScreen(id: token.smartContractUid)));
                                    },
                                    icon: Icon(Icons.chevron_right))
                              ],
                            ),
                            onTap: () {
                              InfoDialog.show(
                                contextOverride: context,
                                title: "Token Info",
                                content: Builder(builder: (context) {
                                  return ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 600),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Name: ${token.tokenName}"),
                                        Text("Description: ${token.tokenDescription}"),
                                        SelectableText("RBX Owner: ${token.rbxAddress}"),
                                        SelectableText("BTC Address: ${token.btcAddress ?? '-'}"),
                                        SelectableText("Smart Contract ID: ${token.smartContractUid}"),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
