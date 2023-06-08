import 'package:rbx_wallet/core/env.dart';

String? paymentUrl({
  String fiatType = "USD",
  required double amount,
  required String walletAddress,
}) {
  final domain = Env.paymentDomain;

  if (domain == null) {
    print("Payment not available in this environment");
    return null;
  }

  const COIN_TYPE = "ETH";

  final url = "$domain/?coinType=$COIN_TYPE&fiatType=$fiatType&coinAmount=$amount&blockchain=$COIN_TYPE&walletAddress=$walletAddress";
  print(url);
  return url;
}
