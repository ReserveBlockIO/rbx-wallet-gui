// ignore_for_file: constant_identifier_names, library_prefixes

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:rbx_wallet/generated/assets.gen.dart';

enum _Environment {
  Develop,
  Release,
}
const _env = _Environment.Release;

class Env {
  static init() async {
    String? envPath;
    switch (_env) {
      case _Environment.Develop:
        envPath = Assets.env.devEnv;
        break;
      case _Environment.Release:
        envPath = Assets.env.releaseEnv;

        break;
    }

    await DotEnv.dotenv.load(fileName: envPath);
  }

  static String get envName {
    return DotEnv.dotenv.env['ENVIRONMENT_NAME'] ?? 'unset';
  }

  static String get storagePrefix {
    return DotEnv.dotenv.env['STORAGE_PREFIX'] ?? 'unset';
  }

  static String get apiBaseUrl {
    return DotEnv.dotenv.env['API_BASE_URL'] ?? 'https://domain.com/api';
  }

  static bool get launchCli {
    return DotEnv.dotenv.env['LAUNCH_CLI'] == "true";
  }

  static bool get allowValidating {
    return DotEnv.dotenv.env['ALLOW_VALIDATING'] == "true";
  }

  static String? get cliPathOverride {
    return DotEnv.dotenv.env['CLI_PATH_OVERRIDE'];
  }
}
