import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import '../../../asset/web_asset.dart';
import '../../../sc_property/models/sc_property.dart';

import '../../../asset/asset.dart';

part 'evolve_phase.freezed.dart';
part 'evolve_phase.g.dart';

@freezed
class EvolvePhase with _$EvolvePhase {
  const EvolvePhase._();

  @JsonSerializable(explicitToJson: true)
  const factory EvolvePhase({
    @Default("") String name,
    DateTime? dateTime,
    int? blockHeight,
    // @Default("") String expectedValue,
    @Default("") String description,
    @Default(0) int evolutionState,
    @Default(false) bool isCurrentState,
    Asset? asset,
    @JsonKey(ignore: true) WebAsset? webAsset,
    @Default([]) List<ScProperty> properties,
  }) = _EvolvePhase;

  factory EvolvePhase.fromJson(Map<String, dynamic> json) => _$EvolvePhaseFromJson(json);

  String get dateLabel {
    if (dateTime == null) return "";
    return DateFormat.yMd().format(dateTime!);
  }

  String get dateLabelLocalized {
    if (dateTime == null) return "";
    return DateFormat.yMd().format(dateTime!.toLocal());
  }

  String get timeLabel {
    if (dateTime == null) return "";
    return DateFormat.Hms().format(dateTime!);
  }

  String get timeLabelLocalized {
    if (dateTime == null) return "";
    return DateFormat('hh:mm a').format(dateTime!.toLocal());
  }

  String? dateTimeForCompiler(String timezoneName) {
    if (dateTime == null) {
      return null;
    }

    return dateTime!.toUtc().toIso8601String();
  }
}
