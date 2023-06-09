import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const LOG_HISTORY_LENGTH = 1000;

class ScWizardLogProvider extends StateNotifier<List<String>> {
  final Ref ref;
  final ScrollController scrollController = ScrollController();

  ScWizardLogProvider(this.ref, [List<String> model = const []]) : super(model);

  void append(String entry) async {
    // Future.delayed(Duration(milliseconds: 100)).then((_) async {
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      final items = [...state, entry];
      if (items.length > LOG_HISTORY_LENGTH) {
        state = items.getRange(items.length - LOG_HISTORY_LENGTH, items.length).toList();
      } else {
        state = items;
      }
    });
    if (scrollController.hasClients && scrollController.positions.isNotEmpty) {
      await Future.delayed(const Duration(milliseconds: 300));

      try {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent - 24,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      } catch (e) {
        print("");
      }
    }
    // });
  }

  void clear() {
    state = [];
  }
}

final scWizardLogProvider = StateNotifierProvider<ScWizardLogProvider, List<String>>((ref) {
  return ScWizardLogProvider(ref);
});
