import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:intl/intl.dart';
import 'package:process/process.dart';
import 'package:process_run/shell.dart';
import 'package:rbx_wallet/core/api_token_manager.dart';
import 'package:rbx_wallet/core/utils.dart';
import 'package:rbx_wallet/features/remote_info/components/snapshot_downloader.dart';
import 'package:rbx_wallet/features/remote_info/models/remote_info.dart';
import 'package:rbx_wallet/features/remote_info/services/remote_info_service.dart';
import 'package:rbx_wallet/features/startup/startup_data.dart';
import 'package:rbx_wallet/features/startup/startup_data_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../app.dart';
import '../../features/beacon/providers/beacon_list_provider.dart';
import '../../features/bridge/models/log_entry.dart';
import '../../features/bridge/providers/log_provider.dart';
import '../../features/bridge/providers/status_provider.dart';
import '../../features/bridge/providers/wallet_info_provider.dart';
import '../../features/bridge/services/bridge_service.dart';
import '../../features/config/models/config.dart';
import '../../features/config/providers/config_provider.dart';
import '../../features/encrypt/providers/password_required_provider.dart';
import '../../features/encrypt/providers/startup_password_required_provider.dart';
import '../../features/encrypt/providers/wallet_is_encrypted_provider.dart';
import '../../features/nft/providers/minted_nft_list_provider.dart';
import '../../features/nft/providers/nft_list_provider.dart';
import '../../features/node/providers/node_info_provider.dart';
import '../../features/node/providers/node_list_provider.dart';
import '../../features/smart_contracts/providers/draft_smart_contracts_provider.dart';
import '../../features/smart_contracts/providers/my_smart_contracts_provider.dart';
import '../../features/transactions/providers/transaction_list_provider.dart';
import '../../features/validator/providers/current_validator_provider.dart';
import '../../features/validator/providers/validator_list_provider.dart';
import '../../features/voting/providers/my_vote_list_provider.dart';
import '../../features/voting/providers/topic_list_provider.dart';
import '../../features/wallet/models/wallet.dart';
import '../../features/wallet/providers/wallet_list_provider.dart';
import '../../utils/files.dart';
import '../../utils/guards.dart';
import '../../utils/validation.dart';
import '../app_constants.dart';
import '../components/buttons.dart';
import '../dialogs.dart';
import '../env.dart';
import '../singletons.dart';
import '../storage.dart';
import '../theme/app_theme.dart';
import 'ready_provider.dart';

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
  final RemoteInfo? remoteInfo;

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
    this.remoteInfo,
  });

  SessionModel copyWith(
      {Wallet? currentWallet,
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
      RemoteInfo? remoteInfo}) {
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
      remoteInfo: remoteInfo ?? this.remoteInfo,
    );
  }

  String get startTimeFormatted {
    if (startTime == null) {
      return "-";
    }
    return DateFormat('MM/dd – kk:mm').format(startTime!);
  }

  bool get updateAvailable {
    if (remoteInfo == null) {
      return false;
    }

    return remoteInfo!.gui.updateAvailable;
  }
}

class SessionProvider extends StateNotifier<SessionModel> {
  final Reader read;

  static const _initial = SessionModel();

  SessionProvider(this.read, [SessionModel sessionModel = _initial]) : super(sessionModel) {
    init(true);
  }

  Future<void> init(bool invokeLoop) async {
    final token = kDebugMode ? DEV_API_TOKEN : generateRandomString(32).toLowerCase();

    read(logProvider.notifier).append(LogEntry(message: "Welcome to RBXWallet version $APP_VERSION"));

    bool cliStarted = state.cliStarted;
    if (!cliStarted) {
      read(logProvider.notifier).append(LogEntry(message: "Starting RBXCore..."));
      cliStarted = await _startCli(token);
    } else {
      read(logProvider.notifier).append(LogEntry(message: "RBXCore already running."));
    }

    if (!cliStarted) {
      print("CLI Could not start");
      return;
    }
    read(readyProvider.notifier).setReady(true);

    final authenticated = await authenticate();

    if (authenticated) {
      finishSetup(invokeLoop);
    }
  }

  Future<void> finishSetup(bool invokeLoop) async {
    final now = DateTime.now();

    final timezoneName = DateTime.now().timeZoneName.toString();

    state = state.copyWith(
      // ready: true,
      startTime: now,
      cliStarted: true,
      timezoneName: timezoneName,
    );

    // mainLoop();
    mainLoop(invokeLoop);
    smartContractLoop(invokeLoop);
    read(beaconListProvider.notifier).refresh();

    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      read(walletInfoProvider.notifier).infoLoop(invokeLoop);
      if (!kIsWeb) {
        // if (!read(passwordRequiredProvider)) {
        //   _onboardWallet();
        // }

        checkRemoteInfo();
      }
    });
  }

  Future<void> updateGui() async {
    final remoteInfo = state.remoteInfo;
    if (remoteInfo == null) {
      return;
    }

    final updateGui = await ConfirmDialog.show(
      title: "GUI Update Available",
      body: "A GUI update is available. Download now?",
      confirmText: "Update",
      cancelText: "No",
    );

    if (updateGui != true) {
      return;
    }

    final confirmUpdate = await ConfirmDialog.show(
      title: "GUI Update",
      body:
          "The RBX GUI download will be launched in your browser. Once launched, the CLI will be shutdown and your wallet will be closed to ensure a safe update.",
      confirmText: "Update",
      cancelText: "Cancel",
    );

    if (confirmUpdate != true) {
      return;
    }

    if (updateGui == true) {
      final url = remoteInfo.gui.url;
      await launchUrlString(url);
    }

    await BridgeService().killCli();
    await Future.delayed(const Duration(milliseconds: 3000));

    FlutterWindowClose.closeWindow();
  }

  Future<void> checkRemoteInfo() async {
    final remoteInfo = await RemoteInfoService.fetchInfo();
    state = state.copyWith(remoteInfo: remoteInfo);

    await Future.delayed(const Duration(seconds: 3));

    if (remoteInfo != null) {
      if (remoteInfo.gui.updateAvailable) {
        updateGui();
        return;
      }

      final snapshotHeight = remoteInfo.snapshot.height;
      final blockHeight = read(walletInfoProvider)?.blockHeight;

      if (blockHeight != null && blockHeight < snapshotHeight - 5000) {
        promptForSnapshotImport();
      }

      final cliUpdateAvailable = await BridgeService().updateCli(false);
      if (cliUpdateAvailable == true) {
        final confirmed = await ConfirmDialog.show(
          title: "CLI Update Available",
          body: "A CLI update is available. Download and install now?",
          confirmText: "Update",
          cancelText: "No",
        );
        if (confirmed == true) {
          final success = await BridgeService().updateCli(true);

          if (success == true) {
            final shouldRestart = await ConfirmDialog.show(
              title: "CLI Updated",
              body: "A restart of the CLI is required. Restart Now?",
              confirmText: "Restart",
              cancelText: "No",
            );
            if (shouldRestart == true) {
              await restartCli();
            }
          }
        }
      }
    }
  }

  Future<void> promptForSnapshotImport() async {
    // final context = rootNavigatorKey.currentContext!;

    final blockHeight = read(walletInfoProvider)!.blockHeight;
    final snapshotHeight = state.remoteInfo!.snapshot.height;

    final confirmed = await ConfirmDialog.show(
      title: "Import Snapshot?",
      body:
          "You are only at $blockHeight block height locally. The network has a snapshot at $snapshotHeight block height that will help you sync more quickly. \n\nWould you like to import it now?",
      confirmText: "Import",
      cancelText: "No",
    );

    if (confirmed == true) {
      // importSnapshot();
      bool? shouldContinue = true;
      if (read(walletListProvider).isNotEmpty) {
        shouldContinue = await ConfirmDialog.show(
          title: "Warning",
          body:
              "Be sure your private keys are backed up as this process will wipe your database folder.\n\nIf they are NOT backed up, click cancel now, back them up, and then restart your wallet to be prompted with this again.",
          confirmText: "I'm Backed Up",
          cancelText: "Cancel",
        );
      }

      if (shouldContinue == true) {
        importSnapshot();
      }
    }
  }

  Future<void> importSnapshot() async {
    if (state.remoteInfo?.snapshot.url == null) {
      Toast.error();
      return;
    }

    final url = state.remoteInfo!.snapshot.url;

    showDialog(
        context: rootNavigatorKey.currentContext!,
        builder: (context) {
          return SnapshotDownloader(
            downloadUrl: url,
            initFunction: init,
            configFunction: fetchConfig,
          );
        });
  }

  // Future<void> mainLoop() async {
  //   print('main loop...');
  //   await load();

  //   await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
  //   mainLoop();
  // }

  Future<bool> authenticate() async {
    // final isEncrypted = await BridgeService().checkIfEncrypted();
    // if (isEncrypted) {
    //   return true;
    // }

    final passwordNeeded = await BridgeService().startupPasswordRequired();

    if (passwordNeeded) {
      await Future.delayed(const Duration(milliseconds: 100));
      read(startupPasswordRequiredProvider.notifier).set(true);
      return false;
    }

    return true;
  }

  Future<void> mainLoop([inLoop = true]) async {
    await loadWallets();
    await loadValidators();
    // await loadMasterNodes();
    // await loadPeerInfo();
    await loadTransactions();

    loadTopics();

    if (inLoop) {
      await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
      mainLoop();
    }
  }

  void loadTopics() {
    for (var topicType in [
      TopicListType.Active,
      TopicListType.Inactive,
      TopicListType.VotedOn,
      TopicListType.NotVotedOn,
      TopicListType.All,
      TopicListType.Mine,
    ]) {
      read(topicListProvider(topicType).notifier).refresh();
    }

    read(myVoteListProvider.notifier).refresh();
  }

  Future<void> smartContractLoop([inLoop = true]) async {
    if (state.currentWallet != null) {
      read(mySmartContractsProvider.notifier).load();
      read(nftListProvider.notifier).reloadCurrentPage();
      read(mintedNftListProvider.notifier).reloadCurrentPage();
      read(draftsSmartContractProvider.notifier).load();
    }

    await Future.delayed(const Duration(seconds: 30));
    smartContractLoop();
  }

  Future<void> restartCli() async {
    read(logProvider.notifier).clear();
    state = state = _initial;
    read(logProvider.notifier).append(LogEntry(message: "Shutting down CLI..."));
    await BridgeService().killCli();
    read(logProvider.notifier).append(LogEntry(message: "CLI terminated."));

    await Future.delayed(const Duration(milliseconds: 5000));

    await init(false);
    await fetchConfig();

    read(beaconListProvider.notifier).refresh();
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

  Future<void> loadWallets() async {
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
        } else {
          state = state.copyWith(totalBalance: totalBalance);
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

    for (var type in [
      TransactionListType.All,
      TransactionListType.Success,
      TransactionListType.Failed,
      TransactionListType.Pending,
      TransactionListType.Mined,
    ]) {
      await read(transactionListProvider(type).notifier).load();
    }
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
    await Future.delayed(const Duration(seconds: 10));
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
                onPressed: () async {
                  if (!guardWalletIsNotResyncing(read)) return;

                  PromptModal.show(
                    title: "Import Wallet",
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
                    validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                    labelText: "Private Key",
                    onValidSubmission: (value) async {
                      await read(walletListProvider.notifier).import(value);
                      mainLoop(false);
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
                  mainLoop(false);
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

  Future<bool> _cliCheck([int attempt = 1, int maxAttempts = 500]) async {
    if (attempt > maxAttempts) {
      read(logProvider.notifier).append(LogEntry(message: "Attempted $maxAttempts. Something went wrong."));

      return false;
    }

    final isRunning = await _cliIsActive();
    if (isRunning) {
      read(logProvider.notifier).append(LogEntry(message: "ReserveBlockCore Started Successfully", variant: AppColorVariant.Success));
      await fetchConfig();
      final cliVersion = await BridgeService().getCliVersion();
      read(logProvider.notifier).append(LogEntry(message: "CLI Version: $cliVersion", variant: AppColorVariant.Info));
      state = state.copyWith(cliVersion: cliVersion);
      read(passwordRequiredProvider.notifier).check();
      read(walletIsEncryptedProvider.notifier).check();
      return true;
    }

    read(logProvider.notifier).append(LogEntry(message: "CLI loading..."));

    await Future.delayed(const Duration(seconds: 5));
    return _cliCheck(attempt + 1, maxAttempts);
  }

  Future<void> startupDataLoop() async {
    final data = await fetchStartupData();

    read(startupDataProvider.notifier).set(data);

    await Future.delayed(const Duration(seconds: 1));
    if (!state.cliStarted) {
      startupDataLoop();
    }
  }

  Future<bool> _startCli(String apiToken) async {
    if (Env.launchCli) {
      if (await _cliIsActive()) {
        await fetchConfig();
        read(logProvider.notifier).append(LogEntry(message: "CLI is already running!"));

        return true;
      }

      startupDataLoop();

      final cliPath = Env.cliPathOverride ?? getCliPath();
      List<String> options = ['enableapi', 'gui', 'apitoken=$apiToken'];

      if (Env.isTestNet) {
        options.add("testnet");
      }

      String cmd = '';

      if (Platform.isWindows) {
        ProcessManager pm = const LocalProcessManager();

        try {
          final appPath = Directory.current.path;
          cmd = Env.isTestNet ? "$appPath\\RbxCore\\RBXLauncherTestNet.exe" : "$appPath\\RbxCore\\RBXLauncher.exe";

          read(logProvider.notifier).append(LogEntry(message: "Launching CLI in the background."));

          read(logProvider.notifier).append(LogEntry(message: "This update may take longer than usual. Expect a few minutes."));

          pm.run([cmd, 'apitoken=$apiToken']).then((result) {
            read(logProvider.notifier).append(LogEntry(message: "Command ran successfully."));
          });
          singleton<ApiTokenManager>().set(apiToken);

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
        final shell = Shell(
          throwOnError: false,
          stdout: Env.hideCliOutput ? stdOutController.sink : null,
          workingDirectory: "/Applications/RBXWallet.app/Contents/MacOS/",
        );
        cmd = '"$cliPath" ${options.join(' ')}';

        read(logProvider.notifier).append(LogEntry(message: "Launching CLI in the background."));

        try {
          shell.run(cmd);
          singleton<ApiTokenManager>().set(apiToken);

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

  Future<StartupData?> fetchStartupData() async {
    final path = await startupProgressPath();

    if (!File(path).existsSync()) {
      return null;
    }

    final string = await File(path).readAsString();
    final Map<String, dynamic> data = jsonDecode(string);

    if (data.containsKey('NextBlock') && data.containsKey('CurrentPercent')) {
      return StartupData(data['NextBlock'].toString(), data['CurrentPercent'].toString());
    }

    return null;
  }

  Future<void> fetchConfig() async {
    read(logProvider.notifier).append(LogEntry(
      message: "Fetching Config...",
    ));
    final path = await configPath();

    try {
      final lines = await File(path).readAsLines();

      Map<String, dynamic> kwargs = {};
      for (final line in lines) {
        final kwarg = line.split("=");
        kwargs[kwarg[0].trim()] = kwarg[1].trim();
      }

      final config = Config.fromJson(kwargs);

      read(configProvider.notifier).setConfig(config);
      read(logProvider.notifier).append(LogEntry(
        message: "Config Loaded...",
      ));
    } catch (e) {
      print(e);
    }
  }
}

final sessionProvider = StateNotifierProvider<SessionProvider, SessionModel>(
  (ref) => SessionProvider(ref.read),
);
