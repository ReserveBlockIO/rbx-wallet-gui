import 'package:freezed_annotation/freezed_annotation.dart';

part 'beacon.freezed.dart';
part 'beacon.g.dart';

@freezed
class Beacon with _$Beacon {
  const Beacon._();

  factory Beacon({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "IPAddress") required String ipAddress,
    @JsonKey(name: "Port") required int port,
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "BeaconUID") required String uid,
    @JsonKey(name: "SelfBeacon") required bool selfBeacon,
    @JsonKey(name: "SelfBeaconActive") required bool selfBeaconActive,
    @JsonKey(name: "IsPrivateBeacon") required bool isBeaconPrivate,
    @JsonKey(name: "AutoDeleteAfterDownload") required bool autoDeleteAfterDownload,
    @JsonKey(name: "FileCachePeriodDays") required int fileCachePeriodDays,
  }) = _Beacon;

  factory Beacon.fromJson(Map<String, dynamic> json) => _$BeaconFromJson(json);

  factory Beacon.empty() {
    return Beacon(
      id: 0,
      ipAddress: '',
      port: 0,
      name: '',
      selfBeacon: false,
      selfBeaconActive: false,
      isBeaconPrivate: false,
      fileCachePeriodDays: 0,
      autoDeleteAfterDownload: false,
      uid: '',
    );
  }

  String get ipAddressLabel {
    return "$ipAddress:$port";
  }
}
