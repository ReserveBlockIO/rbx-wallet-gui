import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

Future<void> openFile(File file) async {
  launchUrl(file.uri);
}
