import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/app_constants.dart';

part 'remote_info.freezed.dart';
part 'remote_info.g.dart';

@freezed
class RemoteInfoGui with _$RemoteInfoGui {
  const RemoteInfoGui._();

  factory RemoteInfoGui({
    required String version,
    required String tag,
    required String url,
    required String date,
  }) = _RemoteInfoGui;
  factory RemoteInfoGui.fromJson(Map<String, dynamic> json) => _$RemoteInfoGuiFromJson(json);

  int get versionMajor {
    final args = version.split('.');
    if (args.isEmpty) {
      return 3;
    }
    return int.tryParse(version.split('.').first) ?? 3;
  }

  int get versionMinor {
    final args = version.split('.');
    if (args.length < 2) {
      return 0;
    }
    return int.tryParse(args[1]) ?? 0;
  }

  int get versionPatch {
    final args = version.split('.');
    if (args.length < 3) {
      return 0;
    }
    return int.tryParse(args[2]) ?? 0;
  }

  bool get updateAvailable {
    final current = APP_V.split('.');
    final currentMajor = int.parse(current[0]);
    final currentMinor = int.parse(current[1]);
    final currentPatch = int.parse(current[2]);

    if (currentMajor < versionMajor) {
      return true;
    }
    if (currentMinor < versionMinor) {
      return true;
    }

    if (currentPatch < versionPatch) {
      return true;
    }

    return false;
  }
}

@freezed
class RemoteInfoCli with _$RemoteInfoCli {
  const RemoteInfoCli._();

  factory RemoteInfoCli({
    required String version,
    required String tag,
    required String url,
    required String date,
  }) = _RemoteInfoCli;
  factory RemoteInfoCli.fromJson(Map<String, dynamic> json) => _$RemoteInfoCliFromJson(json);
}

@freezed
class RemoteInfoSnapshot with _$RemoteInfoSnapshot {
  const RemoteInfoSnapshot._();

  factory RemoteInfoSnapshot({
    required int height,
    required String url,
    required String date,
  }) = _RemoteInfoSnapshot;
  factory RemoteInfoSnapshot.fromJson(Map<String, dynamic> json) => _$RemoteInfoSnapshotFromJson(json);
}

@freezed
class RemoteInfo with _$RemoteInfo {
  const RemoteInfo._();

  factory RemoteInfo({
    required RemoteInfoGui gui,
    required RemoteInfoCli cli,
    required RemoteInfoSnapshot snapshot,
  }) = _RemoteInfo;
  factory RemoteInfo.fromJson(Map<String, dynamic> json) => _$RemoteInfoFromJson(json);
}
