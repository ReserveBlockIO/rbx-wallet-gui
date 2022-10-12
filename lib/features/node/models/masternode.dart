import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'masternode.freezed.dart';
part 'masternode.g.dart';

@freezed
class Masternode with _$Masternode {
  const Masternode._();

  factory Masternode({
    required String address,
    @JsonKey(name: 'unique_name') required String uniqueName,
    @JsonKey(name: 'connect_date') required DateTime connectDate,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'block_count') required int blockCount,
    // required dynamic location,
  }) = _Masternode;

  factory Masternode.fromJson(Map<String, dynamic> json) => _$MasternodeFromJson(json);

  String get dateLabel {
    return DateFormat.yMd().format(connectDate);
  }

  String get timeLabel {
    return DateFormat.Hms().format(connectDate);
  }

  String get dateTimeLabel {
    return "$dateLabel $timeLabel";
  }
}
