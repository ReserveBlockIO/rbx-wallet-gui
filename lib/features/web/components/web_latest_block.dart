import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/env.dart';

import '../../../core/base_component.dart';
import '../../../core/components/centered_loader.dart';
import '../../block/latest_block.dart';
import '../providers/web_latest_block_provider.dart';

class WebLatestBlock extends BaseComponent {
  const WebLatestBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final block = ref.watch(webLatestBlockProvider);

    if (block == null) {
      return const SizedBox(
        height: 200,
        child: CenteredLoader(),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(
          //   "Latest Block",
          //   style: Theme.of(context)
          //       .textTheme
          //       .caption!
          //       .copyWith(color: Colors.white),
          // ),
          // SizedBox(height: 8),
          LatestBlock(
            blockOverride: block.toNativeBlock(),
            // backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
