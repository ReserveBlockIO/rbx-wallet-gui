import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/bridge/providers/status_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/rarity.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/stat.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/draft_smart_contracts_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/my_smart_contracts_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class CreateSmartContractProvider extends StateNotifier<SmartContract> {
  final Reader read;

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;

  CreateSmartContractProvider(this.read, SmartContract model) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
    clearSmartContract();
  }

  void setSmartContract(SmartContract smartContract) {
    state = smartContract;

    nameController.text = state.name;
    descriptionController.text = state.description;
  }

  void clearSmartContract() {
    final sc = SmartContract(
      owner: read(sessionProvider).currentWallet!,
    );

    setSmartContract(sc);
  }

  void setOwner(Wallet wallet) {
    state = state.copyWith(owner: wallet);
  }

  void setName(String value) {
    state = state.copyWith(name: value);
  }

  void setDescription(String value) {
    state = state.copyWith(name: value);
  }

  void setPrimaryAsset(Asset? asset) {
    state = state.copyWith(primaryAsset: asset);
  }

  void addStat(Stat stat) {
    state = state.copyWith(stats: [...state.stats, stat]);
  }

  void setStats(List<Stat> stats) {
    state = state.copyWith(stats: stats);
  }

  void saveRoyalty(Royalty royalty) {
    final exists = state.royalties.firstWhereOrNull((r) => r.id == royalty.id);

    if (exists == null) {
      state = state.copyWith(royalties: [...state.royalties, royalty]);
    } else {
      final index = state.royalties.indexWhere((r) => r.id == royalty.id);
      _updateRoyalty(royalty, index);
    }
  }

  void _updateRoyalty(Royalty royalty, int index) {
    final updatedRoyalties = [...state.royalties];
    updatedRoyalties.removeAt(index);
    updatedRoyalties.insert(index, royalty);
    state = state.copyWith(royalties: updatedRoyalties);
  }

  void removeRoyalty(Royalty royalty) {
    final index = state.royalties.indexWhere((r) => r.id == royalty.id);
    state = state.copyWith(royalties: state.royalties..removeAt(index));
  }

  void saveEvolve(Evolve evolve) {
    final exists = state.evolves.firstWhereOrNull((e) => e.id == evolve.id);

    if (exists == null) {
      state = state.copyWith(evolves: [...state.evolves, evolve]);
    } else {
      final index = state.evolves.indexWhere((e) => e.id == evolve.id);
      _updateEvolve(evolve, index);
    }
  }

  void _updateEvolve(Evolve evolve, int index) {
    final updatedEvolves = [...state.evolves];
    updatedEvolves.removeAt(index);
    updatedEvolves.insert(index, evolve);
    state = state.copyWith(evolves: updatedEvolves);
  }

  void removeEvolve(Evolve evolve) {
    final index = state.evolves.indexWhere((e) => e.id == evolve.id);
    state = state.copyWith(evolves: state.evolves..removeAt(index));
  }

  void saveTicket(Ticket ticket) {
    final exists = state.tickets.firstWhereOrNull((t) => t.id == ticket.id);

    if (exists == null) {
      state = state.copyWith(tickets: [...state.tickets, ticket]);
    } else {
      final index = state.tickets.indexWhere((t) => t.id == ticket.id);
      _updateTicket(ticket, index);
    }
  }

  void _updateTicket(Ticket ticket, int index) {
    final updatedTickets = [...state.tickets];
    updatedTickets.removeAt(index);
    updatedTickets.insert(index, ticket);
    state = state.copyWith(tickets: updatedTickets);
  }

  void removeTicket(Ticket ticket) {
    final index = state.tickets.indexWhere((t) => t.id == ticket.id);
    state = state.copyWith(tickets: state.tickets..removeAt(index));
  }

  // Future<Asset> initAsset(String filePath) async {
  //   final name = filePath.split("/").last;
  //   final extension = name.split(".").last;
  //   final fileSize = (await File(filePath).readAsBytes()).length;

  //   return Asset(
  //     id: "00000000-0000-0000-0000-000000000000",
  //     name: name,
  //     location: filePath,
  //     extension: extension,
  //     fileSize: fileSize,
  //   );
  // }

  // saving

  void _preSave() {
    state = state.copyWith(
      name: nameController.text,
      description: descriptionController.text,
    );
  }

  void saveDraft() {
    _preSave();
    SmartContractService().saveToStorage(state);

    read(draftsSmartContractProvider.notifier).load();
  }

  // --compile --

  List<String> isValidForCompile() {
    final List<String> errors = [];

    if (state.primaryAsset == null) {
      errors.add("- Primary asset is required");
    }
    if (state.name.isEmpty) {
      errors.add("- Name is required");
    }

    if (state.description.isEmpty) {
      errors.add("- Description is required");
    }

    return errors;
  }

  Future<CompiledSmartContract?> compile() async {
    _preSave();

    final errors = isValidForCompile();
    if (errors.isNotEmpty) {
      InfoDialog.show(
        title: "Invalid Smart Contract",
        body: errors.join("\n"),
        closeText: "Okay",
      );

      return null;
    }

    final payload = state.serializeForCompiler();

    print(payload);

    final csc = await SmartContractService().compileSmartContract(payload);

    if (csc == null) {
      Toast.error();
      return null;
    }

    if (!csc.success) {
      Toast.error();
      return null;
    }

    Toast.message("Smart Contract compiled successfully.");
    read(mySmartContractsProvider.notifier).load();

    return csc.smartContract;
  }
}

final createSmartContractProvider =
    StateNotifierProvider<CreateSmartContractProvider, SmartContract>(
  (ref) {
    final initial = SmartContract(
      owner: ref.read(sessionProvider).currentWallet!,
    );
    return CreateSmartContractProvider(ref.read, initial);
  },
);
