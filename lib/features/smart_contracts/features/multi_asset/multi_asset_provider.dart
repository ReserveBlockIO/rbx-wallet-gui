import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/generators.dart';
import '../../../asset/asset.dart';
import '../../models/multi_asset.dart';
import '../../providers/create_smart_contract_provider.dart';

class MultiAssetFormProvider extends StateNotifier<MultiAsset> {
  final Reader read;

  MultiAssetFormProvider(this.read, [MultiAsset model = const MultiAsset()]) : super(model);

  void setMultiAsset(MultiAsset multiAsset) {
    state = multiAsset;
  }

  void addAsset(Asset asset) {
    state = state.copyWith(assets: [...state.assets, asset]);
  }

  void removeAsset(int index) {
    state = state.copyWith(assets: [...state.assets]..removeAt(index));
  }

  void clear() {
    final id = uniqueId();
    state = MultiAsset(id: id);
  }

  void complete() {
    if (state.assets.isEmpty) {
      read(createSmartContractProvider.notifier).removeMultiAsset(state);
    } else {
      read(createSmartContractProvider.notifier).saveMultiAsset(state);
    }
    clear();
  }
}

final multiAssetFormProvider = StateNotifierProvider<MultiAssetFormProvider, MultiAsset>(
  (ref) => MultiAssetFormProvider(ref.read),
);
