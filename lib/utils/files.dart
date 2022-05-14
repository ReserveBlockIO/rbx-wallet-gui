import 'dart:io';

import 'package:process_run/shell.dart';

openFile(String path) {
  final shell = Shell(throwOnError: false);
  String cmd = "start '$path'";
  if (Platform.isMacOS) {
    cmd = "open '$path'";
  }
  shell.run(cmd);
}
