import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/status_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/rarity.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/stat.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/utils/toast.dart';

class CreateScProvider extends StateNotifier<SmartContract> {
  final Reader read;

  CreateScProvider(this.read, SmartContract model) : super(model);

  void setOwner(Wallet wallet) {
    state = state.copyWith(owner: wallet);
  }

  void setName(String value) {
    state = state.copyWith(name: value);
  }

  void setDescription(String value) {
    state = state.copyWith(name: value);
  }

  void addStat(Stat stat) {
    print('adding');
    state = state.copyWith(stats: [...state.stats, stat]);
  }

  void setStats(List<Stat> stats) {
    print('setting');

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

  // --compile --

  bool isValidForCompile() {
    return true; //TODO: validate stuff
  }

  Future<CompiledSmartContract?> compile() async {
    if (!isValidForCompile()) {
      //TODO: show validation issues
      Toast.error("Invalid smart contract");
      return null;
    }

    final payload = state.serializeForCompiler();

    final csc = await BridgeService().compileSmartContract(payload);

    if (csc == null) {
      Toast.error();
      return null;
    }

    Toast.message("Smart Contract compiled successfully.");

    return csc;
  }
}

final createScProvider = StateNotifierProvider<CreateScProvider, SmartContract>(
  (ref) {
    final List<Rarity> rarities = [
      Rarity(name: "Basic", weight: 0.9, description: "Lorem ipsum"),
      Rarity(name: "Gold", weight: 0.1, description: "Lorem ipsum doller"),
    ];

    final List<Stat> stats = [
      Stat(label: "Background", value: "#CCCCCC", type: StatType.color),
      Stat(label: "HP", value: "100", type: StatType.color),
    ];

    final initial = SmartContract(
      owner: ref.read(sessionProvider).currentWallet!,
      rarities: rarities,
      royalties: [
        Royalty(type: RoyaltyType.percent, amount: 0.1, address: "abc123")
      ],
      stats: stats,
    );
    return CreateScProvider(ref.read, initial);
  },
);
