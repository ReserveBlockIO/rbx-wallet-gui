import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/cached_memory_image_provider.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_watcher.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/token/components/mint_tokens_button.dart';
import 'package:rbx_wallet/features/token/components/token_list.dart';
import 'package:rbx_wallet/features/token/components/token_list_tile.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/models/token_details.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import 'package:rbx_wallet/features/token/providers/token_nfts_provider.dart';
import 'package:rbx_wallet/features/token/screens/token_topic_detail_screen.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:collection/collection.dart';

import '../components/ban_token_address_button.dart';
import '../components/burn_tokens_button.dart';
import '../components/change_token_ownership_button.dart';
import '../components/pause_token_button.dart';
import '../components/transfer_tokens_button.dart';

class TokenManagementScreenContainer extends StatefulWidget {
  final String nftId;
  final String address;
  final TokenAccount? tokenAccount;
  final TokenScFeature tokenFeature;
  final WidgetRef ref;

  const TokenManagementScreenContainer({
    super.key,
    required this.address,
    required this.nftId,
    required this.ref,
    required this.tokenAccount,
    required this.tokenFeature,
  });

  @override
  State<TokenManagementScreenContainer> createState() => _TokenManagementScreenContainerState();
}

class _TokenManagementScreenContainerState extends State<TokenManagementScreenContainer> {
  Timer? timer;
  TokenAccount? tokenAccount;
  TokenScFeature? tokenFeature;

  @override
  void initState() {
    tokenAccount = widget.tokenAccount;
    tokenFeature = widget.tokenFeature;
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) => load());

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future<void> load() async {
    final nft = await NftService().getNftData(widget.nftId);
    if (nft != null && nft.isToken) {
      final _tokenAccount = TokenAccount.fromNft(nft, widget.ref);
      final _tokenFeature = TokenScFeature.fromNft(nft);

      widget.ref.invalidate(nftDetailWatcher(nft.id));

      setState(() {
        tokenAccount = _tokenAccount;
        tokenFeature = _tokenFeature;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tokenAccount == null || tokenFeature == null) {
      return CenteredLoader();
    }

    return TokenManagementScreen(
      tokenAccount!,
      tokenFeature!,
      widget.nftId,
      widget.address,
    );
  }
}

class TokenManagementScreen extends BaseScreen {
  final TokenAccount tokenAccount;
  final TokenScFeature token;
  final String nftId;
  final String address;

  const TokenManagementScreen(this.tokenAccount, this.token, this.nftId, this.address, {super.key})
      : super(
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    Uint8List? imageData;
    if (token.imageBase64 != null && token.imageBase64!.isNotEmpty) {
      try {
        imageData = Base64Decoder().convert(token.imageBase64!);
      } catch (e) {
        print("base64 image error");
      }
    }
    return AppBar(
      backgroundColor: Colors.black54,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageData != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image(
                  image: CacheMemoryImageProvider(
                    tokenAccount.smartContractId,
                    imageData,
                  ),
                  width: 32,
                  height: 32,
                ),
              ),
            ),
          Text(tokenAccount.label),
        ],
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(nftDetailWatcher(nftId));
    return data.when(
      loading: () => SizedBox(),
      error: (_, __) => SizedBox(),
      data: (nft) {
        if (nft == null) {
          return SizedBox();
        }

        final accounts = ref.watch(sessionProvider).balances.where((b) => b.tokens.isNotEmpty).toList();
        final List<TokenAccount> tokenAccounts = [];
        final List<String> addresses = [];

        for (final account in accounts) {
          for (final t in account.tokens) {
            if (t.smartContractId == tokenAccount.smartContractId) {
              tokenAccounts.add(t);
              addresses.add(account.address);
            }
          }
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Divider(),
                TokenDetailsContent(
                  tokenAccount: tokenAccount,
                  token: nft.tokenStateDetails!,
                  owner: nft.currentOwner,
                  nft: nft,
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      if (token.mintable) MintTokensButton(nft: nft),
                      PauseTokenButton(
                        scId: nft.id,
                        fromAddress: nft.currentOwner,
                      ),
                      if (token.voting)
                        AppButton(
                          label: "Voting",
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ModalContainer(
                                  color: Colors.black,
                                  withDecor: false,
                                  withClose: true,
                                  children: [
                                    ListTile(
                                      title: Text("Create Token Topic"),
                                      leading: Icon(Icons.new_label),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        AutoRouter.of(context).push(CreateTokenTopicScreenRoute(scId: nft.id, address: nft.currentOwner));
                                      },
                                    ),
                                    ListTile(
                                      title: Text("View Topics"),
                                      leading: Icon(Icons.remove_red_eye),
                                      onTap: () async {
                                        final nft = await NftService().getNftData(nftId);

                                        if (nft != null && nft.tokenStateDetails != null) {
                                          if (nft.tokenStateDetails!.topicList.isEmpty) {
                                            InfoDialog.show(title: "No Topics", body: "This token doesn't have any voting topics yet.");
                                            return;
                                          }

                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) {
                                              return ModalContainer(
                                                color: Colors.black,
                                                withDecor: false,
                                                withClose: true,
                                                children: nft.tokenStateDetails!.topicList.map((t) {
                                                  return ListTile(
                                                    title: Text(t.topicName),
                                                    subtitle: Text(
                                                      t.topicDescription,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    trailing: Icon(Icons.chevron_right),
                                                    onTap: () {
                                                      Navigator.of(context).pop();
                                                      Navigator.of(context).pop();

                                                      Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                          builder: (_) => TokenTopicDetailScreen(
                                                            t,
                                                            nft.currentOwner,
                                                            tokenAccount.balance,
                                                            true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }).toList(),
                                              );
                                            },
                                          );

                                          return;
                                        }

                                        Toast.error();
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ChangeTokenOwnershipButton(
                        nft: nft,
                        fromAddress: nft.currentOwner,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      BanTokenAddressButton(
                        nft: nft,
                        fromAddress: nft.currentOwner,
                      ),
                      if (nft.tokenStateDetails != null &&
                          nft.tokenStateDetails!.addressBlackList != null &&
                          nft.tokenStateDetails!.addressBlackList!.isNotEmpty)
                        AppButton(
                          label: "List Bans",
                          variant: AppColorVariant.Light,
                          type: AppButtonType.Text,
                          onPressed: () {
                            final content = nft.tokenStateDetails!.addressBlackList!.join("\n");
                            InfoDialog.show(title: "Banned Addresses", body: content);
                          },
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 2),
                  child: Text(
                    "Token Accounts",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                if (tokenAccounts.isEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("No tokens in any of your accounts."),
                      if (token.mintable)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MintTokensButton(
                            nft: nft,
                            elevated: false,
                          ),
                        ),
                    ],
                  ),
                SizedBox(
                  height: 14,
                ),
                ...tokenAccounts.asMap().entries.map((entry) {
                  final i = entry.key;
                  final t = entry.value;
                  return TokenListTile(
                    tokenAccount: t,
                    address: addresses[i],
                    token: ref.read(tokenNftsProvider)[t.smartContractId],
                    titleOverride: addresses[i],
                    interactive: false,
                  );
                }).toList()
              ],
            ),
          ),
        );
      },
    );
  }
}

class TokenDetailsContent extends StatelessWidget {
  const TokenDetailsContent({
    super.key,
    required this.tokenAccount,
    required this.token,
    required this.owner,
    required this.nft,
  });

  final TokenAccount tokenAccount;
  final TokenDetails token;
  final String owner;
  final Nft nft;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _DetailRow(
          label: "Smart Contract UID",
          value: tokenAccount.smartContractId,
          copyable: true,
        ),
        _DetailRow(
          label: "Owner",
          value: owner,
          copyable: true,
        ),
        _DetailRow(
          label: "Token Name",
          value: token.name,
          copyable: true,
        ),
        _DetailRow(
          label: "Token Ticker",
          value: token.ticker,
          copyable: true,
        ),
        _DetailRow(
          label: token.mintable ? 'Initial Issuance' : 'Fixed Supply',
          value: token.mintable ? "${token.startingSupply.toString()} " : "${(min(token.currentSupply, token.startingSupply))}",
        ),
        // if (token.currentSupply > 0)
        _DetailRow(
          label: "Circulating Supply",
          value: token.currentSupply.toString(),
        ),
        _DetailRow(
          label: "Lifetime Cap",
          value: token.mintable ? 'Infinite' : (min(token.currentSupply, token.startingSupply)).toString(),
        ),
        if (!token.mintable && token.currentSupply < token.startingSupply)
          _DetailRow(
            label: "Burned",
            value: "${token.startingSupply - token.currentSupply}",
          ),
        if (nft.tokenDetails != null)
          _DetailRow(
            label: "Mintable",
            value: nft.tokenDetails!.mintable ? "YES" : "NO",
          ),
        if (nft.tokenDetails != null)
          _DetailRow(
            label: "Burnable",
            value: nft.tokenDetails!.burnable ? "YES" : "NO",
          ),
        if (nft.tokenDetails != null)
          _DetailRow(
            label: "Voting",
            value: nft.tokenDetails!.voting ? "YES" : "NO",
          ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool copyable;

  const _DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.copyable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
          if (copyable)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: value));
                    Toast.message("$label copied to clipboard");
                  },
                  child: Icon(
                    Icons.copy,
                    size: 16,
                  )),
            ),
        ],
      ),
    );
  }
}
