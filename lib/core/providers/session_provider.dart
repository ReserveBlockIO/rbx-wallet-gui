import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:process/process.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/providers/ready_provider.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/status_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/nft/providers/minted_nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/features/node/providers/node_info_provider.dart';
import 'package:rbx_wallet/features/node/providers/node_list_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/draft_smart_contracts_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/my_smart_contracts_provider.dart';
import 'package:rbx_wallet/features/transactions/providers/transaction_list_provider.dart';
import 'package:rbx_wallet/features/validator/providers/current_validator_provider.dart';
import 'package:rbx_wallet/features/validator/providers/validator_list_provider.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:collection/collection.dart';

import 'package:intl/intl.dart';
import 'package:process_run/shell.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/validation.dart';

class SessionModel {
  final Wallet? currentWallet;
  final DateTime? startTime;
  // final bool ready;
  final bool filteringTransactions;
  final bool cliStarted;
  final int? remoteBlockHeight;
  final bool blocksAreSyncing;
  final bool blocksAreResyncing;
  final double? totalBalance;
  final String? cliVersion;
  final bool logWindowExpanded;
  final bool isMintingOrCompiling;
  final String timezoneName;

  const SessionModel({
    this.currentWallet,
    this.startTime,
    // this.ready = false,
    this.cliStarted = false,
    this.filteringTransactions = false,
    this.remoteBlockHeight,
    this.blocksAreSyncing = false,
    this.blocksAreResyncing = false,
    this.totalBalance,
    this.cliVersion,
    this.logWindowExpanded = false,
    this.isMintingOrCompiling = false,
    this.timezoneName = "America/Los_Angeles",
  });

  SessionModel copyWith({
    Wallet? currentWallet,
    DateTime? startTime,
    // bool? ready,
    bool? filteringTransactions,
    bool? cliStarted,
    int? remoteBlockHeight,
    bool? blocksAreSyncing,
    bool? blocksAreResyncing,
    double? totalBalance,
    String? cliVersion,
    bool? logWindowExpanded,
    bool? isMintingOrCompiling,
    String? timezoneName,
  }) {
    return SessionModel(
      startTime: startTime ?? this.startTime,
      currentWallet: currentWallet ?? this.currentWallet,
      // ready: ready ?? this.ready,
      filteringTransactions: filteringTransactions ?? this.filteringTransactions,
      cliStarted: cliStarted ?? this.cliStarted,
      remoteBlockHeight: remoteBlockHeight ?? this.remoteBlockHeight,
      blocksAreSyncing: blocksAreSyncing ?? this.blocksAreSyncing,
      blocksAreResyncing: blocksAreResyncing ?? this.blocksAreResyncing,
      totalBalance: totalBalance ?? this.totalBalance,
      cliVersion: cliVersion ?? this.cliVersion,
      logWindowExpanded: logWindowExpanded ?? this.logWindowExpanded,
      isMintingOrCompiling: isMintingOrCompiling ?? this.isMintingOrCompiling,
      timezoneName: timezoneName ?? this.timezoneName,
    );
  }

  String get startTimeFormatted {
    if (startTime == null) {
      return "-";
    }
    return DateFormat('MM/dd – kk:mm').format(startTime!);
  }
}

class SessionProvider extends StateNotifier<SessionModel> {
  final Reader read;

  static const _initial = SessionModel();

  SessionProvider(this.read, [SessionModel sessionModel = _initial]) : super(sessionModel) {
    init();
  }

  Future<void> init() async {
    print("init");
    read(logProvider.notifier).append(LogEntry(message: "Welcome to RBXWallet version $APP_VERSION"));

    bool cliStarted = state.cliStarted;
    if (!cliStarted) {
      read(logProvider.notifier).append(LogEntry(message: "Starting RBXCore..."));
      cliStarted = await _startCli();
    } else {
      read(logProvider.notifier).append(LogEntry(message: "RBXCore already running."));
    }

    if (!cliStarted) {
      print("CLI Could not start");
      return;
    }

    final now = DateTime.now();

    read(readyProvider.notifier).setReady(true);

    final timezoneName = DateTime.now().timeZoneName.toString();

    state = state.copyWith(
      // ready: true,
      startTime: now,
      cliStarted: cliStarted,
      timezoneName: timezoneName,
    );

    // mainLoop();
    await load();
    smartContractLoop();

    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      read(walletInfoProvider.notifier).fetch();
      _onboardWallet();
    });
  }

  // Future<void> mainLoop() async {
  //   print('main loop...');
  //   await load();

  //   await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
  //   mainLoop();
  // }

  Future<void> load() async {
    await _loadWallets();
    await loadValidators();
    // await loadMasterNodes();
    // await loadPeerInfo();
    await loadTransactions();
  }

  Future<void> smartContractLoop() async {
    if (state.currentWallet != null) {
      read(mySmartContractsProvider.notifier).load();
      read(nftListProvider.notifier).load();
      read(mintedNftListProvider.notifier).load();
      read(draftsSmartContractProvider.notifier).load();
    }

    await Future.delayed(const Duration(seconds: 45));
    smartContractLoop();
  }

  Future<void> restartCli() async {
    read(logProvider.notifier).clear();
    state = state = _initial;
    read(logProvider.notifier).append(LogEntry(message: "Shutting down CLI..."));
    await BridgeService().killCli();
    read(logProvider.notifier).append(LogEntry(message: "CLI terminated."));

    await Future.delayed(const Duration(milliseconds: 300));

    init();
  }

  // Future<void> _checkBlockSyncStatus() async {
  //   await read(genesisBlockProvider.notifier).load();
  //   if (read(genesisBlockProvider) == null) {
  //     await Future.delayed(Duration(milliseconds: 300));
  //     _checkBlockSyncStatus();
  //     return;
  //   }

  //   final _remoteBlockHeight = read(genesisBlockProvider)!.height;

  //   final _blocksAreSyncing = await BridgeService().blocksAreSyncing();

  //   state = state.copyWith(
  //     remoteBlockHeight: _remoteBlockHeight,
  //     blocksAreSyncing: _blocksAreSyncing,
  //   );
  // }

  Future<void> _loadWallets() async {
    final List<Wallet> wallets = [];

    final response = await BridgeService().wallets();

    Map<String, dynamic>? names = singleton<Storage>().getMap(Storage.RENAMED_WALLETS_KEY);

    names ??= {};

    List<dynamic>? deleted = singleton<Storage>().getList(Storage.DELETED_WALLETS_KEY);

    deleted ??= [];

    if (response.isNotEmpty && response != "Command not recognized." && response != "No Accounts") {
      final items = jsonDecode(response);
      for (final item in items) {
        if (deleted.contains(item['Address'])) {
          continue;
        }

        final Map<String, dynamic> _item = {
          ...item,
          'friendlyName': names.containsKey(item['Address']) ? names[item['Address']] : null,
        };
        wallets.add(Wallet.fromJson(_item));
        print(_item);
      }
    }

    read(walletListProvider.notifier).set(wallets);

    if (wallets.isNotEmpty) {
      final totalBalance = wallets.map((e) => e.balance).toList().sum;

      final currentWalletAddress = singleton<Storage>().getString(Storage.CURRENT_WALLET_ADDRESS_KEY);

      if (currentWalletAddress != null) {
        final currentWallet = wallets.firstWhereOrNull((element) => element.address == currentWalletAddress);

        if (currentWallet != null) {
          state = state.copyWith(currentWallet: currentWallet, totalBalance: totalBalance);
          read(currentValidatorProvider.notifier).set(currentWallet);
        }
      } else {
        state = state.copyWith(currentWallet: wallets.first, totalBalance: totalBalance);
        read(currentValidatorProvider.notifier).set(wallets.first);
      }
    }
  }

  Future<void> loadValidators() async {
    if (state.currentWallet == null) {
      return;
    }
    final response = await BridgeService().validators();
    if (response.isEmpty) {
      return;
    }
    if (response == "Command not recognized.") {
      return;
    }

    if (response == "No Accounts") {
      return;
    }

    final items = jsonDecode(response);
    final List<Wallet> wallets = [];
    for (final item in items) {
      wallets.add(Wallet.fromJson(item));
    }

    read(validatorListProvider.notifier).set(wallets);
  }

  Future<void> loadMasterNodes() async {
    await read(nodeListProvider.notifier).load();
  }

  Future<void> loadPeerInfo() async {
    await read(nodeInfoProvider.notifier).load();
  }

  Future<void> loadTransactions() async {
    if (state.currentWallet == null) {
      return;
    }

    await read(transactionListProvider.notifier).load();
  }

  void setCurrentWallet(Wallet wallet) {
    state = state.copyWith(currentWallet: wallet);
    singleton<Storage>().setString(Storage.CURRENT_WALLET_ADDRESS_KEY, wallet.address);

    final validators = read(validatorListProvider);

    final currentValidator = validators.firstWhereOrNull((element) => element.address == wallet.address);

    read(currentValidatorProvider.notifier).set(currentValidator);
  }

  void setFilteringTransactions(bool val) {
    state = state.copyWith(filteringTransactions: val);
  }

  Future<void> _onboardWallet() async {
    if (read(walletListProvider).isNotEmpty) {
      return;
    }

    if (read(statusProvider) == BridgeStatus.Offline) {
      return;
    }

    // if (!guardWalletIsNotResyncing(read, false)) return;

    final context = rootNavigatorKey.currentContext!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("No wallets found"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                label: "Import Private Key",
                onPressed: () {
                  if (!guardWalletIsNotResyncing(read)) return;

                  PromptModal.show(
                    title: "Import Wallet",
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
                    validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                    labelText: "Private Key",
                    onValidSubmission: (value) async {
                      await read(walletListProvider.notifier).import(value);
                      await load();
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              AppButton(
                label: "Create New Wallet",
                onPressed: () async {
                  await read(walletListProvider.notifier).create();
                  await load();
                  Navigator.of(context).pop();
                  // Navigator.of(context).pop(); // do we need this? lol
                },
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            )
          ],
        );
      },
    );
  }

  void setBlocksAreSyncing(bool value) {
    state = state.copyWith(blocksAreSyncing: value);
  }

  void setBlocksAreResyncing(bool value) {
    state = state.copyWith(blocksAreResyncing: value);
  }

  void setLogWindowExpanded(bool value) {
    state = state.copyWith(logWindowExpanded: value);
  }

  String getCliPath() {
    if (kIsWeb) {
      print("no cli path for web");
      return '';
    }
    if (Platform.isMacOS) {
      return '/Applications/RBXWallet.app/Contents/Resources/RBXCore/ReserveBlockCore';
    } else {
      final appPath = Directory.current.path;
      return "$appPath\\RbxCore\\ReserveBlockCore";
    }
  }

  Future<bool> _cliIsActive() async {
    try {
      await BridgeService().status();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _cliCheck([int attempt = 1, int maxAttempts = 100]) async {
    if (attempt > maxAttempts) {
      read(logProvider.notifier).append(LogEntry(message: "Attempted $maxAttempts. Something went wrong."));

      return false;
    }

    final isRunning = await _cliIsActive();
    if (isRunning) {
      read(logProvider.notifier).append(LogEntry(message: "ReserveBlockCore Started Successfully", variant: AppColorVariant.Success));

      final cliVersion = await BridgeService().getCliVersion();
      read(logProvider.notifier).append(LogEntry(message: "CLI Version: $cliVersion", variant: AppColorVariant.Info));
      state = state.copyWith(cliVersion: cliVersion);
      return true;
    }

    read(logProvider.notifier).append(LogEntry(message: "CLI not ready yet. Trying again in 5 seconds."));

    await Future.delayed(const Duration(seconds: 5));
    return _cliCheck(attempt + 1, maxAttempts);
  }

  Future<bool> _startCli() async {
    if (Env.launchCli) {
      if (await _cliIsActive()) {
        print("CLI is already running");
        read(logProvider.notifier).append(LogEntry(message: "CLI is already running!"));

        return true;
      }

      final cliPath = Env.cliPathOverride ?? getCliPath();
      List<String> options = ['enableapi'];
      if (Env.isTestNet) {
        options.add("testnet");
      }

      String cmd = '';

      if (Platform.isWindows) {
        ProcessManager pm = const LocalProcessManager();

        try {
          final appPath = Directory.current.path;
          cmd = Env.isTestNet ? "$appPath\\RbxCore\\RBXLauncherTestNet" : "$appPath\\RbxCore\\RBXLauncher";

          read(logProvider.notifier).append(LogEntry(message: "Launching $cmd in the background."));

          read(logProvider.notifier).append(LogEntry(message: "This update may take longer than usual. Expect a few minutes."));

          pm.run([cmd]).then((result) {
            read(logProvider.notifier).append(LogEntry(message: "Command ran successfully."));
          });

          await Future.delayed(const Duration(seconds: 3));
          return await _cliCheck();
        } catch (e) {
          print(e);
          read(logProvider.notifier).append(LogEntry(
            message: "Process Error",
            variant: AppColorVariant.Danger,
          ));

          read(logProvider.notifier).append(LogEntry(
            message: "$e",
            variant: AppColorVariant.Danger,
          ));
          return false;
        }
      } else {
        var stdOutController = ShellLinesController();
        final shell = Shell(throwOnError: false, stdout: Env.hideCliOutput ? stdOutController.sink : null);
        cmd = '"$cliPath" ${options.join(' ')}';

        print("CMD: $cmd");

        read(logProvider.notifier).append(LogEntry(message: "Launching $cmd in the background."));

        try {
          shell.run(cmd);
          await Future.delayed(const Duration(seconds: 3));
          return await _cliCheck();
        } catch (e) {
          read(logProvider.notifier).append(LogEntry(message: "Process Error.", variant: AppColorVariant.Danger));
          read(logProvider.notifier).append(LogEntry(message: "$e", variant: AppColorVariant.Danger));

          return false;
        }
      }
    }
    return true;
  }

  void setIsMintingOrCompiling(bool value) {
    state = state.copyWith(isMintingOrCompiling: value);
  }
}

final sessionProvider = StateNotifierProvider<SessionProvider, SessionModel>(
  (ref) => SessionProvider(ref.read),
);
