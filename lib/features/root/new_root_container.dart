import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import 'package:rbx_wallet/features/bridge/providers/status_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/btc/providers/btc_account_list_provider.dart';
import 'package:rbx_wallet/features/btc/providers/btc_balance_provider.dart';
import 'package:rbx_wallet/features/btc/providers/electrum_connected_provider.dart';
import 'package:rbx_wallet/features/btc/providers/tokenized_bitcoin_list_provider.dart';
import 'package:rbx_wallet/features/encrypt/utils.dart';
import 'package:rbx_wallet/features/transactions/providers/transaction_list_provider.dart';
import 'package:rbx_wallet/features/wallet/components/bulk_import_wallet_modal.dart';
import 'package:rbx_wallet/features/wallet/components/manage_wallet_bottom_sheet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

import '../../core/components/currency_segmented_button.dart';
import '../block/latest_block.dart';
import '../misc/providers/global_balances_expanded_provider.dart';
import '../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../transactions/components/transaction_list_tile.dart';

const TRANSITION_DURATION = Duration(milliseconds: 250);
const TRANSITION_CURVE = Curves.ease;
const SIDE_NAV_WIDTH_EXPANDED = 180.0;
const SIDE_NAV_WIDTH_CONTRACTED = 50.0;

class NewRootContainer extends BaseComponent {
  const NewRootContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PageRouteInfo> routes = [
      const HomeTabRouter(),
      const SendTabRouter(),
      const ReceiveTabRouter(),
      const TransactionsTabRouter(),
      const ValidatorTabRouter(),
      const AdjudicatorTabRouter(),
      const NodesTabsRouter(),
      const NftTabRouter(),
      const SmartContractsTabRouter(),
      const DstsTabRouter(),
      const AdnrTabRouter(),
      const VotingTabRouter(),
      const BeaconTabRouter(),
      const TokenTabRouter(),
      const ReserveAccountsTabRouter(),
      const TokenizeBtcTabRouter(),
      const OperationsTabRouter(),
    ];

    return AutoTabsScaffold(
      backgroundColor: Colors.black,
      scaffoldKey: rootScaffoldKey,
      routes: routes,
      builder: (context, child, animated) {
        return _Layout(
          child: child,
        );
      },
    );
  }
}

class _Layout extends StatefulWidget {
  final Widget child;

  const _Layout({
    super.key,
    required this.child,
  });

  @override
  State<_Layout> createState() => _LayoutState();
}

class _LayoutState extends State<_Layout> {
  bool sideNavExpanded = true;

  bool latestBlockIsHovering = false;
  bool latestBlockIsExpanded = false;
  bool walletSelectorIsHovering = false;
  bool walletSelectorIsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final tabsRouter = AutoTabsRouter.of(context);
      final globalBalancesExpanded = ref.watch(globalBalancesExpandedProvider);

      tabsRouter.addListener(() {
        if (tabsRouter.current.name == "HomeTabRouter") {
          if (!globalBalancesExpanded) {
            ref.read(globalBalancesExpandedProvider.notifier).expand();
          }
        } else {
          if (globalBalancesExpanded) {
            ref.read(globalBalancesExpandedProvider.notifier).detract();
          }
        }
      });

      return Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 56.0),
              child: AnimatedContainer(
                duration: TRANSITION_DURATION,
                width: sideNavExpanded ? SIDE_NAV_WIDTH_EXPANDED : SIDE_NAV_WIDTH_CONTRACTED,
                curve: TRANSITION_CURVE,
                child: _SideNav(
                    isExpanded: sideNavExpanded,
                    onToggleExpanded: () {
                      setState(() {
                        sideNavExpanded = !sideNavExpanded;
                      });
                    }),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _RotatingCube(),
                  SizedBox(
                    width: 6,
                  ),
                  AnimatedOpacity(
                    duration: TRANSITION_DURATION,
                    opacity: sideNavExpanded ? 1 : 0,
                    child: Text(
                      "Verified",
                      style: TextStyle(
                        color: AppColors.getWhite(ColorShade.s400),
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mukta',
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  AnimatedOpacity(
                    duration: TRANSITION_DURATION * 2,
                    opacity: sideNavExpanded ? 1 : 0,
                    child: Consumer(builder: (context, ref, _) {
                      return AnimatedDefaultTextStyle(
                        duration: TRANSITION_DURATION,
                        style: TextStyle(
                          color: ref.watch(sessionProvider).btcSelected ? AppColors.getBtc() : AppColors.getBlue(ColorShade.s100),
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mukta',
                          letterSpacing: 0,
                        ),
                        child: Text("X"),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPadding(
            duration: TRANSITION_DURATION,
            curve: TRANSITION_CURVE,
            padding: EdgeInsets.only(left: sideNavExpanded ? SIDE_NAV_WIDTH_EXPANDED : SIDE_NAV_WIDTH_CONTRACTED),
            child: Stack(
              children: [
                Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: _BalanceRow(),
                    // ),
                    Container(
                      height: 57,
                    ),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        clipBehavior: Clip.antiAlias,
                        child: widget.child,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _BalanceRow(),
                  ),
                ),
              ],
            ),
          ),
          Consumer(
            builder: (context, ref, _) {
              const expandedHeight = 300.0;
              final btcSelected = ref.watch(sessionProvider.select((value) => value.btcSelected));
              final vfxWallet = btcSelected ? null : ref.watch(sessionProvider.select((value) => value.currentWallet));
              final btcWallet = btcSelected ? ref.watch(sessionProvider.select((value) => value.currentBtcAccount)) : null;

              return AnimatedPositioned(
                left: 0,
                bottom: walletSelectorIsExpanded ? 0 : -expandedHeight,
                duration: TRANSITION_DURATION,
                curve: TRANSITION_CURVE,
                child: MouseRegion(
                  onHover: (_) {
                    setState(() {
                      walletSelectorIsHovering = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      walletSelectorIsHovering = false;
                      walletSelectorIsExpanded = false;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(1, 2),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              walletSelectorIsExpanded = !walletSelectorIsExpanded;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.getGray(ColorShade.s300),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                              ),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AnimatedDefaultTextStyle(
                                    duration: Duration(milliseconds: 105),
                                    style: TextStyle(
                                      color: walletSelectorIsHovering ? Colors.white : Colors.white.withOpacity(0.75),
                                      fontSize: 14,
                                    ),
                                    child: Builder(builder: (context) {
                                      if (vfxWallet != null) {
                                        return Tooltip(
                                          message: "Selected VFX Account",
                                          child: Row(
                                            children: [
                                              Text(vfxWallet.address),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "[${vfxWallet.balanceLabel}]",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.getBlue(),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                            ],
                                          ),
                                        );
                                      }

                                      if (btcWallet != null) {
                                        return Tooltip(
                                          message: "Selected BTC Account",
                                          child: Row(
                                            children: [
                                              Text(btcWallet.address),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "[${btcWallet.balance} BTC]",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.getBtc(),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return Text("Select Account");
                                    }),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0, 1),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: walletSelectorIsHovering ? Colors.white : Colors.white.withOpacity(0.75),
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: expandedHeight,
                        width: 600,
                        decoration: BoxDecoration(
                          color: AppColors.getGray(ColorShade.s300),
                          // border: Border.all(
                          //   color: Colors.white.withOpacity(0.15),
                          // ),
                          border: Border(
                            top: BorderSide(
                              color: Colors.white.withOpacity(0.15),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CurrencySegementedButton(
                                    includeAny: false,
                                  ),
                                  AppButton(
                                    label: "Add Account",
                                    onPressed: () {},
                                    icon: Icons.add,
                                    variant: btcSelected ? AppColorVariant.Btc : AppColorVariant.Secondary,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: NewWalletSelectorList(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Consumer(builder: (context, ref, _) {
            final block = ref.watch(walletInfoProvider.select((v) => v?.lastestBlock));
            if (block == null) {
              return SizedBox();
            }

            return AnimatedPositioned(
              right: 0,
              bottom: latestBlockIsExpanded ? 0 : -320,
              duration: TRANSITION_DURATION,
              curve: TRANSITION_CURVE,
              child: MouseRegion(
                onHover: (_) {
                  setState(() {
                    latestBlockIsExpanded = true;
                    latestBlockIsHovering = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    latestBlockIsExpanded = false;
                    latestBlockIsHovering = false;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Transform.translate(
                      offset: Offset(1, 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.getGray(ColorShade.s300),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 105),
                                style: TextStyle(
                                  color: latestBlockIsHovering ? Colors.white : Colors.white.withOpacity(0.75),
                                  fontSize: 14,
                                ),
                                child: Text(
                                  "Block ${block.height}",
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Consumer(
                                builder: (context, ref, _) {
                                  late final Color color;
                                  late final String message;
                                  if (!ref.watch(sessionProvider).cliStarted) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "CLI Inactive";
                                  } else {
                                    final status = ref.watch(statusProvider);

                                    switch (status) {
                                      case BridgeStatus.Loading:
                                        color = Theme.of(context).colorScheme.warning;
                                        message = "VFX CLI Loading";
                                        break;
                                      case BridgeStatus.Online:
                                        color = Theme.of(context).colorScheme.success;
                                        message = "VFX Online";
                                        break;

                                      case BridgeStatus.Offline:
                                        color = Theme.of(context).colorScheme.danger;
                                        message = "VFX CLI Offline";
                                        break;
                                    }
                                  }

                                  return Tooltip(
                                    message: message,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),

                              //btc status
                              Consumer(
                                builder: (context, ref, _) {
                                  final sessionState = ref.watch(sessionProvider);

                                  late final Color color;
                                  late final String message;
                                  if (!sessionState.cliStarted) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "BTC Inactive";
                                  } else {
                                    final electrumConnected = ref.watch(electrumConnectedProvider);

                                    switch (electrumConnected) {
                                      case null:
                                        color = Theme.of(context).colorScheme.warning;
                                        message = "BTC Loading";
                                        break;
                                      case true:
                                        color = Theme.of(context).colorScheme.success;
                                        message = "BTC Online";
                                        break;

                                      case false:
                                        color = Theme.of(context).colorScheme.danger;
                                        message = "BTC Offline";
                                        break;
                                    }
                                  }

                                  return Tooltip(
                                    message: message,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),

                              //Sync Widget
                              Consumer(
                                builder: (context, ref, _) {
                                  final walletInfo = ref.watch(walletInfoProvider);
                                  final session = ref.watch(sessionProvider);

                                  late final Color color;
                                  late final String message;
                                  bool isSynced = false;
                                  if (!session.cliStarted) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "CLI Inactive";
                                  } else if (walletInfo == null) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "Loading...";
                                  } else if (walletInfo.isResyncing) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "Resyncing...";
                                  } else if (!walletInfo.isChainSynced) {
                                    color = AppColors.getGold();
                                    message = "Syncing...";
                                  } else {
                                    color = Theme.of(context).colorScheme.success;
                                    message = "Synced";
                                    isSynced = true;
                                  }

                                  if (isSynced) {
                                    return Tooltip(
                                      message: message,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: color,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    );
                                  }

                                  return Tooltip(
                                    message: message,
                                    child: SizedBox(
                                      width: 32,
                                      child: LinearProgressIndicator(
                                        value: isSynced ? 1 : null,
                                        color: color,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      height: 320,
                      child: LatestBlock(),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      );
    });
  }
}

class NewWalletSelectorList extends BaseComponent {
  const NewWalletSelectorList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final btcSelected = ref.watch(sessionProvider.select((value) => value.btcSelected));
    final vfxWallets = ref.watch(walletListProvider);

    final btcWallets = ref.watch(btcAccountListProvider);

    final selectedVfxWallet = btcSelected ? null : ref.watch(sessionProvider.select((value) => value.currentWallet));
    final selectedBtcWallet = btcSelected ? ref.watch(sessionProvider.select((value) => value.currentBtcAccount)) : null;

    if (btcSelected) {
      if (btcWallets.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "No BTC Accounts",
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 8,
              ),
              AppButton(
                label: "Add Account",
                onPressed: () {},
                variant: AppColorVariant.Btc,
                icon: Icons.add,
              )
            ],
          ),
        );
      }
      return ListView.builder(
        itemCount: btcWallets.length,
        itemBuilder: (context, index) {
          final account = btcWallets[index];
          return Card(
            color: AppColors.getGray(ColorShade.s50),
            child: ManageWalletBtcListTile(account: account),
          );
        },
      );
    }

    if (vfxWallets.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "No VFX Accounts",
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 8,
            ),
            AppButton(
              label: "Add Account",
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ModalContainer(
                        children: [
                          Card(
                            color: AppColors.getGray(),
                            child: ListTile(
                              title: Text("Import Private Key"),
                              leading: Icon(Icons.upload),
                              onTap: () async {
                                if (!await passwordRequiredGuard(context, ref)) return;
                                if (!widgetGuardWalletIsNotResyncing(ref)) return;

                                PromptModal.show(
                                  title: "Import Private Key",
                                  // titleTrailing: InkWell(
                                  //   child: const Text(
                                  //     "Bulk Import",
                                  //     style: TextStyle(
                                  //       fontSize: 12,
                                  //       // decoration: TextDecoration.underline,
                                  //       color: Colors.white70,
                                  //     ),
                                  //   ),
                                  //   onTap: () {
                                  //     Navigator.of(rootNavigatorKey.currentContext!).pop();

                                  //     showModalBottomSheet(
                                  //         context: rootNavigatorKey.currentContext!,
                                  //         builder: (context) {
                                  //           return const BulkImportWalletModal();
                                  //         });
                                  //   },
                                  // ),
                                  validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                                  labelText: "Private Key",
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
                                  lines: 4,

                                  onValidSubmission: (value) async {
                                    final resync = await ConfirmDialog.show(
                                      title: "Rescan Blocks?",
                                      body: "Would you like to rescan the chain to include any transactions relevant to this key?",
                                      confirmText: "Yes",
                                      cancelText: "No",
                                    );

                                    await ref.read(walletListProvider.notifier).import(value, false, resync == true);
                                  },
                                );
                              },
                            ),
                          ),
                          Card(
                            color: AppColors.getGray(),
                            child: ListTile(
                              title: Text("Create New Account"),
                              leading: Icon(Icons.add),
                              onTap: () async {
                                if (!await passwordRequiredGuard(context, ref)) return;

                                await ref.read(walletListProvider.notifier).create();
                              },
                            ),
                          )
                        ],
                      );
                    });
              },
              variant: AppColorVariant.Secondary,
              icon: Icons.add,
            )
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: vfxWallets.length,
      itemBuilder: (context, index) {
        final w = vfxWallets[index];

        return Card(
          color: AppColors.getGray(ColorShade.s50),
          child: ManageWalletListTile(wallet: w),
        );
      },
    );
  }
}

class _SideNav extends BaseComponent {
  final bool isExpanded;
  final VoidCallback onToggleExpanded;
  const _SideNav({super.key, required this.isExpanded, required this.onToggleExpanded});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: TRANSITION_DURATION,
              curve: TRANSITION_CURVE,
              width: isExpanded ? SIDE_NAV_WIDTH_EXPANDED : SIDE_NAV_WIDTH_CONTRACTED,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: Border.all(
                  color: AppColors.getGray(ColorShade.s50),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: _SideNavList(tabsRouter: tabsRouter, isExpanded: isExpanded),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: _Expander(onToggleExpanded: onToggleExpanded, isExpanded: isExpanded),
            )
          ],
        ),
      ),
    );
  }
}

class _Expander extends StatelessWidget {
  const _Expander({
    super.key,
    required this.onToggleExpanded,
    required this.isExpanded,
  });

  final ui.VoidCallback onToggleExpanded;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onToggleExpanded,
        child: Row(
          children: [
            Container(
              width: 3,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white30,
                border: Border(
                  left: BorderSide(
                    color: AppColors.getGray(ColorShade.s200),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.getGray(ColorShade.s100),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                child: AnimatedRotation(
                  duration: TRANSITION_DURATION,
                  curve: TRANSITION_CURVE,
                  turns: isExpanded ? 0.5 : 0,
                  child: Icon(
                    Icons.double_arrow,
                    size: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SideNavList extends BaseComponent {
  final TabsRouter tabsRouter;
  final bool isExpanded;

  const _SideNavList({
    super.key,
    required this.tabsRouter,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SideNavItem(
          title: "Dashboard",
          icon: Icons.dashboard,
          onPressed: () {
            if (tabsRouter.activeIndex == 0) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(0);
            }
          },
          isActive: tabsRouter.activeIndex == 0,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Reserve Accounts",
          icon: Icons.security,
          onPressed: () {
            tabsRouter.setActiveIndex(14);
          },
          isActive: tabsRouter.activeIndex == 14,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Send",
          icon: Icons.outbox,
          onPressed: () {
            tabsRouter.setActiveIndex(1);
          },
          isActive: tabsRouter.activeIndex == 1,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Receive",
          icon: Icons.move_to_inbox,
          onPressed: () {
            tabsRouter.setActiveIndex(2);
          },
          isActive: tabsRouter.activeIndex == 2,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Transactions",
          icon: Icons.paid,
          onPressed: () {
            tabsRouter.setActiveIndex(3);
          },
          isActive: tabsRouter.activeIndex == 3,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Validator",
          icon: Icons.check_circle,
          onPressed: () {
            tabsRouter.setActiveIndex(4);
          },
          isActive: tabsRouter.activeIndex == 4,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Domains",
          icon: Icons.link,
          onPressed: () {
            tabsRouter.setActiveIndex(10);
          },
          isActive: tabsRouter.activeIndex == 10,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Tokenize Bitcoin",
          icon: FontAwesomeIcons.bitcoin,
          onPressed: () {
            tabsRouter.setActiveIndex(15);
          },
          isActive: tabsRouter.activeIndex == 15,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Smart Contracts",
          icon: Icons.receipt_long,
          onPressed: () {
            if (ref.read(sessionProvider).currentWallet == null) {
              Toast.error("A wallet is required to access this section.");
              return;
            }
            tabsRouter.setActiveIndex(8);
            tabsRouter.popTop();
          },
          isActive: tabsRouter.activeIndex == 8,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Fungible Tokens",
          icon: Icons.toll,
          onPressed: () {
            if (tabsRouter.activeIndex == 13) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(13);
            }
          },
          isActive: tabsRouter.activeIndex == 13,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "NFTs",
          icon: Icons.lightbulb_outline,
          onPressed: () {
            if (ref.read(sessionProvider).currentWallet == null) {
              Toast.error("A wallet is required to access this section.");
              return;
            }
            tabsRouter.setActiveIndex(7);
            tabsRouter.popTop();
          },
          isActive: tabsRouter.activeIndex == 7,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "P2P Auctions",
          icon: Icons.leak_add,
          onPressed: () {
            if (tabsRouter.activeIndex == 9) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(9);
            }
          },
          isActive: tabsRouter.activeIndex == 9,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Operations",
          icon: Icons.bolt,
          onPressed: () {
            if (tabsRouter.activeIndex == 16) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(16);
            }
          },
          isActive: tabsRouter.activeIndex == 16,
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}

class _SideNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  final bool isActive;
  final bool isExpanded;
  const _SideNavItem({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    required this.isActive,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: TRANSITION_DURATION,
          decoration: BoxDecoration(color: isActive ? AppColors.getBlue() : Colors.white30),
          child: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: AnimatedContainer(
              duration: TRANSITION_DURATION,
              decoration: BoxDecoration(
                  color: isActive ? AppColors.getGray(ColorShade.s50) : AppColors.getGray(ColorShade.s200),
                  border: Border(
                    top: BorderSide(
                      color: isActive ? AppColors.getBlue().withOpacity(0.1) : Colors.transparent,
                    ),
                    bottom: BorderSide(
                      color: isActive ? AppColors.getBlue().withOpacity(0.05) : Colors.transparent,
                    ),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: TRANSITION_DURATION,
                      decoration: BoxDecoration(
                        color: AppColors.getIndigo(),
                      ),
                      width: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        size: 20,
                        color: isActive ? AppColors.getBlue(ColorShade.s100) : AppColors.getWhite(ColorShade.s400),
                      ),
                    ),
                    Flexible(
                      child: AnimatedOpacity(
                        duration: TRANSITION_DURATION,
                        opacity: isExpanded ? 1 : 0,
                        child: Text(
                          title,
                          overflow: TextOverflow.visible,
                          softWrap: false,
                          style: TextStyle(
                            color: isActive ? AppColors.getBlue(ColorShade.s100) : AppColors.getWhite(ColorShade.s400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RotatingCube extends BaseComponent {
  const _RotatingCube({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sessionProvider).btcSelected
        ? Image.asset(
            Assets.images.animatedCubeBtc.path,
            scale: 1,
            width: 42,
            height: 42,
          )
        : Image.asset(
            Assets.images.animatedCube.path,
            scale: 1,
            width: 42,
            height: 42,
          );
  }
}

class _BalanceRow extends BaseComponent {
  const _BalanceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vfxBalance = ref.watch(sessionProvider).totalBalance;
    final btcBalance = ref.watch(btcBalanceProvider);

    final allVfxWallets = ref.watch(walletListProvider);
    final vfxWallets = allVfxWallets.where((w) => !w.isReserved);
    final raWallets = allVfxWallets.where((w) => w.isReserved);

    final btcAccounts = ref.watch(btcAccountListProvider);

    final vbtcTokens = ref.watch(tokenizedBitcoinListProvider);

    double vBtcBalance = 0;
    for (final a in vbtcTokens) {
      vBtcBalance += a.myBalance;
    }

    final vfxTxs = ref.watch(transactionListProvider(TransactionListType.All));

    final latestVfxTx = vfxTxs.isEmpty ? null : vfxTxs.first;

    final forceExpand = ref.watch(globalBalancesExpandedProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _TopBalanceItem(
            forceExpand: forceExpand,
            heading: vfxBalance != null ? "$vfxBalance VFX" : "0.0 VFX",
            headingColor: AppColors.getBlue(),
            accountCount: raWallets.isNotEmpty && vfxWallets.isNotEmpty
                ? "${vfxWallets.length} Wallet${vfxWallets.length == 1 ? '' : 's'}   ${raWallets.length} Reserve Account${raWallets.length == 1 ? '' : 's'}"
                : "${allVfxWallets.length} Wallet${allVfxWallets.length == 1 ? '' : 's'}",
            actions: [
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.wallet,
                label: "View\nAccounts",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.add,
                label: "Add\nAccount",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: FontAwesomeIcons.coins,
                iconScale: 0.75,
                label: "Get\nVFX",
                size: AppVerticalIconButtonSize.sm,
              ),
            ],
            latestTx: latestVfxTx != null
                ? Builder(builder: (context) {
                    final tx = latestVfxTx;
                    return AppCard(
                      padding: 12,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (tx.type == TxType.rbxTransfer)
                            Text(
                              "${tx.amount} VFX",
                              style: TextStyle(
                                color: tx.amount < 0 ? Colors.red.shade500 : Theme.of(context).colorScheme.success,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          else
                            Text(
                              tx.typeLabel,
                              style: TextStyle(
                                color: AppColors.getBlue(),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          Text(
                            "From: ${tx.fromAddress}\nTo: ${tx.toAddress}",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white.withOpacity(0.9),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  })
                : null,
          ),
        ),
        _BalanceRowConnector(),
        Expanded(
          child: _TopBalanceItem(
            forceExpand: forceExpand,
            heading: "$vBtcBalance vBTC",
            headingColor: AppColors.getWhite(),
            accountCount: "${vbtcTokens.length} Token${vbtcTokens.length == 1 ? '' : 's'}",
            actions: [
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.wallet,
                label: "View\nAccounts",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: FontAwesomeIcons.bitcoin,
                iconScale: 0.75,
                label: "vBTC\nTokens",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.help_rounded,
                label: "What's\nvBTC",
                size: AppVerticalIconButtonSize.sm,
              ),
            ],
          ),
        ),
        _BalanceRowConnector(),
        Expanded(
          child: _TopBalanceItem(
            forceExpand: forceExpand,
            heading: "$btcBalance BTC",
            headingColor: AppColors.getBtc(),
            accountCount: "${btcAccounts.length} Wallet${btcAccounts.length == 1 ? '' : 's'}",
            actions: [
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.wallet,
                label: "View\nAccounts",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.add,
                label: "Add\nAccount",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: FontAwesomeIcons.btc,
                iconScale: 0.75,
                label: "Get\nBTC",
                size: AppVerticalIconButtonSize.sm,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BalanceRowConnector extends StatelessWidget {
  const _BalanceRowConnector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        width: 16,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.white.withOpacity(0.075),
              width: 2,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.getBlue().withOpacity(0.2),
              blurRadius: 12,
            )
          ],
        ),
      ),
    );
  }
}

class _TopBalanceItem extends StatefulWidget {
  final String heading;
  final Color headingColor;
  final String accountCount;
  final List<Widget> actions;
  final Widget? latestTx;
  final bool forceExpand;

  const _TopBalanceItem({
    super.key,
    required this.heading,
    required this.headingColor,
    required this.accountCount,
    this.actions = const [],
    this.latestTx,
    required this.forceExpand,
  });

  @override
  State<_TopBalanceItem> createState() => _TopBalanceItemState();
}

class _TopBalanceItemState extends State<_TopBalanceItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onExit: (_) {
        setState(() {
          isExpanded = false;
        });
      },
      onEnter: (_) {
        setState(() {
          isExpanded = true;
        });
      },
      child: GestureDetector(
        onTap: () {},
        child: AppCard(
          padding: 6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: TRANSITION_DURATION,
                curve: Curves.easeInOut,
                height: widget.forceExpand || isExpanded ? 240 : 0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: ScrollConfiguration(
                  behavior: NoThumbScrollBehavior().copyWith(
                    scrollbars: false,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.accountCount,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Latest TX:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "View All Txs",
                                  style: TextStyle(
                                    color: widget.headingColor.withOpacity(0.65),
                                    fontSize: 13,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: widget.latestTx ??
                                  SizedBox(
                                    width: 250,
                                    height: 100,
                                    child: AppCard(
                                      child: Center(
                                        child: Text(
                                          "No Transactions",
                                          style: Theme.of(context).textTheme.caption,
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        Wrap(
                          children: widget.actions,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                widget.heading,
                style: TextStyle(
                  fontSize: 24,
                  color: widget.headingColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}
