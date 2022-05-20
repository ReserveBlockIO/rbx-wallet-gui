import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/node/models/masternode.dart';

class MasternodeCard extends StatelessWidget {
  final Masternode masternode;
  const MasternodeCard(this.masternode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AppBadge(
                  label: masternode.isActive ? "Active" : "Inactive",
                  variant: masternode.isActive
                      ? AppColorVariant.Success
                      : AppColorVariant.Danger,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        masternode.uniqueName,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SelectableText(
                        masternode.address,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Connection Date: ${masternode.dateTimeLabel}",
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  "Blocks: ${masternode.blockCount}",
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
