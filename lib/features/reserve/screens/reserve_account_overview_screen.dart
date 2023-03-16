import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';

import 'package:rbx_wallet/core/theme/app_theme.dart';

import 'package:rbx_wallet/features/reserve/providers/reserve_account_provider.dart';

class ReserveAccountOverviewScreen extends BaseScreen {
  const ReserveAccountOverviewScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Reserve Accounts"),
      actions: [
        // TextButton(
        //   onPressed: () {
        //     AutoRouter.of(context).push(const CreateCollectionContainerScreenRoute());
        //   },
        //   child: Text(
        //     "Create Collection",
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(reserveAccountProvider.notifier);
    final wallets = ref.watch(reserveAccountProvider);

    return Column(
      children: [
        Text(
          "Reserve Accounts",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        AppButton(
          label: "Setup Account",
          icon: Icons.add,
          variant: AppColorVariant.Success,
          onPressed: () {
            provider.newAccount(context);
          },
        ),
        SizedBox(
          height: 8,
        ),
        AppButton(
          label: "Recover Account",
          icon: Icons.rotate_90_degrees_cw_rounded,
          type: AppButtonType.Text,
          variant: AppColorVariant.Light,
          onPressed: () async {
            provider.recoverAccount(context);
          },
        ),
        Divider(),
        Text(
          "Existing Accounts",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
        ),
        SizedBox(height: 3),
        wallets.isEmpty
            ? Text("No Reserve Accounts")
            : Expanded(
                child: ListView.builder(
                  itemCount: wallets.length,
                  itemBuilder: (context, index) {
                    final wallet = wallets[index];

                    return Card(
                      child: ListTile(
                        title: Text(wallet.address),
                        subtitle: Row(mainAxisSize: MainAxisSize.min, children: [
                          Text("Available: ${wallet.availableBalance} RBX"),
                          SizedBox(width: 4),
                          InkWell(
                            onTap: () {
                              provider.showBalanceInfo(wallet);
                            },
                            child: Icon(
                              Icons.help,
                              size: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        ]),
                        trailing: Builder(builder: (context) {
                          if (wallet.isNetworkProtected) {
                            return AppBadge(
                              label: "Activated",
                              variant: AppColorVariant.Success,
                            );
                          }

                          return AppButton(
                            label: "Activate",
                            onPressed: () {
                              provider.activate(wallet);
                            },
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
