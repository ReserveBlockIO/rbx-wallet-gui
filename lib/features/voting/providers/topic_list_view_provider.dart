import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopicListViewProvider extends StateNotifier<bool> {
  final Ref ref;

  TopicListViewProvider(this.ref, [bool isGrid = true]) : super(isGrid);

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

final topicListViewProvider = StateNotifierProvider<TopicListViewProvider, bool>(
  (ref) => TopicListViewProvider(ref),
);
