import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/explorer_service.dart';

import '../../../core/models/paginated_response.dart';
import '../../../core/providers/web_session_provider.dart';
import '../services/nft_service.dart';
import 'nft_list_provider.dart';

class MintedNftListProvider extends StateNotifier<NftListModel> {
  final Ref ref;

  final TextEditingController searchController = TextEditingController();

  MintedNftListProvider(this.ref, NftListModel model) : super(model);

  Future<void> load(int page, [String? address]) async {
    if (kIsWeb) {
      if (address == null) {
        return;
      }
      final nfts = await ExplorerService().listMintedNfts(
        address,
        page: page,
        search: state.search.isNotEmpty ? state.search : null,
      );

      final filteredNfts = nfts.where((n) => n.canEvolve).toList();

      final d = CliPaginatedResponse(count: nfts.length, results: filteredNfts, page: page);
      state = state.copyWith(data: d, page: page, currentSearch: state.search);
      return;
    }

    final data = await NftService().minted(page, search: state.search);

    state = state.copyWith(page: page, data: data, currentSearch: state.search);
  }

  Future<void> reloadCurrentPage([String? address]) async {
    load(state.page, address);
  }

  void setSearch(String search) {
    state = state.copyWith(search: search);
  }

  void clearSearch() {
    state = state.copyWith(search: "");
    searchController.clear();
  }
}

final mintedNftListProvider = StateNotifierProvider<MintedNftListProvider, NftListModel>(
  (ref) => MintedNftListProvider(
    ref,
    NftListModel(page: kIsWeb ? 1 : 0, data: CliPaginatedResponse.empty()),
  ),
);
