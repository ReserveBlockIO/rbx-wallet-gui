import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';

class LogItem extends StatelessWidget {
  final LogEntry entry;

  const LogItem(this.entry, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        color: Colors.black12,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(entry.message),
        ),
      ),
    );
  }
}
