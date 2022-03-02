import 'package:intl/intl.dart';

String formatIntWithCommas(int number) {
  NumberFormat numberFormat = NumberFormat('#,##,000');
  return numberFormat.format(number);
}
