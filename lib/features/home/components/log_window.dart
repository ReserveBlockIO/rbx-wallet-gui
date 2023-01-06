import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/home/components/log_item.dart';

class LogWindow extends BaseComponent {
  const LogWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logEntries = ref.watch(logProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Status Log",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(height: 8),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: SizedBox(
              height: ref.watch(sessionProvider).logWindowExpanded ? 600 : 150,
              width: double.infinity,
              child: Stack(
                children: [
                  ListView.builder(
                    controller: ref.read(logProvider.notifier).scrollController,
                    itemCount: logEntries.length,
                    itemBuilder: (context, index) {
                      final entry = logEntries[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LogItem(entry),
                          if (index + 1 == logEntries.length)
                            SizedBox(
                              height: 28,
                            )
                        ],
                      );
                    },
                  ),
                  // SingleChildScrollView(
                  //   controller: scrollController,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: logEntries.map((entry) => LogItem(entry)).toList(),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ref.watch(sessionProvider).logWindowExpanded
                        ? AppButton(
                            label: "Collapse",
                            onPressed: () {
                              ref.read(sessionProvider.notifier).setLogWindowExpanded(false);
                            },
                            variant: AppColorVariant.Info,
                            size: AppSizeVariant.Sm,
                            type: AppButtonType.Text,
                            icon: Icons.arrow_upward_rounded,
                          )
                        : AppButton(
                            label: "Clear",
                            onPressed: () {
                              ref.read(logProvider.notifier).clear();
                            },
                            variant: AppColorVariant.Info,
                            size: AppSizeVariant.Sm,
                            type: AppButtonType.Text,
                            icon: Icons.clear,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
