import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:collection/collection.dart';

class WalletListProvider extends StateNotifier<List<Wallet>> {
  final Reader read;

  WalletListProvider(this.read, [List<Wallet> wallets = const []]) : super(wallets);

  void set(List<Wallet> wallets) {
    state = wallets;
  }

  Future<Wallet?> import(String privateKey, [bool showDetails = false]) async {
    // if (!guardWalletIsNotResyncing(read)) return;

    final data = await BridgeService().importPrivateKey(privateKey);

    if (data == null) {
      Toast.error("No account found");
      return null;
    }

    final wallet = Wallet.fromJson(data);
    state = [...state, wallet];
    read(sessionProvider.notifier).setCurrentWallet(wallet);
    // read(sessionProvider.notifier).load();
    read(walletInfoProvider.notifier).fetch();

    if (showDetails) {
      final context = rootScaffoldKey.currentContext!;

      return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Wallet Created"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Here is your wallet details. Please ensure to back up your private key in a safe place."),
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: TextFormField(
                    initialValue: wallet.address,
                    decoration: const InputDecoration(label: Text("Address")),
                    readOnly: true,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.security),
                  title: TextFormField(
                    initialValue: wallet.privateKey,
                    decoration: const InputDecoration(
                      label: Text("Private Key"),
                    ),
                    style: const TextStyle(fontSize: 13),
                    readOnly: true,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: wallet.privateKey));
                      Toast.message("Private Key copied to clipboard");
                    },
                  ),
                ),
                const Divider(),
                AppButton(
                  label: "Done",
                  onPressed: () {
                    Navigator.of(context).pop(wallet);
                  },
                )
              ],
            ),
          );
        },
      );
    } else {
      return wallet;
    }
  }

  Future<void> create() async {
    if (!guardWalletIsNotResyncing(read)) return;

    final data = await BridgeService().newAddress();

    if (data == null) {
      Toast.error("An error occurred");
      return;
    }
    final json = jsonDecode(data);
    final privateKey = json[0]['PrivateKey'];

    await import(privateKey, true);
  }

  // void saveAll() {
  //   final items = [];
  //   for (final wallet in state) {
  //     items.add(wallet.toJson());
  //   }

  //   singleton<Storage>().setList(Storage.WALLETS_KEY, items);
  // }

  void rename(Wallet wallet, String name) {
    final index = state.indexWhere((element) => element.address == wallet.address);

    final w = state[index];
    final updatedWallet = Wallet(
      id: w.id,
      publicKey: w.publicKey,
      privateKey: w.privateKey,
      address: w.address,
      balance: w.balance,
      isValidating: w.isValidating,
      // isEncrypted: w.isEncrypted,
      friendlyName: name == "" ? null : name,
    );

    final newState = [...state];
    newState.removeAt(index);
    newState.insert(index, updatedWallet);

    state = newState;

    Map<String, dynamic>? names = singleton<Storage>().getMap(Storage.RENAMED_WALLETS_KEY);

    names ??= {};

    names[w.address] = name;

    singleton<Storage>().setMap(Storage.RENAMED_WALLETS_KEY, names);
  }

  void delete(Wallet wallet) {
    final index = state.indexWhere((element) => element.address == wallet.address);
    final newState = [...state];
    newState.removeAt(index);
    state = newState;
  }

  Wallet? getWallet(String address) {
    return state.firstWhereOrNull((element) => element.address == address);
  }
}

final walletListProvider = StateNotifierProvider<WalletListProvider, List<Wallet>>((ref) {
  return WalletListProvider(ref.read);
});
