import 'package:intl/intl.dart';

class BtcAccountSyncInfo {
  final DateTime lastSync;
  final DateTime nextSync;

  const BtcAccountSyncInfo({
    required this.lastSync,
    required this.nextSync,
  });

  String get lastSyncFormatted {
    return DateFormat.Hms().format(lastSync.toLocal());
  }

  String get nextSyncFormatted {
    return DateFormat.Hms().format(nextSync.toLocal());
  }
}
