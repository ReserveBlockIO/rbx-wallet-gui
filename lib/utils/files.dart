import 'dart:io';
import 'package:open_file/open_file.dart';

Future<void> openFile(File file) async {
  final path = File.fromUri(file.uri).path;

  OpenFile.open(path);
}
