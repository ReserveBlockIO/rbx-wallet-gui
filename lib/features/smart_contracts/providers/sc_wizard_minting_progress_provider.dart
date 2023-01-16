import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScWizardMintingProgress {
  final double percent;
  final String label;

  const ScWizardMintingProgress({this.percent = 0, this.label = "Initializing"});

  ScWizardMintingProgress copyWith({double? percent, String? label}) {
    return ScWizardMintingProgress(
      percent: percent ?? this.percent,
      label: label ?? this.label,
    );
  }
}

class ScWizardMintingProgressProvider extends StateNotifier<ScWizardMintingProgress> {
  ScWizardMintingProgressProvider([ScWizardMintingProgress initial = const ScWizardMintingProgress()]) : super(initial);

  setLabel(String label) {
    state = state.copyWith(label: label);
  }

  setPercent(double percent) {
    state = state.copyWith(percent: percent);
  }
}

final scWizardMintingProgress = StateNotifierProvider<ScWizardMintingProgressProvider, ScWizardMintingProgress>((ref) {
  return ScWizardMintingProgressProvider();
});
