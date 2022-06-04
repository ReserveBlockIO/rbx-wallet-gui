import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/minted_nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/compile_animation.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/multi_asset.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/stat.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/draft_smart_contracts_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/my_smart_contracts_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/generators.dart';
import 'package:rbx_wallet/utils/toast.dart';

class CreateSmartContractProvider extends StateNotifier<SmartContract> {
  final Reader read;

  late final TextEditingController nameController;
  late final TextEditingController minterNameController;
  late final TextEditingController descriptionController;

  CreateSmartContractProvider(this.read, SmartContract model) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
    minterNameController = TextEditingController(text: model.minterName);
    clearSmartContract();
  }

  void setSmartContract(SmartContract smartContract) {
    state = smartContract;

    nameController.text = state.name;
    descriptionController.text = state.description;
    minterNameController.text = state.minterName;
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

  void setMinterName(String value) {
    state = state.copyWith(minterName: value);
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

  void saveMultiAsset(MultiAsset multiAsset) {
    final exists =
        state.multiAssets.firstWhereOrNull((m) => m.id == multiAsset.id);

    if (exists == null) {
      state = state.copyWith(multiAssets: [...state.multiAssets, multiAsset]);
    } else {
      final index = state.multiAssets.indexWhere((m) => m.id == multiAsset.id);
      _updateMultiAsset(multiAsset, index);
    }
  }

  void _updateMultiAsset(MultiAsset multiAsset, int index) {
    final updatedMultiAssets = [...state.multiAssets];
    updatedMultiAssets.removeAt(index);
    updatedMultiAssets.insert(index, multiAsset);
    state = state.copyWith(multiAssets: updatedMultiAssets);
  }

  void removeMultiAsset(MultiAsset multiAsset) {
    final index = state.multiAssets.indexWhere((m) => m.id == multiAsset.id);
    state = state.copyWith(multiAssets: state.multiAssets..removeAt(index));
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

  void preSave() {
    state = state.copyWith(
      name: nameController.text,
      minterName: minterNameController.text,
      description: descriptionController.text,
    );
  }

  void saveDraft() {
    preSave();

    if (state.draftId.isEmpty) {
      state = state.copyWith(draftId: uniqueId());
    }

    SmartContractService().saveToStorage(state);

    read(draftsSmartContractProvider.notifier).load();
  }

  void saveMintedNft(String id) {
    NftService().saveId(id);
    read(mintedNftListProvider.notifier).load();
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

    if (state.minterName.isEmpty) {
      errors.add("- Minter name is required");
    }

    if (state.description.isEmpty) {
      errors.add("- Description is required");
    }

    return errors;
  }

  Future<CompiledSmartContract?> compile() async {
    final payload =
        state.serializeForCompiler(read(sessionProvider).timezoneName);

    final csc = await SmartContractService().compileSmartContract(payload);

    if (csc == null) {
      return null;
    }

    if (!csc.success) {
      return null;
    }

    final details = await SmartContractService().retrieve(csc.smartContract.id);

    read(mySmartContractsProvider.notifier).load();
    read(nftListProvider.notifier).load();

    if (details != null) {
      if (DELETE_DRAFT_ON_MINT) {
        deleteDraft();
      }

      final wallets = read(walletListProvider);
      final sc = SmartContract.fromCompiled(details, wallets);
      read(createSmartContractProvider.notifier).setSmartContract(
        sc.copyWith(
          isCompiled: ALLOW_DOUBLE_MINTES ? false : true,
        ),
      );
    }

    return csc.smartContract;
  }

  Future<bool> mint() async {
    final success = await SmartContractService().mint(state.id);

    if (success) {
      saveMintedNft(state.id);
    }

    final details = await SmartContractService().retrieve(state.id);

    read(mySmartContractsProvider.notifier).load();
    read(nftListProvider.notifier).load();

    if (details != null) {
      final wallets = read(walletListProvider);
      final sc = SmartContract.fromCompiled(details, wallets);
      read(createSmartContractProvider.notifier).setSmartContract(
        sc.copyWith(
          isPublished: true,
        ),
      );
    }

    return success;
  }

  void showCompileAnimation(
    BuildContext context,
    Completer<BuildContext> completer, [
    bool mint = false,
  ]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.transparent,
      builder: (dialogContext) {
        if (!completer.isCompleted) {
          completer.complete(dialogContext);
        }
        return Center(child: CompileAnimation(mint));
      },
    );
  }

  void showCompileComplete(
    BuildContext context,
    Completer<BuildContext> completer, [
    bool mint = false,
  ]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.transparent,
      builder: (dialogContext) {
        if (!completer.isCompleted) {
          completer.complete(dialogContext);
        }
        return Center(child: CompileAnimationComplete(mint));
      },
    );
  }

  void deleteDraft() {
    SmartContractService().deleteFromStorage(state);
    read(draftsSmartContractProvider.notifier).load();
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
