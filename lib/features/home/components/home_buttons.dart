import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/screens/tokenize_btc_screen.dart';
import 'package:rbx_wallet/features/hd/components/restore_hd_wallet_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/backup_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/encrypt_wallet_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/hd_wallet_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/import_media_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/mother_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/open_db_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/open_log_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/print_addresses_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/print_validators_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/reserve_accounts_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/restart_cli_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/show_debug_data_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/validating_check_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/verify_nft_ownership_button.dart';

import '../../btc/screens/tokenized_btc_list_screen.dart';

enum HomeButtonSection {
  general,
  security,
  nft,
  validator,
  diagnose,
}

class HomeButtons extends StatefulWidget {
  final bool includeRestoreHd;
  const HomeButtons({super.key, required this.includeRestoreHd});

  @override
  State<HomeButtons> createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  Set<HomeButtonSection> selection = {HomeButtonSection.general};

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SegmentedButton<HomeButtonSection>(
          multiSelectionEnabled: false,
          selectedIcon: null,
          showSelectedIcon: false,
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                width: 1,
                color: Colors.white54,
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context).colorScheme.secondary;
                }
                return Colors.black;
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context).colorScheme.primary;
                }
                return Colors.white;
              },
            ),
          ),
          onSelectionChanged: (value) {
            setState(() {
              selection = value;
            });
          },
          segments: [
            ButtonSegment(
              label: Text("General"),
              value: HomeButtonSection.general,
            ),
            ButtonSegment(
              label: Text("Wallet Security"),
              value: HomeButtonSection.security,
            ),
            ButtonSegment(
              label: Text("Tokens / NFTs"),
              value: HomeButtonSection.nft,
            ),
            ButtonSegment(
              label: Text("Validator"),
              value: HomeButtonSection.validator,
            ),
            ButtonSegment(
              label: Text("Diagnose"),
              value: HomeButtonSection.diagnose,
            ),
          ],
          selected: selection,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Builder(
            builder: (context) {
              switch (selection.first) {
                case HomeButtonSection.general:
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      RestartCliButton(),
                      PrintAdressesButton(),
                      const OpenDbFolderButton(),
                      // AppButton(
                      //   label: "Tokenize BTC",
                      //   variant: AppColorVariant.Btc,
                      //   icon: FontAwesomeIcons.bitcoin,
                      //   onPressed: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) => TokenizeBtcListScreen(),
                      //       ),
                      //     );
                      //   },
                      // )
                    ],
                  );
                case HomeButtonSection.security:
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      EncryptWalletButton(),
                      HdWalletButton(),
                      if (widget.includeRestoreHd) RestoreHdWalletButton(),
                      BackupButton(),
                      ReserveAccountsButton(),
                    ],
                  );
                case HomeButtonSection.nft:
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      VerifyNftOwnershipButton(),
                      ImportMediaButton(),
                      BackupButton(),
                      AppButton(
                        label: "Beacons",
                        onPressed: () {
                          tabsRouter.setActiveIndex(12);
                        },
                      ),
                      AppButton(
                        label: "Mint Fungible",
                        onPressed: () {},
                      ),
                      AppButton(
                        label: "Token Voting",
                        onPressed: () {},
                      ),
                    ],
                  );

                case HomeButtonSection.validator:
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      PrintValidatorsButton(),
                      ValidatingCheckButton(),
                      AppButton(
                        label: "Validator Pool",
                        onPressed: () {
                          tabsRouter.setActiveIndex(6);
                        },
                      ),
                      AppButton(
                        label: "Proposals & Voting",
                        onPressed: () {
                          tabsRouter.setActiveIndex(11);
                        },
                      ),
                      MotherButton(),
                    ],
                  );
                case HomeButtonSection.diagnose:
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      RestartCliButton(),
                      const OpenDbFolderButton(),
                      OpenLogButton(),
                      ShowDebugDataButton(),
                      ValidatingCheckButton(),
                      AppButton(
                        label: "Mempool",
                        onPressed: () {},
                      ),
                    ],
                  );
              }
            },
          ),
        )
      ],
    );
  }
}
