import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CurrencyType {
  any,
  vfx,
  btc,
}

class CurrencySegementedButtonProvider extends StateNotifier<CurrencyType> {
  final String family;

  CurrencySegementedButtonProvider(this.family) : super(CurrencyType.any);

  set(CurrencyType type) {
    state = type;
  }
}

final currencySegementedButtonProvider = StateNotifierProvider.family<CurrencySegementedButtonProvider, CurrencyType, String>((ref, family) {
  return CurrencySegementedButtonProvider(family);
});
