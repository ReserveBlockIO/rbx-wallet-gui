import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';

import '../../../core/models/paginated_response.dart';
import '../../../core/providers/web_session_provider.dart';
import '../services/nft_service.dart';
import 'nft_list_provider.dart';

class MintedNftListProvider extends StateNotifier<NftListModel> {
  final Ref ref;

  final TextEditingController searchController = TextEditingController();

  MintedNftListProvider(this.ref, NftListModel model) : super(model) {
    load(1);
  }

  Future<void> load(int page) async {
    if (kIsWeb) {
      final nfts = await RawService().listMintedNfts(ref.read(webSessionProvider).keypair!.address);
      final d = CliPaginatedResponse(count: nfts.length, results: nfts, page: 1);
      state = state.copyWith(data: d, page: 1, currentSearch: '');
      return;
    }

    final data = await NftService().minted(page, search: state.search);

    state = state.copyWith(page: page, data: data, currentSearch: state.search);
  }

  Future<void> reloadCurrentPage() async {
    load(state.page);
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
    NftListModel(page: 0, data: CliPaginatedResponse.empty()),
  ),
);
