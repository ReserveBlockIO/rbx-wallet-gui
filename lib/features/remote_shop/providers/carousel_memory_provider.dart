import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarouselMemoryProvider extends StateNotifier<int> {
  CarouselMemoryProvider() : super(0);

  update(int index) {
    state = index;
  }
}

final carouselMemoryProvider = StateNotifierProvider.family<CarouselMemoryProvider, int, String>(
  (ref, family) => CarouselMemoryProvider(),
);
