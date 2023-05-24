import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/utils/html_helpers.dart';
import 'package:rbx_wallet/utils/toast.dart';

void paymentRedirect({
  String fiatType = "USD",
  required double amount,
}) {
  final domain = Env.paymentDomain;

  if (domain == null) {
    Toast.error("Payment not available in this environment");
  }

  const COIN_TYPE = "ETH";

  final url = "$domain/?coinType=$COIN_TYPE&fiatType=$fiatType&fiatAmount=$amount&blockchain=$COIN_TYPE";

  HtmlHelpers().redirect(url);
}

void openPaymentPopup({
  String fiatType = "USD",
  required double amount,
}) {}

String paymentUrl({
  String fiatType = "USD",
  required double amount,
}) {
  final domain = Env.paymentDomain;

  if (domain == null) {
    print("Payment not available in this environment");
  }

  const COIN_TYPE = "ETH";

  final url = "$domain/?coinType=$COIN_TYPE&fiatType=$fiatType&fiatAmount=$amount&blockchain=$COIN_TYPE";

  return url;
}
