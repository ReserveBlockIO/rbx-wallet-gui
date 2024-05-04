import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CurrencyType {
  any,
  vfx,
  btc,
}

class CurrencySegementedButtonProvider extends StateNotifier<CurrencyType> {
  CurrencySegementedButtonProvider() : super(CurrencyType.any);

  set(CurrencyType type) {
    state = type;
  }
}

final currencySegementedButtonProvider = StateNotifierProvider<CurrencySegementedButtonProvider, CurrencyType>((ref) {
  return CurrencySegementedButtonProvider();
});
