import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/singletons.dart';
import '../../../core/storage.dart';

class AdnrPendingProvider extends StateNotifier<List<String>> {
  AdnrPendingProvider() : super([]) {
    // final items = singleton<Storage>().getStringList(Storage.PENDING_ADNRS) ?? [];
    state = [];
  }

  addId(String id, String type, String adnr) {
    final value = "$id.$type.$adnr";

    List<String> removes = [];
    if (type == "burn") {
      removes = ["transfer", "create"];
    } else if (type == "transfer") {
      removes = ["burn", "create"];
    } else if (type == "create") {
      removes = ["burn", "transfer"];
    }

    final List<String> removeKeys = [];

    for (final r in removes) {
      removeKeys.add("$id.$r.$adnr");
      removeKeys.add("$id.$r.null");
    }

    final update = [...state, value]..removeWhere((element) => removeKeys.contains(element));

    singleton<Storage>().setStringList(Storage.PENDING_ADNRS, update);

    state = update;
  }
}

final adnrPendingProvider = StateNotifierProvider<AdnrPendingProvider, List<String>>(
  (_) => AdnrPendingProvider(),
);
