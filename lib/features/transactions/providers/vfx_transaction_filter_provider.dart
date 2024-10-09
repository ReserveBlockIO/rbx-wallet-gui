import 'package:flutter_riverpod/flutter_riverpod.dart';

class VfxTransactionFilterState {
  final List<int> txTypes;
  final String address;

  VfxTransactionFilterState({
    required this.txTypes,
    required this.address,
  });

  VfxTransactionFilterState copyWith({List<int>? txTypes, String? address}) {
    return VfxTransactionFilterState(
      txTypes: txTypes ?? this.txTypes,
      address: address ?? this.address,
    );
  }

  int get filterCount {
    return txTypes.length + (address.isNotEmpty ? 1 : 0);
  }
}

class VfxTransactionFilterProvider extends StateNotifier<VfxTransactionFilterState> {
  VfxTransactionFilterProvider() : super(VfxTransactionFilterState(txTypes: [], address: ''));

  addTxType(int txType) {
    state = state.copyWith(txTypes: [...state.txTypes, txType]);
  }

  removeTxType(int txType) {
    state = state.copyWith(txTypes: [...state.txTypes]..removeWhere((i) => i == txType));
  }

  clear() {
    state = VfxTransactionFilterState(txTypes: [], address: '');
  }

  setAddress(String? address) {
    state = state.copyWith(address: address ?? '');
  }
}

final vfxTransactionFilterProvider =
    StateNotifierProvider<VfxTransactionFilterProvider, VfxTransactionFilterState>((ref) => VfxTransactionFilterProvider());
