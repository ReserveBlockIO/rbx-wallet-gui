import 'package:flutter/material.dart';
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

enum HomeButtonSection {
  general,
  troubleshoot,
  security,
  nft,
  validator,
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
              label: Text("Troubleshoot"),
              value: HomeButtonSection.troubleshoot,
            ),
            ButtonSegment(
              label: Text("Security"),
              value: HomeButtonSection.security,
            ),
            ButtonSegment(
              label: Text("NFTs"),
              value: HomeButtonSection.nft,
            ),
            ButtonSegment(
              label: Text("Validator"),
              value: HomeButtonSection.validator,
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
                    ],
                  );
                case HomeButtonSection.troubleshoot:
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
                      ReserveAccountsButton(),
                      BackupButton(),
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
                      MotherButton(),
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