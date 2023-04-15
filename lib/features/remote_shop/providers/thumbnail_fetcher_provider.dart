import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/features/remote_shop/utils.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:collection/collection.dart';

class QueueEntry {
  final String scId;
  final bool success;

  const QueueEntry({required this.scId, required this.success});
}

class ThumbnailFetcherProvider extends StateNotifier<List<QueueEntry>> {
  ThumbnailFetcherProvider() : super([]) {
    processQueue();
  }

  addToQueue(String scId) async {
    final inQueue = state.firstWhereOrNull((e) => e.scId == scId) != null;
    if (inQueue) {
      return;
    }

    print("Adding to queue ($scId)");

    final exists = await _checkIfExists(scId);

    final entry = QueueEntry(scId: scId, success: exists);
    state = [...state, entry];
  }

  processQueue() async {
    print("Processing queue....");

    final processableEntries = state.where((e) => e.success == false).toList();

    for (final item in processableEntries.asMap().entries) {
      final index = item.key;
      final entry = item.value;

      await getNftAssets(service: RemoteShopService(), scId: entry.scId);
      await Future.delayed(Duration(milliseconds: 500));
      final exists = await _checkIfExists(entry.scId);

      if (exists) {
        state = [...state]
          ..removeAt(index)
          ..insert(
            index,
            QueueEntry(scId: entry.scId, success: true),
          );
      }
      await Future.delayed(Duration(milliseconds: 500));
    }

    await Future.delayed(Duration(seconds: 5));

    processQueue();
  }

  Future<bool> _checkIfExists(String scId) async {
    String thumbsPath = await assetsPath();
    thumbsPath = Platform.isMacOS ? "$thumbsPath/${scId.replaceAll(':', '')}/thumbs" : "$thumbsPath\\${scId.replaceAll(':', '')}\\thumbs";

    return Directory(thumbsPath).existsSync();

    // TODO check for file bytes etc.
  }

  bool thumbnailReady(String scId) {
    final entry = state.firstWhereOrNull((e) => e.scId == scId);

    if (entry == null) {
      return false;
    }

    return entry.success;
  }

  // print("Checking if exists...");
  // if (await File(widget.path).exists()) {
  //   final bytes = await File(widget.path).length();
  //   if (bytes > 100) {
  //     print("Good");

  //     return;
  //   }
  // }
}

final thumbnailFetcherProvider = StateNotifierProvider<ThumbnailFetcherProvider, List<QueueEntry>>(
  (ref) => ThumbnailFetcherProvider(),
);
