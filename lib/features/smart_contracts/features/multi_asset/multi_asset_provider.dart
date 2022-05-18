import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/asset/asset.dart';

class MultiAssetFormProvider extends StateNotifier<List<Asset>> {
  final Reader read;

  MultiAssetFormProvider(this.read, [List<Asset> model = const []])
      : super(model);

  void addAsset(Asset asset) {
    state = [...state, asset];
  }

  void removeAsset(int index) {
    state = [...state]..removeAt(index);
  }

  void clear() {
    state = [];
  }
}

final multiAssetFormProvider =
    StateNotifierProvider<MultiAssetFormProvider, List<Asset>>(
  (ref) => MultiAssetFormProvider(ref.read),
);
