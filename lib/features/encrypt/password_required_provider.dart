import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordRequiredProvider extends StateNotifier<bool> {
  PasswordRequiredProvider() : super(false);

  void set(bool value) {
    state = value;
  }
}

final passwordRequiredProvider = StateNotifierProvider<PasswordRequiredProvider, bool>((ref) {
  return PasswordRequiredProvider();
});
