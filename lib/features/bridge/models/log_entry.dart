import 'package:rbx_wallet/core/theme/app_theme.dart';

class LogEntry {
  final String message;
  final AppColorVariant variant;
  final String? textToCopy;

  LogEntry({
    required this.message,
    this.variant = AppColorVariant.Info,
    this.textToCopy,
  });
}
