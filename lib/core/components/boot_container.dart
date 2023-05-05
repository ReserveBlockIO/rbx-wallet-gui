import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/startup/startup_data_provider.dart';

import '../../features/bridge/providers/log_provider.dart';
import '../base_component.dart';

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

    final List<LogEntry> truncatedLogs =
        logs.isEmpty ? [] : logs.getRange(start, logs.length - 1).toList();

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
            .toList(),
        if (ref.watch(startupDataProvider) != null)
          Builder(builder: (context) {
            final data = ref.watch(startupDataProvider)!;
            return Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Syncing state treis due to improper shutdown"
                            .toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.warning),
                      ),
                      const SizedBox(height: 6),
                      const Divider(),
                      Text(
                        "Block: ${data.block}",
                        style: const TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Progress: ${data.percent}",
                        style: const TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.green,
                          minHeight: 8,
                          backgroundColor: Colors.black45,
                          value: data.fraction,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Please do not close your wallet.",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          })
      ],
    );
  }
}
