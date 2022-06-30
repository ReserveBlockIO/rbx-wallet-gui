import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';

class BootContainer extends BaseComponent {
  const BootContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(logProvider);
    int start = 0;
    const maxLogs = 7;
    if (logs.length >= maxLogs) {
      start = logs.length - maxLogs;
    }

    final truncatedLogs = logs.getRange(start, logs.length - 1);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
        const SizedBox(
          height: 32,
        ),
        ...truncatedLogs
            .map((m) => Text(
                  m.message,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ))
            .toList()
      ],
    );
  }
}
