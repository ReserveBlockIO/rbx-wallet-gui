import 'package:freezed_annotation/freezed_annotation.dart';

part 'mother_child.freezed.dart';
part 'mother_child.g.dart';

@freezed
abstract class MotherChild with _$MotherChild {
  const MotherChild._();

  factory MotherChild({
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "IPAddress") required String ipAddress,
    @JsonKey(name: "PeerCount") required int peerCount,
    @JsonKey(name: "Balance") required double balance,
    @JsonKey(name: "BlockHeight") required int blockHeight,
    @JsonKey(name: "ValidatorName") required String validatorName,
    @JsonKey(name: "IsValidating") required bool isValidating,
    @JsonKey(name: "ActiveWithMother") required bool activeWithMother,
    @JsonKey(name: "ActiveWithValidating") required bool activeWithValidating,
    @JsonKey(name: "ConnectTime") required DateTime connectTime,
    @JsonKey(name: "LastDataSentTime") required DateTime lastDataSentTime,
    @JsonKey(name: "LastTaskSent") required DateTime lastTaskSent,
  }) = _MotherChild;

  factory MotherChild.fromJson(Map<String, dynamic> json) => _$MotherChildFromJson(json);
}
