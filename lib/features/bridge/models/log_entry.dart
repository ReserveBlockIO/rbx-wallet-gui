import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class LogEntry {
  final String message;
  final AppColorVariant variant;
  final String? textToCopy;
  final Color? colorOverride;
  final Widget? trailing;

  LogEntry({
    required this.message,
    this.variant = AppColorVariant.Info,
    this.textToCopy,
    this.colorOverride,
    this.trailing,
  });
}
