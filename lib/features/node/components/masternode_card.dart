import 'package:flutter/material.dart';

import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import '../models/masternode.dart';

class MasternodeCard extends StatelessWidget {
  final Masternode masternode;
  const MasternodeCard(this.masternode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
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
                  variant: masternode.isActive ? AppColorVariant.Success : AppColorVariant.Danger,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        masternode.uniqueName,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                      ),
                      SelectableText(
                        masternode.address,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Connection Date: ${masternode.dateTimeLabel}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "Blocks: ${masternode.blockCount}",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
