import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/sc_property/models/sc_property.dart';

import '../../../core/app_constants.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/transaction_service.dart';
import '../../../utils/generators.dart';
import '../../../utils/guards.dart';
import '../../asset/asset.dart';
import '../../bridge/providers/wallet_info_provider.dart';
import '../../nft/providers/minted_nft_list_provider.dart';
import '../../nft/providers/nft_list_provider.dart';
import '../../nft/services/nft_service.dart';
import '../../wallet/models/wallet.dart';
import '../components/sc_creator/common/compile_animation.dart';
import '../features/evolve/evolve.dart';
import '../features/evolve/evolve_form_provider.dart';
import '../features/multi_asset/multi_asset_provider.dart';
import '../features/royalty/royalty.dart';
import '../features/royalty/royalty_form_provider.dart';
import '../features/soul_bound/soul_bound.dart';
import '../features/ticket/ticket.dart';
import '../models/compiled_smart_contract.dart';
import '../models/fractional.dart';
import '../models/multi_asset.dart';
import '../models/pair.dart';
import '../models/smart_contract.dart';
import '../models/stat.dart';
import '../models/tokenization.dart';
import '../services/smart_contract_service.dart';
import 'draft_smart_contracts_provider.dart';
import 'my_smart_contracts_provider.dart';

class CreateSmartContractProvider extends StateNotifier<SmartContract> {
  final Ref ref;

  late final TextEditingController nameController;
  late final TextEditingController minterNameController;
  late final TextEditingController descriptionController;

  CreateSmartContractProvider(this.ref, SmartContract model) : super(model) {
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
    ref.read(evolveFormProvider.notifier).clear();
    ref.read(royaltyFormProvider.notifier).clear();
    ref.read(multiAssetFormProvider.notifier).clear();

    final sc = SmartContract(
      owner: kIsWeb ? ref.read(webSessionProvider).currentWallet! : ref.read(sessionProvider).currentWallet!,
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
    state = state.copyWith(royalties: [...state.royalties]..removeAt(index));
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
    state = state.copyWith(evolves: [...state.evolves]..removeAt(index));
  }

  void saveTokenization(Tokenization tokenization) {
    print(tokenization);
    final exists = state.tokenizations.firstWhereOrNull((t) => t.id == tokenization.id);

    if (exists == null) {
      state = state.copyWith(tokenizations: [...state.tokenizations, tokenization]);
    } else {
      final index = state.tokenizations.indexWhere((t) => t.id == tokenization.id);
      _updateTokenization(tokenization, index);
    }
  }

  void _updateTokenization(Tokenization tokenization, int index) {
    final updatedTokenizations = [...state.tokenizations];
    updatedTokenizations.removeAt(index);
    updatedTokenizations.insert(index, tokenization);
    state = state.copyWith(tokenizations: updatedTokenizations);
  }

  void removeTokenization(Tokenization tokenization) {
    final index = state.tokenizations.indexWhere((t) => t.id == tokenization.id);
    state = state.copyWith(tokenizations: [...state.tokenizations]..removeAt(index));
  }

  void saveFractional(Fractional fractional) {
    final exists = state.fractionals.firstWhereOrNull((r) => r.id == fractional.id);

    if (exists == null) {
      state = state.copyWith(fractionals: [...state.fractionals, fractional]);
    } else {
      final index = state.fractionals.indexWhere((r) => r.id == fractional.id);
      _updateFractional(fractional, index);
    }
  }

  void _updateFractional(Fractional fractional, int index) {
    final updatedFractionals = [...state.fractionals];
    updatedFractionals.removeAt(index);
    updatedFractionals.insert(index, fractional);
    state = state.copyWith(fractionals: updatedFractionals);
  }

  void removeFractional(Fractional fractional) {
    final index = state.fractionals.indexWhere((r) => r.id == fractional.id);
    state = state.copyWith(fractionals: [...state.fractionals]..removeAt(index));
  }

  void _updateTicket(Ticket ticket, int index) {
    final updatedTickets = [...state.tickets];
    updatedTickets.removeAt(index);
    updatedTickets.insert(index, ticket);
    state = state.copyWith(tickets: updatedTickets);
  }

  void savePair(Pair pair) {
    final exists = state.pairs.firstWhereOrNull((t) => t.id == pair.id);

    if (exists == null) {
      state = state.copyWith(pairs: [...state.pairs, pair]);
    } else {
      final index = state.pairs.indexWhere((t) => t.id == pair.id);
      _updatePair(pair, index);
    }
  }

  void _updatePair(Pair pair, int index) {
    final updatedPairs = [...state.pairs];
    updatedPairs.removeAt(index);
    updatedPairs.insert(index, pair);
    state = state.copyWith(pairs: updatedPairs);
  }

  void removePair(Pair tokenization) {
    final index = state.pairs.indexWhere((t) => t.id == tokenization.id);
    state = state.copyWith(pairs: [...state.pairs]..removeAt(index));
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

  void removeTicket(Ticket ticket) {
    final index = state.tickets.indexWhere((t) => t.id == ticket.id);
    state = state.copyWith(tickets: [...state.tickets]..removeAt(index));
  }

  void saveMultiAsset(MultiAsset multiAsset) {
    final exists = state.multiAssets.firstWhereOrNull((m) => m.id == multiAsset.id);

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
    state = state.copyWith(multiAssets: [...state.multiAssets]..removeAt(index));
  }

  void saveSoulBound(SoulBound soulBound) {
    final exists = state.soulBounds.firstWhereOrNull((sb) => sb.id == soulBound.id);

    if (exists == null) {
      state = state.copyWith(soulBounds: [...state.soulBounds, soulBound]);
    } else {
      final index = state.soulBounds.indexWhere((sb) => sb.id == soulBound.id);
      _updateSoulBound(soulBound, index);
    }
  }

  void _updateSoulBound(SoulBound soulBound, int index) {
    final updatedSoulBounds = [...state.soulBounds];
    updatedSoulBounds.removeAt(index);
    updatedSoulBounds.insert(index, soulBound);
    state = state.copyWith(soulBounds: updatedSoulBounds);
  }

  void removeSoulBound(SoulBound soulBound) {
    final index = state.soulBounds.indexWhere((sb) => sb.id == soulBound.id);
    state = state.copyWith(soulBounds: [...state.soulBounds]..removeAt(index));
  }

  void addProperty(ScProperty property) {
    state = state.copyWith(properties: [...state.properties, property]);
  }

  void updateProperty(ScProperty property, int index) {
    final updatedProperties = [...state.properties];
    updatedProperties.removeAt(index);
    updatedProperties.insert(index, property);
    state = state.copyWith(properties: updatedProperties);
  }

  void removeProperty(int index) {
    state = state.copyWith(properties: [...state.properties]..removeAt(index));
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

    ref.read(draftsSmartContractProvider.notifier).load();
  }

  void saveMintedNft(String id) {
    NftService().saveId(id);
    ref.read(mintedNftListProvider.notifier).reloadCurrentPage();
  }

  // --compile --

  List<String> isValidForCompile() {
    final List<String> errors = [];

    if (state.primaryAsset == null) {
      errors.add("- Asset is required");
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

    // int filesize = 0;

    // if (state.primaryAsset != null) {
    //   filesize += state.primaryAsset!.fileSize;
    // }

    // if (filesize > MAX_ASSET_BYTES) {
    //   errors.add("- Asset filesize sum must not exceed ${readableFileSize(MAX_ASSET_BYTES)}");
    //   errors.add("  (current size is ${readableFileSize(filesize)})");
    // }

    return errors;
  }

  bool get shouldWarnEvo {
    if (state.evolves.isEmpty) {
      return false;
    }

    for (final evo in state.evolves) {
      for (final phase in evo.phases) {
        if (phase.blockHeight != null && ref.read(walletInfoProvider) != null) {
          if (phase.blockHeight! < ref.read(walletInfoProvider)!.blockHeight) {
            return true;
          }
        }
        if (state.evolves.first.type == EvolveType.time) {
          if (phase.dateTime != null) {
            if (phase.dateTime!.isBefore(DateTime.now())) {
              return true;
            }
          } else {
            return true;
          }
        }
      }
    }

    return false;
  }

  Future<bool> compileAndMintForWeb() async {
    final timezoneName = ref.read(webSessionProvider).timezoneName;
    final payload = state.serializeForCompiler(timezoneName);

    final success = await RawService().compileAndMintSmartContract(payload, ref.read(webSessionProvider).keypair!);
    if (success == true) {
      ref.read(nftListProvider.notifier).reloadCurrentPage(ref.read(webSessionProvider).keypair?.email, ref.read(webSessionProvider).keypair?.public);
      return true;
    }
    return false;
  }

  Future<CompiledSmartContract?> compile() async {
    // if (!kDebugMode) {
    if (!guardWalletIsSynced(ref)) {
      return null;
    }
    // }

    final timezoneName = ref.read(sessionProvider).timezoneName;

    final payload = state.serializeForCompiler(timezoneName);

    // if (kIsWeb) {
    //   final success = await ExplorerService().compileAndMintSmartContract(payload, ref.read(webSessionProvider).keypair!);
    //   if (success == true) {
    //     ref.read(nftListProvider.notifier).reloadCurrentPage();
    //   }
    // }

    final csc = await SmartContractService().compileSmartContract(payload);

    if (csc == null) {
      return null;
    }

    if (!csc.success) {
      return null;
    }

    final details = await SmartContractService().retrieve(csc.smartContract.id);

    if (kIsWeb) {
    } else {
      ref.read(mySmartContractsProvider.notifier).load();
      ref.read(nftListProvider.notifier).reloadCurrentPage();
    }
    if (details != null) {
      if (DELETE_DRAFT_ON_MINT) {
        deleteDraft();
      }

      final wallet = kIsWeb
          ? Wallet.fromWebWallet(
              keypair: ref.read(webSessionProvider).keypair!,
              balance: ref.read(webSessionProvider).balance ?? 0,
            )
          : ref.read(sessionProvider).currentWallet!;

      final sc = SmartContract.fromCompiled(details, wallet);
      ref.read(createSmartContractProvider.notifier).setSmartContract(
            sc.copyWith(
              isCompiled: ALLOW_DOUBLE_MINTES ? false : true,
            ),
          );
    }

    return csc.smartContract;
  }

  Future<bool> mint([String? idOverride]) async {
    final success = await SmartContractService().mint(idOverride ?? state.id);

    if (success) {
      saveMintedNft(state.id);
    }

    final details = await SmartContractService().retrieve(state.id);

    ref.read(mySmartContractsProvider.notifier).load();
    kIsWeb
        ? ref
            .read(nftListProvider.notifier)
            .reloadCurrentPage(ref.read(webSessionProvider).keypair?.email, ref.read(webSessionProvider).keypair?.public)
        : ref.read(nftListProvider.notifier).reloadCurrentPage();

    if (details != null) {
      final wallet = kIsWeb ? ref.read(webSessionProvider).currentWallet! : ref.read(sessionProvider).currentWallet!;
      final sc = SmartContract.fromCompiled(details, wallet);
      ref.read(createSmartContractProvider.notifier).setSmartContract(
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
    ref.read(draftsSmartContractProvider.notifier).load();
  }
}

final createSmartContractProvider = StateNotifierProvider<CreateSmartContractProvider, SmartContract>(
  (ref) {
    if (kIsWeb) {
      final initial = SmartContract(
        owner: ref.read(webSessionProvider).currentWallet!,
      );
      return CreateSmartContractProvider(ref, initial);
    } else {
      final initial = SmartContract(
        owner: ref.read(sessionProvider).currentWallet!,
      );
      return CreateSmartContractProvider(ref, initial);
    }
  },
);
