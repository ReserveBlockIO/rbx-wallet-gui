import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/features/remote_shop/utils.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:collection/collection.dart';

class QueueEntry {
  final String scId;
  final List<String> filenames;
  final bool success;
  final bool attempted;

  const QueueEntry({
    required this.scId,
    required this.success,
    required this.filenames,
    required this.attempted,
  });
}

class ThumbnailFetcherProvider extends StateNotifier<List<QueueEntry>> {
  ThumbnailFetcherProvider() : super([]) {
    processQueue();
  }

  addToQueue(String scId, List<String> filenames) async {
    final inQueue = state.firstWhereOrNull((e) => e.scId == scId) != null;
    if (inQueue) {
      return;
    }

    print("Adding to queue ($scId)");

    final exists = await _checkIfExists(scId, filenames);

    final entry = QueueEntry(
      scId: scId,
      success: exists,
      filenames: filenames,
      attempted: false,
    );
    state = [...state, entry];
  }

  processQueue() async {
    print("Processing queue....");

    final processableEntries = state.where((e) => e.success == false).toList();

    for (final item in processableEntries.asMap().entries) {
      final index = item.key;
      final entry = item.value;

      if (!entry.attempted) {
        await Future.delayed(Duration(milliseconds: 500));
        await getNftAssets(service: RemoteShopService(), scId: entry.scId);
        await Future.delayed(Duration(milliseconds: 500));
      }

      final exists = await _checkIfExists(entry.scId, entry.filenames);

      state = [...state]
        ..removeAt(index)
        ..insert(
          index,
          QueueEntry(
            scId: entry.scId,
            filenames: entry.filenames,
            success: exists,
            attempted: true,
          ),
        );

      await Future.delayed(Duration(milliseconds: 500));
    }

    await Future.delayed(Duration(seconds: 5));

    processQueue();
  }

  Future<bool> _checkIfExists(String scId, List<String> filenames) async {
    String thumbsPath = await assetsPath();
    thumbsPath = Platform.isMacOS ? "$thumbsPath/${scId.replaceAll(':', '')}/thumbs" : "$thumbsPath\\${scId.replaceAll(':', '')}\\thumbs";

    if (!Directory(thumbsPath).existsSync()) {
      return false;
    }

    bool ready = true;
    for (final filename in filenames) {
      final p = "$thumbsPath/$filename";
      if (!File(p).existsSync()) {
        ready = false;
      } else {
        if (File(p).lengthSync() < 1) {
          ready = false;
        }
      }
    }

    return ready;
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
