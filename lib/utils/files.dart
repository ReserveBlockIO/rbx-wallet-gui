import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

Future<void> openFile(File file) async {
  try {
    await launchUrl(file.uri);
  } catch (e) {
    launchUrl(File(file.parent.path).uri);
  }
}
