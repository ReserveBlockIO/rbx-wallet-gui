import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../bridge/models/log_entry.dart';

class LogItem extends StatelessWidget {
  final LogEntry entry;

  const LogItem(this.entry, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SelectableText(
            entry.message,
            style: TextStyle(
              color: entry.colorOverride ?? AppTheme.appVariantToColor(context, entry.variant),
              height: 1.5,
              fontFamily: "RobotoMono",
            ),
          ),
        ),
        if (entry.trailing != null) entry.trailing!,
        if (entry.textToCopy != null)
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 12),
            child: InkWell(
              onTap: () async {
                await Clipboard.setData(
                  ClipboardData(text: entry.textToCopy),
                );
                Toast.message("${entry.textToCopy} copied to clipboard");
              },
              child: const Icon(
                Icons.copy,
                size: 12,
              ),
            ),
          ),
      ],
    );
  }
}
