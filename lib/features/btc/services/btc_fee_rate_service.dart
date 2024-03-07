import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/btc/models/btc_recommended_fees.dart';

class BtcFeeRateService extends BaseService {
  BtcFeeRateService()
      : super(
          hostOverride: "https://mempool.space/",
        );

  Future<BtcRecommendedFees> recommended() async {
    try {
      final data = await getJson("${Env.isTestNet ? '/testnet' : ''}/api/v1/fees/recommended");
      return BtcRecommendedFees.fromJson(data);
    } catch (e) {
      print(e);
      return BtcRecommendedFees.fallback();
    }
  }
}
