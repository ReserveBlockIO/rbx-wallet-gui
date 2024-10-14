import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/env.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../core/theme/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../core/base_component.dart';
import '../../core/theme/colors.dart';
import '../../utils/formatting.dart';
import '../bridge/providers/wallet_info_provider.dart';
import 'block.dart';
import 'block_transaction_list_bottom_sheet.dart';

class LatestBlock extends BaseComponent {
  final Block? blockOverride;
  final Color? backgroundColor;
  const LatestBlock({
    Key? key,
    this.blockOverride,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestBlock = blockOverride ?? ref.watch(walletInfoProvider)?.lastestBlock;

    if (latestBlock == null) {
      return const SizedBox();
    }
    return Transform.translate(
      offset: Offset(1, 1),
      child: GestureDetector(
        onTap: () {
          ref.read(walletInfoProvider.notifier).infoLoop(false);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.getGray(ColorShade.s300),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0)),
            border: Border.all(
              color: Colors.white.withOpacity(0.15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: LatestBlockContent(latestBlock: latestBlock),
          ),
        ),
      ),
    );
  }
}

class LatestBlockContent extends StatelessWidget {
  const LatestBlockContent({
    super.key,
    required this.latestBlock,
  });

  final Block latestBlock;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DetailItem(
          label: "Hash",
          value: latestBlock.hash,
          trailing: Text(
            timeago.format(
              DateTime.fromMillisecondsSinceEpoch(
                latestBlock.timestamp * 1000,
              ),
            ),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: _DetailItem(
                label: "Craft Time",
                value: "${(latestBlock.craftTime / 1000)} seconds",
              ),
            ),
            Expanded(
              child: _DetailItem(
                label: "Size",
                value: formatIntWithCommas(latestBlock.size),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _DetailItem(
                label: "# of Txs",
                value: "${latestBlock.numberOfTransactions}",
              ),
            ),
            if (latestBlock.transactions.isNotEmpty)
              Expanded(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BlockTransactionListBottomSheet(transactions: latestBlock.transactions);
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "View Txs",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10, color: Theme.of(context).colorScheme.secondary, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _DetailItem(
                label: "Total Amount",
                value: "${latestBlock.totalAmount} VFX",
              ),
            ),
            Expanded(
              child: _DetailItem(
                label: "Total Reward",
                value: "${latestBlock.totalReward} VFX",
              ),
            ),
          ],
        ),
        _DetailItem(
          label: "Validated By",
          value: latestBlock.validator,
          mono: true,
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                launchUrlString(Env.explorerWebsiteBaseUrl);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "VFX Explorer",
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.secondary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Transform.translate(
                    offset: Offset(0, 1),
                    child: Icon(
                      Icons.open_in_new,
                      size: 10,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (Env.isTestNet) {
                  launchUrlString("https://mempool.space/testnet4/");
                } else {
                  launchUrlString("https://mempool.space/");
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "BTC Explorer",
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.btcOrange,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Transform.translate(
                    offset: Offset(0, 1),
                    child: Icon(
                      Icons.open_in_new,
                      size: 10,
                      color: Theme.of(context).colorScheme.btcOrange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
      ],
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  final bool mono;
  final Widget? trailing;
  const _DetailItem({
    Key? key,
    required this.label,
    required this.value,
    this.mono = false,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            trailing ?? SizedBox.shrink()
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: mono ? 10 : null, fontFamily: mono ? "RobotoMono" : null, color: Colors.white38),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
