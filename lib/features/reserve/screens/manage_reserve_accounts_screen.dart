import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/components/nft_list_tile.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/providers/transferred_provider.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/nft/utils.dart';
import 'package:rbx_wallet/features/reserve/providers/pending_activation_provider.dart';
import 'package:rbx_wallet/features/reserve/providers/reserve_account_provider.dart';
import 'package:rbx_wallet/features/reserve/screens/reserve_account_overview_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import 'package:rbx_wallet/features/token/providers/token_list_provider.dart';
import 'package:rbx_wallet/features/token/screens/token_management_screen.dart';
import 'package:rbx_wallet/utils/toast.dart';

class ManageReserveAccountsScreen extends BaseScreen {
  const ManageReserveAccountsScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      title: Text("Manage Reserve Accounts"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(reserveAccountProvider.notifier);
    final accounts = ref.watch(reserveAccountProvider);

    final tabsRouter = AutoTabsRouter.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                label: "Setup New Account",
                icon: Icons.add,
                variant: AppColorVariant.Success,
                onPressed: () {
                  provider.newAccount(context);
                },
              ),
              SizedBox(
                height: 6,
              ),
              AppButton(
                label: "Restore Reserve Account",
                icon: Icons.refresh,
                type: AppButtonType.Text,
                variant: AppColorVariant.Light,
                onPressed: () async {
                  provider.restoreAccount(context);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: accounts.isEmpty
              ? Center(
                  child: Text("No Reserve Accounts"),
                )
              : ListView.builder(
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    final ra = accounts[index];

                    final showActivateButton = !ref.watch(pendingActivationProvider).contains(ra.address) && ra.balance >= 5;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: glowingBox,
                        ),
                        child: Card(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Text("Address:"),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    SelectableText(
                                      ra.address,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await Clipboard.setData(ClipboardData(text: ra.address));
                                        Toast.message("Address copied to clipboard");
                                      },
                                      child: Icon(
                                        Icons.copy,
                                        color: Theme.of(context).colorScheme.secondary,
                                        size: 14,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text("Available Balance:"),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    SelectableText(
                                      "${ra.availableBalance} VFX",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        provider.showBalanceInfo(context, ra);
                                      },
                                      child: Icon(
                                        Icons.help,
                                        size: 16,
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text("Status:"),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    ReserveAccountStatusBadge(wallet: ra, withRecoverButton: false)
                                  ],
                                ),
                                Divider(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: glowingBox,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Text(
                                        //   "Actions",
                                        //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        //         decoration: TextDecoration.underline,
                                        //       ),
                                        // ),
                                        // SizedBox(
                                        //   height: 8,
                                        // ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            AppButton(
                                              label: "Send Funds",
                                              variant: AppColorVariant.Secondary,
                                              onPressed: () {
                                                ref.read(sessionProvider.notifier).setCurrentWallet(ra);
                                                tabsRouter.setActiveIndex(1);
                                              },
                                            ),
                                            AppButton(
                                              label: "Manage Assets",
                                              variant: AppColorVariant.Secondary,
                                              onPressed: () async {
                                                final option = await showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return ModalContainer(
                                                        withDecor: false,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              color: Colors.black,
                                                              boxShadow: glowingBox,
                                                            ),
                                                            child: Card(
                                                              color: Colors.black,
                                                              child: ListTile(
                                                                title: Text("NFTs"),
                                                                leading: Icon(Icons.lightbulb_outline),
                                                                trailing: Icon(Icons.chevron_right),
                                                                onTap: () {
                                                                  Navigator.of(context).pop("nfts");
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              color: Colors.black,
                                                              boxShadow: glowingBox,
                                                            ),
                                                            child: Card(
                                                              color: Colors.black,
                                                              child: ListTile(
                                                                title: Text("Fungible Tokens"),
                                                                leading: Icon(Icons.toll),
                                                                trailing: Icon(Icons.chevron_right),
                                                                onTap: () {
                                                                  Navigator.of(context).pop("tokens");
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              color: Colors.black,
                                                              boxShadow: glowingBox,
                                                            ),
                                                            child: Card(
                                                              color: Colors.black,
                                                              child: ListTile(
                                                                title: Text("Bitcoin"),
                                                                leading: Icon(FontAwesomeIcons.bitcoin),
                                                                trailing: Icon(Icons.chevron_right),
                                                                onTap: () {
                                                                  Navigator.of(context).pop("btc");
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    });

                                                if (option == null) {
                                                  return;
                                                }
                                                print(option);

                                                if (option == 'nfts' || option == 'tokens') {
                                                  final List<Nft> ownedNfts = [];

                                                  if (option == 'nfts') {
                                                    final nfts = ref.read(nftListProvider).data.results;

                                                    for (final nft in nfts) {
                                                      final n = await NftService().retrieve(nft.id);
                                                      if (n != null && n.currentOwner == ra.address) {
                                                        ownedNfts.add(n);
                                                      }
                                                    }
                                                  } else if (option == 'tokens') {
                                                    final accounts = ref
                                                        .watch(sessionProvider)
                                                        .balances
                                                        .where((b) => b.tokens.isNotEmpty && b.address == ra.address)
                                                        .toList();
                                                    for (final a in accounts) {
                                                      for (final t in a.tokens) {
                                                        final n = await NftService().retrieve(t.smartContractId);
                                                        if (n != null) {
                                                          ownedNfts.add(n);
                                                        }
                                                      }
                                                    }
                                                  }

                                                  if (ownedNfts.isEmpty) {
                                                    Toast.message("This account has no assets/NFTS.");
                                                    return;
                                                  }

                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return ModalContainer(
                                                          withDecor: false,
                                                          children: [
                                                            Text("Manage Assets"),
                                                            ...ownedNfts
                                                                .map(
                                                                  (nft) => NftListTile(
                                                                    nft,
                                                                    onPressedOverride: () {
                                                                      // initTransferNftProcess(context, ref, nft);

                                                                      Navigator.of(context)
                                                                          .push(MaterialPageRoute(builder: (_) => NftDetailScreen(id: nft.id)));
                                                                    },
                                                                    trailingOverride: Row(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: [
                                                                        if (option == 'nft') ...[
                                                                          AppButton(
                                                                            label: "Transfer",
                                                                            variant: AppColorVariant.Secondary,
                                                                            onPressed: () {
                                                                              initTransferNftProcess(context, ref, nft);
                                                                            },
                                                                          ),
                                                                        ],
                                                                        SizedBox(
                                                                          width: 8,
                                                                        ),
                                                                        AppButton(
                                                                          label: "View Details",
                                                                          onPressed: () async {
                                                                            if (option == 'nft') {
                                                                              Navigator.of(context).push(
                                                                                  MaterialPageRoute(builder: (_) => NftDetailScreen(id: nft.id)));
                                                                            } else {
                                                                              final n = await NftService().getNftData(nft.id);

                                                                              // if (!ref.read(transferredProvider).contains(tokenAccount.smartContractId)) {
                                                                              if (n != null && nft.isToken) {
                                                                                // if (n.currentOwner == address) {
                                                                                final tokenAccount = TokenAccount.fromNft(n, ref);
                                                                                final tokenFeature = TokenScFeature.fromNft(n);
                                                                                if (tokenAccount != null && tokenFeature != null) {
                                                                                  Navigator.of(context).push(MaterialPageRoute(
                                                                                      builder: (_) => TokenManagementScreen(
                                                                                          tokenAccount, tokenFeature, nft.id, ra.address)));
                                                                                  return;
                                                                                }
                                                                                // }
                                                                                // }
                                                                              }
                                                                            }
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                                .toList()
                                                          ],
                                                        );
                                                      });
                                                } else if (option == 'btc') {}
                                              },
                                            ),
                                            AppButton(
                                              label: "Receive Assets/Funds",
                                              variant: AppColorVariant.Secondary,
                                              onPressed: () {
                                                ref.read(sessionProvider.notifier).setCurrentWallet(ra);
                                                tabsRouter.setActiveIndex(2);
                                              },
                                            ),
                                            if (showActivateButton)
                                              AppButton(
                                                label: "Activate",
                                                variant: AppColorVariant.Secondary,
                                                onPressed: () {
                                                  provider.activate(context, ra);
                                                },
                                              ),
                                            if (ra.isNetworkProtected) ReserveAccountRecoverButton(wallet: ra),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
