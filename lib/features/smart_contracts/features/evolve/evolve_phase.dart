import 'package:freezed_annotation/freezed_annotation.dart';

part 'evolve_phase.freezed.dart';
part 'evolve_phase.g.dart';

@freezed
class EvolvePhase with _$EvolvePhase {
  const EvolvePhase._();

  const factory EvolvePhase({
    @Default("") String name,
    DateTime? dateTime,
    @Default("") String expectedValue,
    @Default("") String description,
  }) = _EvolvePhase;

  factory EvolvePhase.fromJson(Map<String, dynamic> json) =>
      _$EvolvePhaseFromJson(json);
}
