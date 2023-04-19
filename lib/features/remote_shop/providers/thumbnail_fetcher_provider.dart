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

  addToQueue(
    String scId,
    List<String> filenames, [
    bool forceRetry = false,
  ]) async {
    final inQueue = state.firstWhereOrNull((e) => e.scId == scId) != null;

    if (forceRetry) {
      final exists = await _checkIfExists(scId, filenames);
      if (inQueue) {
        final index = state.indexWhere((e) => e.scId == scId);
        final e = state[index];

        state = [...state]
          ..removeAt(index)
          ..insert(
            index,
            QueueEntry(
              scId: e.scId,
              filenames: e.filenames,
              success: exists,
              attempted: false,
            ),
          );
      } else {
        final entry = QueueEntry(
          scId: scId,
          success: exists,
          filenames: filenames,
          attempted: false,
        );
        state = [...state, entry];
      }
      return;
    }

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
    for (final item in state.asMap().entries) {
      final index = item.key;
      final entry = item.value;

      // if (entry.success) {
      //   return;
      // }

      bool exists = await _checkIfExists(entry.scId, entry.filenames);

      bool attempted = exists;

      if (!exists) {
        if (!entry.attempted) {
          await Future.delayed(Duration(milliseconds: 500));
          attempted = await getNftAssets(service: RemoteShopService(), scId: entry.scId);
          if (!attempted) {
            print("Error requesting files for (${entry.scId}). Will try again in next loop");
          }
          await Future.delayed(Duration(milliseconds: 500));
        }
      }

      exists = await _checkIfExists(entry.scId, entry.filenames);

      state = [...state]
        ..removeAt(index)
        ..insert(
          index,
          QueueEntry(
            scId: entry.scId,
            filenames: entry.filenames,
            success: exists,
            attempted: attempted,
          ),
        );

      await Future.delayed(Duration(milliseconds: 500));
    }

    await Future.delayed(Duration(seconds: 3));

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
      final updatedFileName = filename.replaceAll(".pdf", ".jpg");
      final p = "$thumbsPath/$updatedFileName";
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

  bool checkSingleFile(String p) {
    bool ready = true;
    if (!File(p).existsSync()) {
      ready = false;
    } else {
      if (File(p).lengthSync() < 1) {
        ready = false;
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
}

final thumbnailFetcherProvider = StateNotifierProvider<ThumbnailFetcherProvider, List<QueueEntry>>(
  (ref) => ThumbnailFetcherProvider(),
);
