import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/config/models/config.dart';
import 'package:rbx_wallet/features/config/providers/config_form_provider.dart';

class ConfigProvider extends StateNotifier<Config> {
  final Reader read;

  ConfigProvider(this.read, Config model) : super(model);

  setConfig(Config config) {
    state = config;
    read(configFormProvider.notifier).set(config);
  }
}

final configProvider = StateNotifierProvider<ConfigProvider, Config>((ref) {
  final model = Config(
    port: Env.isTestNet ? 13338 : 3338,
    apiPort: Env.isTestNet ? 17292 : 7292,
    testnet: Env.isTestNet,
  );

  return ConfigProvider(ref.read, model);
});
