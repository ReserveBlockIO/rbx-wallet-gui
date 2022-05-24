import 'dart:io';

// import 'package:process_run/shell.dart';
import 'package:url_launcher/url_launcher.dart';

// openFile(String path) {

//   final shell = Shell(throwOnError: false);
//   String cmd = "start '$path'";
//   if (Platform.isMacOS) {
//     cmd = "open '$path'";
//   }
//   shell.run(cmd);
// }

Future<void> openFile(File file) async {
  final path = file.path;

  launch("file://$path");
}
