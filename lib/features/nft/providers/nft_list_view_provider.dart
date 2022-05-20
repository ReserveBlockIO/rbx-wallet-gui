import 'package:flutter_riverpod/flutter_riverpod.dart';

class NftListViewProvider extends StateNotifier<bool> {
  final Reader read;

  NftListViewProvider(this.read, [bool isGrid = true]) : super(isGrid);

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
  (ref) => NftListViewProvider(ref.read),
);
