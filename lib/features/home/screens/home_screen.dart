import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/verify_nft_ownership_button.dart';
import '../../../core/env.dart';
import '../../bridge/providers/wallet_info_provider.dart';
import '../components/home_buttons/import_snapshot_button.dart';
import '../components/home_buttons/mother_button.dart';
import '../components/home_buttons/reserve_accounts_button.dart';
import '../components/home_buttons/validating_check_button.dart';
import 'package:rbx_wallet/features/keygen/components/keygen_cta.dart'
    if (dart.library.io) 'package:rbx_wallet/features/keygen/components/keygen_cta_mock.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/session_provider.dart';
import '../../hd/components/restore_hd_wallet_button.dart';
import '../components/home_buttons/backup_button.dart';
import '../components/home_buttons/encrypt_wallet_button.dart';
import '../components/home_buttons/hd_wallet_button.dart';
import '../components/home_buttons/open_db_button.dart';
import '../components/home_buttons/open_log_button.dart';
import '../components/home_buttons/print_addresses_button.dart';
import '../components/home_buttons/print_validators_button.dart';
import '../components/home_buttons/restart_cli_button.dart';
import '../components/home_buttons/show_debug_data_button.dart';
import '../components/log_window.dart';
import '../components/transaction_window.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Dashboard"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      // centerTitle: false,
      leading: IconButton(
        onPressed: () {
          ref.read(walletInfoProvider.notifier).infoLoop(false);
          ref.read(sessionProvider.notifier).mainLoop(false);
          ref.read(sessionProvider.notifier).smartContractLoop(false);
        },
        icon: const Icon(Icons.refresh),
      ),
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (kIsWeb)
                Text(
                  "Keys",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              if (kIsWeb) const Divider(),
              if (kIsWeb) const KeygenCta(),
              if (!kIsWeb)
                Text(
                  "General Tools",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              if (!kIsWeb) const Divider(),
              if (!kIsWeb)
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: [
                    const RestartCliButton(),
                    const HdWalletButton(),
                    if (ref.watch(walletListProvider).isEmpty) const RestoreHdWalletButton(),
                    const EncryptWalletButton(),
                    const ReserveAccountsButton(),
                    const PrintAdressesButton(),
                    const PrintValidatorsButton(),
                    const ValidatingCheckButton(),
                    const MotherButton(),
                    const ShowDebugDataButton(),
                    const OpenDbFolderButton(),
                    const OpenLogButton(),
                    const VerifyNftOwnershipButton(),
                    const BackupButton(),
                    if (Env.promptForUpdates) const ImportSnapshotButton(),
                  ],
                ),
              const Divider(),
              const LogWindow(),
              const Divider(),
              const TransactionWindow(),
            ],
          ),
        ),
      ),
    );
  }
}
