import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/transaction_notification_provider.dart';

class NotificationOverlay extends BaseComponent {
  const NotificationOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (Env.isTestNet) {
    //   return SizedBox.shrink();
    // }

    final notifications = ref.watch(transactionNotificationProvider);

    return IgnorePointer(
      ignoring: false,
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: EdgeInsets.all(notifications.isEmpty ? 0 : 8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final n = notifications[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: MouseRegion(
                      cursor: n.onPressed != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
                      child: GestureDetector(
                        onTap: n.onPressed,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: AppTheme.appVariantToColor(context, n.color),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                spreadRadius: 6,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (n.icon != null)
                                        Padding(
                                          padding: const EdgeInsets.only(right: 6.0),
                                          child: Icon(
                                            n.icon,
                                            color: AppTheme.appVariantToColor(context, n.color),
                                          ),
                                        ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            n.title,
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1),
                                          ),
                                          if (n.body != null)
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                n.body!,
                                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                      fontSize: 12,
                                                      height: 1,
                                                    ),
                                              ),
                                            )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      child: const Icon(
                                        Icons.close,
                                        size: 14,
                                        color: Colors.white70,
                                      ),
                                      onTap: () {
                                        ref.read(transactionNotificationProvider.notifier).remove(n.identifier);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
