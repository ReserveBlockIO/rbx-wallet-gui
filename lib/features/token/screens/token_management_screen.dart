import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/cached_memory_image_provider.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../nft/models/nft.dart';
import '../../nft/services/nft_service.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../components/mint_tokens_button.dart';
import '../components/token_list_tile.dart';
import '../models/token_account.dart';
import '../models/token_details.dart';
import '../models/token_sc_feature.dart';
import '../providers/token_nfts_provider.dart';
import 'token_topic_detail_screen.dart';
import '../../../utils/toast.dart';

import '../../../core/theme/components.dart';
import '../components/ban_token_address_button.dart';
import '../components/change_token_ownership_button.dart';
import '../components/pause_token_button.dart';

class TokenManagementScreenContainer extends StatefulWidget {
  final String nftId;
  final String address;
  final TokenAccount? tokenAccount;
  final TokenScFeature tokenFeature;
  final WidgetRef ref;
  final Nft nft;

  const TokenManagementScreenContainer({
    super.key,
    required this.address,
    required this.nftId,
    required this.ref,
    required this.tokenAccount,
    required this.tokenFeature,
    required this.nft,
  });

  @override
  State<TokenManagementScreenContainer> createState() => _TokenManagementScreenContainerState();
}

class _TokenManagementScreenContainerState extends State<TokenManagementScreenContainer> {
  Timer? timer;
  TokenAccount? tokenAccount;
  TokenScFeature? tokenFeature;
  Nft? nft;

  @override
  void initState() {
    tokenAccount = widget.tokenAccount;
    tokenFeature = widget.tokenFeature;
    nft = widget.nft;
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) => load());

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future<void> load() async {
    final _nft = await NftService().getNftData(widget.nftId);
    if (_nft != null && _nft.isToken) {
      final _tokenAccount = TokenAccount.fromNft(_nft, widget.ref);
      final _tokenFeature = TokenScFeature.fromNft(_nft);

      // widget.ref.invalidate(nftDetailWatcher(_nft.id));

      setState(() {
        tokenAccount = _tokenAccount;
        tokenFeature = _tokenFeature;
        nft = _nft;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tokenAccount == null || tokenFeature == null || nft == null) {
      print(tokenAccount);
      print(tokenFeature);
      print(nft);
      return CenteredLoader();
    }

    return TokenManagementScreen(
      tokenAccount!,
      tokenFeature!,
      widget.nftId,
      widget.address,
      nft!,
    );
  }
}

class TokenManagementScreen extends BaseScreen {
  final TokenAccount tokenAccount;
  final TokenScFeature token;
  final String nftId;
  final String address;
  final Nft nft;

  const TokenManagementScreen(this.tokenAccount, this.token, this.nftId, this.address, this.nft, {super.key})
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

  void showRaErrorMessage() {
    InfoDialog.show(
      title: "Not Supported by Vault Account",
      body: "Vault Account owned tokens can not perform this action. Please change hte ownership to a standard VFX account to continue.",
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isOwnedByRA = nft.currentOwner.startsWith("xRBX");

    final accounts = ref.watch(sessionProvider.select((v) => v.balances)).where((b) => b.tokens.isNotEmpty).toList();
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppCard(
              padding: 4,
              fullWidth: true,
              child: TokenDetailsContent(
                tokenAccount: tokenAccount,
                token: nft.tokenStateDetails!,
                owner: nft.currentOwner,
                nft: nft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 12.0,
                runSpacing: 12.0,
                children: [
                  if (token.mintable) MintTokensButton(nft: nft, showRaErrorMessage: showRaErrorMessage),
                  PauseTokenButton(
                    scId: nft.id,
                    fromAddress: nft.currentOwner,
                    showRaErrorMessage: showRaErrorMessage,
                    isOwnedByRa: isOwnedByRA,
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
                                    if (isOwnedByRA) {
                                      showRaErrorMessage();
                                      return;
                                    }
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
                    showRaErrorMessage: showRaErrorMessage,
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
                        showRaErrorMessage: showRaErrorMessage,
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
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TokenListTile(
                  tokenAccount: t,
                  address: addresses[i],
                  token: ref.read(tokenNftsProvider)[t.smartContractId],
                  titleOverride: addresses[i],
                  interactive: false,
                ),
              );
            }).toList(),
            SizedBox(
              height: 48,
            )
          ],
        ),
      ),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TokenDetailRow(
                label: "Smart Contract UID",
                value: tokenAccount.smartContractId,
                copyable: true,
              ),

              TokenDetailRow(
                label: "Token Name",
                value: token.name,
                copyable: true,
              ),

              TokenDetailRow(
                label: token.mintable ? 'Initial Issuance' : 'Fixed Supply',
                value: token.mintable ? "${token.startingSupply.toString()} " : "${(min(token.currentSupply, token.startingSupply))}",
              ),
              // if (token.currentSupply > 0)

              TokenDetailRow(
                label: "Lifetime Cap",
                value: token.mintable ? 'Infinite' : (min(token.currentSupply, token.startingSupply)).toString(),
              ),

              if (nft.tokenDetails != null)
                TokenDetailRow(
                  label: "Mintable",
                  value: nft.tokenDetails!.mintable ? "YES" : "NO",
                  dividerBelow: false,
                ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TokenDetailRow(
                label: "Owner",
                value: owner,
                copyable: true,
              ),
              TokenDetailRow(
                label: "Token Ticker",
                value: token.ticker,
                copyable: true,
              ),
              TokenDetailRow(
                label: "Circulating Supply",
                value: token.currentSupply.toString(),
              ),
              if (!token.mintable && token.currentSupply < token.startingSupply)
                TokenDetailRow(
                  label: "Burned",
                  value: "${token.startingSupply - token.currentSupply}",
                ),
              if (nft.tokenDetails != null)
                TokenDetailRow(
                  label: "Burnable",
                  value: nft.tokenDetails!.burnable ? "YES" : "NO",
                ),
              if (nft.tokenDetails != null)
                TokenDetailRow(
                  label: "Voting",
                  value: nft.tokenDetails!.voting ? "YES" : "NO",
                  dividerBelow: false,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class TokenDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool copyable;
  final bool dividerBelow;

  const TokenDetailRow({
    required this.label,
    required this.value,
    this.copyable = false,
    this.dividerBelow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          dense: true,
          title: Text(value),
          subtitle: Text(label),
          trailing: copyable
              ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: value));
                      Toast.message("$label copied to clipboard");
                    },
                    child: Icon(
                      Icons.copy,
                      size: 14,
                    ),
                  ),
                )
              : null,
        ),
        if (dividerBelow)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(
              height: 1,
            ),
          ),
      ],
    );
  }
}
