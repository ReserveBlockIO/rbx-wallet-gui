import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:intl/intl.dart';
import 'package:process/process.dart';
import 'package:process_run/shell.dart';
import 'package:rbx_wallet/core/api_token_manager.dart';
import 'package:rbx_wallet/core/utils.dart';
import 'package:rbx_wallet/features/chat/providers/chat_notification_provider.dart';
import 'package:rbx_wallet/features/dst/providers/dec_shop_provider.dart';
import 'package:rbx_wallet/features/dst/providers/listed_nfts_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/remote_info/components/snapshot_downloader.dart';
import 'package:rbx_wallet/features/remote_info/models/remote_info.dart';
import 'package:rbx_wallet/features/remote_info/services/remote_info_service.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';
import 'package:rbx_wallet/features/remote_shop/providers/thumbnail_fetcher_provider.dart';
import 'package:rbx_wallet/features/reserve/providers/reserve_account_provider.dart';
import 'package:rbx_wallet/features/reserve/services/reserve_account_service.dart';
import 'package:rbx_wallet/features/startup/startup_data.dart';
import 'package:rbx_wallet/features/startup/startup_data_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../app.dart';
import '../../features/beacon/providers/beacon_list_provider.dart';
import '../../features/bridge/models/log_entry.dart';
import '../../features/bridge/providers/log_provider.dart';
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
import '../app_constants.dart';
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
  final String? windowsLauncherPath;

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
    this.windowsLauncherPath,
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
    RemoteInfo? remoteInfo,
    String? windowsLauncherPath,
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
      remoteInfo: remoteInfo ?? this.remoteInfo,
      windowsLauncherPath: windowsLauncherPath ?? this.windowsLauncherPath,
    );
  }

  String get startTimeFormatted {
    if (startTime == null) {
      return "-";
    }
    return DateFormat('MM/dd – HH:mm').format(startTime!);
  }

  bool get updateAvailable {
    if (remoteInfo == null) {
      return false;
    }

    return remoteInfo!.gui.updateAvailable;
  }
}

class SessionProvider extends StateNotifier<SessionModel> {
  final Ref ref;

  static const _initial = SessionModel();

  SessionProvider(this.ref, [SessionModel sessionModel = _initial]) : super(sessionModel) {
    init(true);
  }

  Future<void> init(bool inLoop) async {
    final token = kDebugMode ? DEV_API_TOKEN : generateRandomString(32).toLowerCase();

    ref.read(logProvider.notifier).append(LogEntry(message: "Welcome to RBXWallet version $APP_VERSION"));

    bool cliStarted = state.cliStarted;
    if (!cliStarted) {
      ref.read(logProvider.notifier).append(LogEntry(message: "Starting RBXCore..."));
      cliStarted = await _startCli(token);
    } else {
      ref.read(logProvider.notifier).append(LogEntry(message: "RBXCore already running."));
    }

    if (!cliStarted) {
      print("CLI Could not start");
      return;
    }
    ref.read(readyProvider.notifier).setReady(true);

    final authenticated = await authenticate();

    if (authenticated) {
      finishSetup(inLoop);
    }
  }

  Future<void> finishSetup(bool inLoop) async {
    final now = DateTime.now();

    final timezoneName = DateTime.now().timeZoneName.toString();

    state = state.copyWith(
      // ready: true,
      startTime: now,
      cliStarted: true,
      timezoneName: timezoneName,
    );

    // mainLoop();
    mainLoop(inLoop);
    smartContractLoop(inLoop);
    checkGuiUpdateStatus(inLoop);
    ref.read(beaconListProvider.notifier).refresh();

    Future.delayed(const Duration(milliseconds: 300)).then((_) async {
      ref.read(walletInfoProvider.notifier).infoLoop(inLoop);

      await Future.delayed(Duration(seconds: 5));

      setupChatListeners();

      if (!kIsWeb) {
        // if (!read(passwordRequiredProvider)) {
        //   _onboardWallet();
        // }

        checkRemoteInfo();
      }
    });
  }

  Future<void> setupChatListeners() async {
    final decShop = await DstService().retreiveShop();
    if (decShop != null && !decShop.isOffline) {
      ref.read(chatNotificationProvider("${decShop.ownerAddress}|seller").notifier);
    } else {
      final address = state.currentWallet?.address;
      if (address != null) {
        ref.read(chatNotificationProvider("$address|buyer").notifier);
      }
    }
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

  Future<void> checkGuiUpdateStatus([bool inLoop = false]) async {
    if (Env.isTestNet) {
      return;
    }
    final remoteInfo = await RemoteInfoService.fetchInfo();
    state = state.copyWith(remoteInfo: remoteInfo);

    if (inLoop) {
      await Future.delayed(const Duration(minutes: 10));
      checkGuiUpdateStatus();
    }
  }

  Future<void> checkRemoteInfo([int attempt = 1]) async {
    if (Env.isTestNet) {
      return;
    }

    if (!Env.promptForUpdates) {
      return;
    }

    final data = await BridgeService().walletInfo();
    final int? blockHeight = int.tryParse(data['BlockHeight']);

    if (blockHeight == null) {
      if (attempt > 20) {
        print("block height still null after 20 attempts so we shall stop the remote check");
        return;
      }
      await Future.delayed(const Duration(seconds: 5));
      checkRemoteInfo(attempt + 1);
      return;
    }

    final remoteInfo = await RemoteInfoService.fetchInfo();
    state = state.copyWith(remoteInfo: remoteInfo);

    await Future.delayed(const Duration(seconds: 3));

    if (remoteInfo != null) {
      if (remoteInfo.gui.updateAvailable) {
        updateGui();
        return;
      }

      final snapshotHeight = remoteInfo.snapshot.height;

      if (blockHeight < (snapshotHeight - 5000)) {
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

    final blockHeight = ref.read(walletInfoProvider)!.blockHeight;
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
      if (ref.read(walletListProvider).isNotEmpty) {
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
            ref: ref,
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
      ref.read(startupPasswordRequiredProvider.notifier).set(true);
      return false;
    }

    return true;
  }

  Future<void> mainLoop([inLoop = true]) async {
    if (state.cliStarted) {
      loadWallets();
      loadValidators();
      // await loadMasterNodes();
      // await loadPeerInfo();
      loadTransactions();
      loadTopics();
    }

    if (inLoop) {
      await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
      mainLoop(true);
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
      ref.read(topicListProvider(topicType).notifier).refresh();
    }

    ref.read(myVoteListProvider.notifier).refresh();
  }

  Future<void> smartContractLoop([inLoop = true]) async {
    if (state.currentWallet != null) {
      ref.read(mySmartContractsProvider.notifier).load();
      ref.read(nftListProvider.notifier).reloadCurrentPage();
      ref.read(mintedNftListProvider.notifier).reloadCurrentPage();
      ref.read(draftsSmartContractProvider.notifier).load();
      ref.read(listedNftsProvider.notifier).refresh();
    }

    if (inLoop) {
      await Future.delayed(const Duration(seconds: 15));
      smartContractLoop(true);
    }
  }

  Future<void> stopCli() async {
    // ref.read(logProvider.notifier).clear();
    state = _initial.copyWith(windowsLauncherPath: state.windowsLauncherPath);
    // ref.read(logProvider.notifier).append(LogEntry(message: "Shutting down CLI..."));
    await BridgeService().killCli();
    // ref.read(logProvider.notifier).append(LogEntry(message: "CLI terminated."));
    await Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> restartCli() async {
    await stopCli();
    await init(false);
    await fetchConfig();

    ref.read(beaconListProvider.notifier).refresh();
    ref.invalidate(connectedShopProvider);
    ref.invalidate(thumbnailFetcherProvider);
  }

  // Future<void> _checkBlockSyncStatus() async {
  //   await ref.read(genesisBlockProvider.notifier).load();
  //   if (ref.read(genesisBlockProvider) == null) {
  //     await Future.delayed(Duration(milliseconds: 300));
  //     _checkBlockSyncStatus();
  //     return;
  //   }

  //   final _remoteBlockHeight = ref.read(genesisBlockProvider)!.height;

  //   final _blocksAreSyncing = await BridgeService().blocksAreSyncing();

  //   state = state.copyWith(
  //     remoteBlockHeight: _remoteBlockHeight,
  //     blocksAreSyncing: _blocksAreSyncing,
  //   );
  // }

  Future<void> loadWallets() async {
    final List<Wallet> wallets = [];

    final response = await BridgeService().wallets();
    final reserveResponse = await ReserveAccountService().wallets();

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

      if (reserveResponse.isNotEmpty) {
        final data = jsonDecode(reserveResponse);
        if (data['Success'] == true && data['ReserveAccounts'] != null) {
          final reserveItems = data['ReserveAccounts'];
          for (Map<String, dynamic> item in reserveItems) {
            item['Balance'] = item['TotalBalance'];
            item['IsValidating'] = false;
            final Map<String, dynamic> _item = {
              ...item,
              'friendlyName': names.containsKey(item['Address']) ? names[item['Address']] : null,
            };
            wallets.add(Wallet.fromJson(_item));
          }
        }
      }
    }

    ref.read(walletListProvider.notifier).set(wallets);

    if (wallets.isNotEmpty) {
      final totalBalance = wallets.map((e) => e.balance).toList().sum;

      final currentWalletAddress = singleton<Storage>().getString(Storage.CURRENT_WALLET_ADDRESS_KEY);

      if (currentWalletAddress != null) {
        final currentWallet = wallets.firstWhereOrNull((element) => element.address == currentWalletAddress);

        if (currentWallet != null) {
          state = state.copyWith(currentWallet: currentWallet, totalBalance: totalBalance);
          ref.read(currentValidatorProvider.notifier).set(currentWallet);
        } else {
          state = state.copyWith(totalBalance: totalBalance);
        }
      } else {
        state = state.copyWith(currentWallet: wallets.first, totalBalance: totalBalance);
        ref.read(currentValidatorProvider.notifier).set(wallets.first);
      }
      final reserveWallets = wallets.where((w) => w.isReserved).toList();
      ref.read(reserveAccountProvider.notifier).set(reserveWallets);
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

    ref.read(validatorListProvider.notifier).set(wallets);
  }

  Future<void> loadMasterNodes() async {
    await ref.read(nodeListProvider.notifier).load();
  }

  Future<void> loadPeerInfo() async {
    await ref.read(nodeInfoProvider.notifier).load();
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
      await ref.read(transactionListProvider(type).notifier).load();
    }
  }

  void setCurrentWallet(Wallet wallet) {
    state = state.copyWith(currentWallet: wallet);
    singleton<Storage>().setString(Storage.CURRENT_WALLET_ADDRESS_KEY, wallet.address);

    final validators = ref.read(validatorListProvider);

    final currentValidator = validators.firstWhereOrNull((element) => element.address == wallet.address);

    ref.read(currentValidatorProvider.notifier).set(currentValidator);

    setupChatListeners();
  }

  void setFilteringTransactions(bool val) {
    state = state.copyWith(filteringTransactions: val);
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
      if (state.windowsLauncherPath == null) {
        final appPath = Directory.current.path;
        final p = "$appPath\\RBXCore\\${Env.isTestNet ? 'RBXLauncherTestNet.exe' : 'RBXLauncher.exe'}";
        state = state.copyWith(windowsLauncherPath: p);
        return p;
      }

      return state.windowsLauncherPath!;
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
      ref.read(logProvider.notifier).append(LogEntry(message: "Attempted $maxAttempts. Something went wrong."));

      return false;
    }

    final isRunning = await _cliIsActive();
    if (isRunning) {
      ref.read(logProvider.notifier).append(LogEntry(message: "ReserveBlockCore Started Successfully", variant: AppColorVariant.Success));
      await fetchConfig();
      final cliVersion = await BridgeService().getCliVersion();
      ref.read(logProvider.notifier).append(LogEntry(message: "CLI Version: $cliVersion", variant: AppColorVariant.Info));
      state = state.copyWith(cliVersion: cliVersion);
      ref.read(passwordRequiredProvider.notifier).check();
      ref.read(walletIsEncryptedProvider.notifier).check();
      return true;
    }

    ref.read(logProvider.notifier).append(LogEntry(message: "CLI loading..."));

    await Future.delayed(const Duration(seconds: 5));
    return _cliCheck(attempt + 1, maxAttempts);
  }

  Future<void> startupDataLoop() async {
    final data = await fetchStartupData();

    ref.read(startupDataProvider.notifier).set(data);

    await Future.delayed(const Duration(seconds: 1));
    if (!state.cliStarted) {
      startupDataLoop();
    }
  }

  Future<bool> _startCli(String apiToken) async {
    if (Env.launchCli) {
      if (await _cliIsActive()) {
        await fetchConfig();
        ref.read(logProvider.notifier).append(LogEntry(message: "CLI is already running!"));

        return true;
      }

      startupDataLoop();

      final cliPath = Env.cliPathOverride ?? getCliPath();
      List<String> options = Env.isTestNet ? ['enableapi', 'gui'] : ['enableapi', 'gui', 'apitoken=$apiToken'];

      if (Env.isTestNet) {
        options.add("testnet");
      }

      String cmd = '';

      if (Platform.isWindows) {
        ProcessManager pm = const LocalProcessManager();

        try {
          // final appPath = Directory.current.path;
          // cmd = Env.isTestNet ? "$appPath\\RbxCore\\RBXLauncherTestNet.exe" : "$appPath\\RbxCore\\RBXLauncher.exe";

          // if (state.windowsLauncherPath == null) {
          //   final p = "C:\\Program Files (x86)\\RBXWallet\\RBXCore\\${Env.isTestNet ? 'RBXLauncherTestNet.exe' : 'RBXLauncher.exe'}";
          //   state = state.copyWith(windowsLauncherPath: p);
          //   await Future.delayed(Duration(milliseconds: 100));
          // }

          ref.read(logProvider.notifier).append(LogEntry(message: "Launching CLI in the background."));
          final List<String> params = Env.isTestNet ? [cliPath] : [cliPath, 'apitoken=$apiToken'];
          pm.run(params).then((result) {
            ref.read(logProvider.notifier).append(LogEntry(message: "Command ran successfully."));
          });
          print("PARAMS: $params");
          print("***********");
          singleton<ApiTokenManager>().set(apiToken);

          await Future.delayed(const Duration(seconds: 3));
          return await _cliCheck();
        } catch (e) {
          print(e);
          ref.read(logProvider.notifier).append(LogEntry(
                message: "Process Error",
                variant: AppColorVariant.Danger,
              ));

          ref.read(logProvider.notifier).append(LogEntry(
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

        ref.read(logProvider.notifier).append(LogEntry(message: "Launching CLI in the background."));

        try {
          shell.run(cmd);
          singleton<ApiTokenManager>().set(apiToken);

          await Future.delayed(const Duration(seconds: 3));

          return await _cliCheck();
        } catch (e) {
          ref.read(logProvider.notifier).append(LogEntry(message: "Process Error.", variant: AppColorVariant.Danger));
          ref.read(logProvider.notifier).append(LogEntry(message: "$e", variant: AppColorVariant.Danger));

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
    ref.read(logProvider.notifier).append(LogEntry(
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

      ref.read(configProvider.notifier).setConfig(config);
      ref.read(logProvider.notifier).append(LogEntry(
            message: "Config Loaded...",
          ));
    } catch (e) {
      print(e);
    }
  }
}

final sessionProvider = StateNotifierProvider<SessionProvider, SessionModel>(
  (ref) => SessionProvider(ref),
);
