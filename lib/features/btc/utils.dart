import 'package:rbx_wallet/core/app_constants.dart';

double satashisToBtc(int satashis) {
  return satashis * BTC_SATOSHI_MULTIPLIER;
}

String satashiToBtcLabel(int satashis) {
  return satashisToBtc(satashis).toStringAsFixed(9);
}

int satashiTxFeeEstimate(int satashis) {
  return satashis * BTC_TX_EXPECTED_BYTES;
}

String btcTxFeeEstimateLabel(int satashis) {
  return (satashis * BTC_TX_EXPECTED_BYTES * BTC_SATOSHI_MULTIPLIER).toStringAsFixed(9);
}
