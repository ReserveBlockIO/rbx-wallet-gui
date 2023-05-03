// ignore_for_file: constant_identifier_names, library_prefixes

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:rbx_wallet/generated/assets.gen.dart';

enum _Environment {
  Release,
  ReleaseTestNet,
  Dev,
  MacDev,
  WinDev,
  MacTestNet,
  WinTestNet,
  Web,
  WebTestNet,
  BlockExplorerTestNet,
  LocalTestNet,
  WebLocalEnv,
}

const _env = _Environment.LocalTestNet;

class Env {
  static init() async {
    String? envPath;
    switch (_env) {
      case _Environment.Dev:
        envPath = Assets.env.devEnv;
        break;
      case _Environment.MacDev:
        envPath = Assets.env.macDevEnv;
        break;
      case _Environment.WinDev:
        envPath = Assets.env.devWinEnv;
        break;
      case _Environment.MacTestNet:
        envPath = Assets.env.macTestnetEnv;
        break;
      case _Environment.WinTestNet:
        envPath = Assets.env.winTestnetEnv;
        break;
      case _Environment.BlockExplorerTestNet:
        envPath = Assets.env.blockExplorerTestNetEnv;
        break;
      case _Environment.Release:
        envPath = Assets.env.releaseEnv;
        break;
      case _Environment.ReleaseTestNet:
        envPath = Assets.env.releaseTestnet;
        break;
      case _Environment.Web:
        envPath = Assets.env.webEnv;
        break;
      case _Environment.WebTestNet:
        envPath = Assets.env.webDevEnv;
        break;
      case _Environment.WebLocalEnv:
        envPath = Assets.env.webLocalEnv;
        break;
      case _Environment.LocalTestNet:
        envPath = Assets.env.localTestnetEnv;
        break;
    }

    await DotEnv.dotenv.load(fileName: envPath);
  }

  static String get baseExplorerUrl {
    switch (_env) {
      case _Environment.MacTestNet:
      case _Environment.WinTestNet:
      case _Environment.ReleaseTestNet:
      case _Environment.BlockExplorerTestNet:
      case _Environment.WebTestNet:
      case _Environment.WebLocalEnv:
        return 'https://testnet.rbx.network/';
      default:
        return 'https://rbx.network/';
    }
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

  static String get explorerApiBaseUrl {
    return DotEnv.dotenv.env['EXPLORER_API_BASE_URL'] ?? 'https://rbx-explorer-service.herokuapp.com/api';
  }

  static String get explorerWebsiteBaseUrl {
    return DotEnv.dotenv.env['EXPLORER_WEBSITE_BASE_URL'] ?? 'https://rbx.network';
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

  static bool get isTestNet {
    return DotEnv.dotenv.env['IS_TEST_NET'] == "true";
  }

  static bool get promptForUpdates {
    return _env == _Environment.Release;
  }

  static String get validatorPort {
    return DotEnv.dotenv.env['VALIDATOR_PORT'] ?? '3338';
  }

  static String get portCheckerUrl {
    return DotEnv.dotenv.env['PORT_CHECKER_URL'] ?? "https://us-central1-portpingr.cloudfunctions.net/pinger";
  }

  static bool get hideCliOutput {
    return DotEnv.dotenv.env['HIDE_CLI_OUTPUT'] == "true";
  }

  static bool get isWeb {
    return DotEnv.dotenv.env['IS_WEB'] == "true";
  }

  static bool get useWebMedia {
    return DotEnv.dotenv.env['USE_WEB_MEDIA'] == "true";
  }

  static String get appBaseUrl {
    return DotEnv.dotenv.env['APP_BASE_URL'] ?? 'http://localhost:42069';
  }

  static String get shopBaseUrl {
    return DotEnv.dotenv.env['SHOP_BASE_URL'] ?? "https://wallet.rbx.network";
  }

  static String get shopApiUrl {
    return DotEnv.dotenv.env['SHOP_API_URL'] ?? "https://data.rbx.network/api";
  }
}
