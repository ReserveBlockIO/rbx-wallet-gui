import '../../../core/env.dart';
import '../../../core/services/base_service.dart';
import '../models/btc_recommended_fees.dart';

class BtcFeeRateService extends BaseService {
  BtcFeeRateService()
      : super(
          hostOverride: "https://mempool.space/",
        );

  Future<BtcRecommendedFees> recommended() async {
    try {
      final data = await getJson("${Env.isTestNet ? '/testnet4' : ''}/api/v1/fees/recommended");
      return BtcRecommendedFees.fromJson(data);
    } catch (e) {
      print(e);
      return BtcRecommendedFees.fallback();
    }
  }
}
