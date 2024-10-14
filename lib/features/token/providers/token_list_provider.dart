import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../nft/models/nft.dart';
import '../../nft/services/nft_service.dart';
import '../../../core/services/explorer_service.dart';

import '../../../core/models/paginated_response.dart';

class TokenListModel {
  final int page;
  final String search;
  final String currentSearch;
  final CliPaginatedResponse<Nft> data;

  const TokenListModel({required this.page, required this.data, this.search = "", this.currentSearch = ""});

  TokenListModel copyWith({
    int? page,
    CliPaginatedResponse<Nft>? data,
    String? search,
    String? currentSearch,
  }) {
    return TokenListModel(
      page: page ?? this.page,
      data: data ?? this.data,
      search: search ?? this.search,
      currentSearch: currentSearch ?? this.currentSearch,
    );
  }
}

class TokenListProvider extends StateNotifier<TokenListModel> {
  final Ref ref;
  final dynamic refresh;

  final TextEditingController searchController = TextEditingController();

  TokenListProvider(
    this.ref,
    this.refresh,
    TokenListModel model,
  ) : super(model) {
    load(1);
  }

  Future<void> load(int page) async {
    if (kIsWeb) {
      final address = ref.read(webSessionProvider).currentWallet?.address;

      if (address == null) {
        return;
      }

      final nfts = await ExplorerService().listNfts(address, page: page, search: state.search.isNotEmpty ? state.search : null);
      final d = CliPaginatedResponse(count: nfts.length, results: nfts, page: page);
      state = state.copyWith(data: d, page: page, currentSearch: state.search);
      return;
    }

    final data = await NftService().list(page, search: state.search, forTokens: true);
    state = state.copyWith(data: data, page: page, currentSearch: state.search);
  }

  Future<void> reloadCurrentPage({String? address}) async {
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

final tokenListProvider = StateNotifierProvider<TokenListProvider, TokenListModel>(
  (ref) => TokenListProvider(ref, ref.refresh, TokenListModel(page: kIsWeb ? 1 : 0, data: CliPaginatedResponse.empty())),
);
