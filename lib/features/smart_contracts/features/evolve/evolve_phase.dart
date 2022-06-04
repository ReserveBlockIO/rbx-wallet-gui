import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:timezone/standalone.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

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

  String? dateTimeForCompiler(String timezoneName) {
    if (dateTime == null) {
      return null;
    }

    final d = TZDateTime.from(dateTime!, getLocation(timezoneName)).toUtc();

    // final d = TZDateTime.local(
    //   dateTime!.year,
    //   dateTime!.month,
    //   dateTime!.day,
    //   dateTime!.hour,
    //   dateTime!.minute,
    //   dateTime!.second,
    // );

    print(d.toIso8601String());

    return d.toIso8601String();
  }
}
