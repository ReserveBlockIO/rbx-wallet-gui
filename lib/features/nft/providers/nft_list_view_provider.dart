import 'package:flutter_riverpod/flutter_riverpod.dart';

class NftListViewProvider extends StateNotifier<bool> {
  final Ref ref;

  NftListViewProvider(this.ref, [bool isGrid = true]) : super(isGrid);

  void setGrid() {
    state = true;
  }

  void setList() {
    state = false;
  }

  void toggle() {
    state = !state;
  }
}

final nftListViewProvider = StateNotifierProvider<NftListViewProvider, bool>(
  (ref) => NftListViewProvider(ref),
);
