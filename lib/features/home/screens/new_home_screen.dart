import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import 'package:rbx_wallet/features/bridge/providers/status_provider.dart';
import 'package:rbx_wallet/features/btc/providers/btc_balance_provider.dart';
import 'package:rbx_wallet/features/btc/providers/electrum_connected_provider.dart';
import 'package:rbx_wallet/features/btc/providers/tokenized_bitcoin_list_provider.dart';
import 'package:rbx_wallet/features/home/components/home_buttons.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

import '../../../core/theme/colors.dart';

class NewHomeScreen extends BaseScreen {
  const NewHomeScreen({
    super.key,
    super.verticalPadding = 0,
    super.horizontalPadding = 0,
    super.backgroundColor = Colors.black,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Dashboard"),
      // backgroundColor: AppColors.getBlue(ColorShade.s50).withOpacity(0.1),
      backgroundColor: Colors.transparent,

      shadowColor: Colors.transparent,
      centerTitle: true,
      // actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: AppCard(
                    fullWidth: true,
                    child: HomeButtons(
                      includeRestoreHd: ref.watch(walletListProvider).isEmpty,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                AppCard(
                  child: Opacity(
                    opacity: 0.7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _StatusIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        _BtcStatusIndicator(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _Balance(),
                SizedBox(width: 16),
                Expanded(child: _MainActions()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BtcStatusIndicator extends BaseComponent {
  const _BtcStatusIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(sessionProvider);

    if (!sessionState.cliStarted) {
      return SizedBox();
    }

    final electrumConnected = ref.watch(electrumConnectedProvider);

    final btcAccountSyncInfo = sessionState.btcAccountSyncInfo;

    switch (electrumConnected) {
      case null:
        return const AppBadge(
          label: "BTC Loading",
          variant: AppColorVariant.Light,
        );
      case true:
        return Tooltip(
          message: btcAccountSyncInfo != null
              ? "Last Sync: ${btcAccountSyncInfo.lastSyncFormatted}\nNext Sync: ${btcAccountSyncInfo.nextSyncFormatted}"
              : "",
          child: const AppBadge(
            label: "BTC Online",
            variant: AppColorVariant.Btc,
          ),
        );
      case false:
        return const AppBadge(
          label: "BTC Offline",
          variant: AppColorVariant.Danger,
        );
    }

    return SizedBox();
  }
}

class _StatusIndicator extends BaseComponent {
  const _StatusIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(sessionProvider).cliStarted) {
      return const AppBadge(
        label: "CLI Inactive",
        variant: AppColorVariant.Danger,
      );
    }
    final status = ref.watch(statusProvider);

    switch (status) {
      case BridgeStatus.Loading:
        return const AppBadge(
          label: "Loading",
          variant: AppColorVariant.Primary,
        );
      case BridgeStatus.Online:
        return const AppBadge(
          label: "VFX Online",
          variant: AppColorVariant.Success,
        );
      case BridgeStatus.Offline:
        return const AppBadge(
          label: "VFX Offline",
          variant: AppColorVariant.Danger,
        );
    }
  }
}

class _Balance extends ConsumerWidget {
  const _Balance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalBalance = ref.watch(sessionProvider).totalBalance;
    final btcBalance = ref.watch(btcBalanceProvider);

    double vBtcBalance = 0;
    for (final a in ref.watch(tokenizedBitcoinListProvider)) {
      vBtcBalance += a.myBalance;
    }

    return AppCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Total Balance",
            style: TextStyle(
              color: AppColors.getWhite(
                ColorShade.s300,
              ),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            totalBalance != null ? "$totalBalance VFX" : "0.0 VFX",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.getBlue(),
                  fontSize: 24,
                  height: 1.3,
                ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${btcBalance.toStringAsFixed(9)} BTC",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.btcOrange,
                  fontSize: 18,
                  height: 1.3,
                ),
          ),
          SizedBox(
            height: 5,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    height: 1.3,
                  ),
              children: [
                TextSpan(
                  text: "$vBtcBalance",
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: " ",
                ),
                TextSpan(
                  text: "v",
                  style: TextStyle(
                    color: AppColors.getBlue(),
                  ),
                ),
                TextSpan(
                  text: "BTC",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MainActions extends StatelessWidget {
  const _MainActions({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Center(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _MainActionButton(
                label: "Add\nWallet",
                icon: Icons.add,
                onPressed: () {},
              ),
              _MainActionButton(
                label: "Send\nCoin",
                icon: Icons.arrow_upward,
                onPressed: () {},
              ),
              _MainActionButton(
                label: "TX\nHistory",
                icon: Icons.history,
                onPressed: () {},
              ),
              _MainActionButton(
                label: "Tokenize\nBTC",
                icon: FontAwesomeIcons.bitcoin,
                onPressed: () {},
              ),
              _MainActionButton(
                label: "Mint\nNFT",
                icon: Icons.lightbulb_outline,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainActionButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  const _MainActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  State<_MainActionButton> createState() => _MainActionButtonState();
}

class _MainActionButtonState extends State<_MainActionButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (v) {
        setState(() {
          isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: SizedBox(
          width: 80,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isHovering ? AppColors.getGold(ColorShade.s50) : AppColors.getGold(ColorShade.s100),
                      borderRadius: isHovering ? BorderRadius.circular(8) : BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Icon(
                        widget.icon,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: isHovering ? AppColors.getGold(ColorShade.s50) : AppColors.getGold(ColorShade.s100),
                      fontSize: 16,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
