import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';

String formatIntWithCommas(int number) {
  NumberFormat numberFormat = NumberFormat.decimalPattern('en_us');
  return numberFormat.format(number);
}

String readableFileSize(int value, {bool base1024 = true}) {
  final base = base1024 ? 1024 : 1000;
  if (value <= 0) return "0";
  final units = ["B", "kB", "MB", "GB", "TB"];
  int digitGroups = (log(value) / log(base)).round();
  return "${NumberFormat("#,##0.#").format(value / pow(base, digitGroups))} ${units[digitGroups]}";
}

String getPrettyJSONString(jsonObject) {
  var encoder = const JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}
