import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'evolve_phase.freezed.dart';
part 'evolve_phase.g.dart';

@freezed
class EvolvePhase with _$EvolvePhase {
  const EvolvePhase._();

  const factory EvolvePhase({
    @Default("") String name,
    DateTime? dateTime,
    // @Default("") String expectedValue,
    @Default("") String description,
  }) = _EvolvePhase;

  factory EvolvePhase.fromJson(Map<String, dynamic> json) =>
      _$EvolvePhaseFromJson(json);

  String get dateLabel {
    if (dateTime == null) return "";
    return DateFormat.yMd().format(dateTime!);
  }

  String get timeLabel {
    if (dateTime == null) return "";
    return DateFormat.Hms().format(dateTime!);
  }

  String? get dateTimeForCompiler {
    return dateTime != null ? dateTime!.toIso8601String() : null;
  }
}
