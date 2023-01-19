import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/paginated_response.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/transaction_service.dart';
import '../services/nft_service.dart';
import 'nft_list_provider.dart';

class MintedNftListProvider extends StateNotifier<NftListModel> {
  final Reader read;

  final TextEditingController searchController = TextEditingController();

  MintedNftListProvider(this.read, NftListModel model) : super(model) {
    load(1);
  }

  Future<void> load(int page) async {
    if (kIsWeb) {
      final nfts = await TransactionService().listMintedNfts(read(webSessionProvider).keypair!.email, read(webSessionProvider).keypair!.public);
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
    ref.read,
    NftListModel(page: 0, data: CliPaginatedResponse.empty()),
  ),
);
