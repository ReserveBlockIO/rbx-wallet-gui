import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_balances_expanded_provider.g.dart';

@Riverpod(keepAlive: true)
class GlobalBalancesExpanded extends _$GlobalBalancesExpanded {
  @override
  bool build() {
    return true;
  }

  void expand() {
    state = true;
  }

  void detract() {
    state = false;
  }
}
