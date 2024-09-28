import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/dst_service.dart';
import '../models/collection.dart';

class CollectionListProvider extends StateNotifier<List<Collection>> {
  final Ref ref;

  CollectionListProvider(this.ref, [List<Collection> collections = const []]) : super(collections) {
    load();
  }

  Future<void> load() async {
    final data = await DstService().listCollections();
    state = data;
  }

  void refresh() {
    load();
  }
}

final collectionListProvider = StateNotifierProvider<CollectionListProvider, List<Collection>>(
  (ref) => CollectionListProvider(ref),
);
