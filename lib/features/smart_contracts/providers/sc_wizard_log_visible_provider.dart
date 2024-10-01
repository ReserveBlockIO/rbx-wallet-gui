import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sc_wizard_log_provider.dart';

class ScWizardLogVisibleProvider extends StateNotifier<bool> {
  final Ref ref;
  ScWizardLogVisibleProvider(this.ref) : super(false);

  void _set(bool value) {
    ref.read(scWizardLogProvider.notifier).clear();
    state = value;
  }

  void start() {
    _set(true);
  }

  void complete() {
    _set(false);
  }
}

final scWizardLogVisibleProvider = StateNotifierProvider<ScWizardLogVisibleProvider, bool>((ref) {
  return ScWizardLogVisibleProvider(ref);
});
