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
      uid: '',
    );
  }

  String get ipAddressLabel {
    return "$ipAddress:$port";
  }
}
