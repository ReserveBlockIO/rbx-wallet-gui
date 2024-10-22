import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/cached_memory_image_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../nft/providers/transferred_provider.dart';
import '../../nft/services/nft_service.dart';
import 'burn_tokens_button.dart';
import 'transfer_tokens_button.dart';
import '../models/token_account.dart';
import '../models/token_sc_feature.dart';
import '../providers/token_nfts_provider.dart';
import '../screens/token_management_screen.dart';
import '../../../utils/toast.dart';

import '../../../core/theme/components.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../screens/token_topic_detail_screen.dart';

class TokenListTile extends BaseComponent {
  final String address;
  final TokenAccount tokenAccount;
  final TokenScFeature? token;
  final String? titleOverride;
  final bool interactive;
  const TokenListTile({
    super.key,
    required this.address,
    required this.tokenAccount,
    required this.token,
    this.titleOverride,
    this.interactive = true,
  });

  void showRaErrorMessage() {
    InfoDialog.show(
      title: "Not Supported by Vault Account",
      body: "Vault Account owned tokens can not perform this action.",
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOwnedByRA = address.startsWith("xRBX");

    bool canBurn = true;
    bool canVote = false;
    final nftRef = ref.read(tokenNftsProvider)[tokenAccount.smartContractId];
    if (nftRef != null) {
      canBurn = nftRef.burnable;
      canVote = nftRef.voting;
    }

    return AppCard(
      padding: 8,
      child: ListTile(
          leading: token != null && token!.imageBase64 != null
              ? Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.0),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
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
                        Base64Decoder().convert(token!.imageBase64!),
                      ),
                      width: 32,
                      height: 32,
                    ),
                  ),
                )
              : Icon(Icons.toll),
          title: Text(
            titleOverride ?? tokenAccount.label,
            style: TextStyle(
              color: isOwnedByRA ? Theme.of(context).colorScheme.reserve : null,
            ),
          ),
          subtitle: Text("Balance: ${tokenAccount.balance}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TransferTokensButton(
                scId: tokenAccount.smartContractId,
                fromAddress: address,
                currentBalance: tokenAccount.balance,
              ),
              if (canBurn)
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: BurnTokensButton(
                    scId: tokenAccount.smartContractId,
                    fromAddress: address,
                    currentBalance: tokenAccount.balance,
                    isOwnedByRA: isOwnedByRA,
                    showRaErrorMessage: showRaErrorMessage,
                  ),
                ),
              if (canVote)
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: AppButton(
                    label: "Voting",
                    variant: AppColorVariant.Light,
                    onPressed: () async {
                      final nft = await NftService().getNftData(tokenAccount.smartContractId);
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

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => TokenTopicDetailScreen(
                                          t,
                                          address,
                                          tokenAccount.balance,
                                          nft.currentOwner == address,
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
                  ),
                ),
            ],
          ),
          onTap: interactive
              ? () async {
                  final nft = await NftService().getNftData(tokenAccount.smartContractId);

                  if (!ref.read(transferredProvider).contains(tokenAccount.smartContractId)) {
                    if (nft != null && nft.isToken) {
                      if (nft.currentOwner == address) {
                        final tokenAccount = TokenAccount.fromNft(nft, ref);
                        final tokenFeature = TokenScFeature.fromNft(nft);
                        if (tokenAccount != null && tokenFeature != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => TokenManagementScreenContainer(
                                nftId: tokenAccount.smartContractId,
                                address: address,
                                tokenAccount: tokenAccount,
                                tokenFeature: tokenFeature,
                                ref: ref,
                                nft: nft,
                              ),
                            ),
                          );
                          return;
                        }
                      }
                    }
                  }

                  // final nft = await NftService().retrieve(tokenAccount.smartContractId);

                  if (nft != null && nft.tokenStateDetails != null) {
                    InfoDialog.show(
                      title: "Token Details",
                      content: TokenDetailsContent(
                        token: nft.tokenStateDetails!,
                        tokenAccount: tokenAccount,
                        owner: nft.currentOwner,
                        nft: nft,
                      ),
                    );
                  }
                }
              : null),
    );
  }
}
