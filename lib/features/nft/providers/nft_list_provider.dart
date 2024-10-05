import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';

import '../../../core/models/paginated_response.dart';
import '../models/nft.dart';
import '../services/nft_service.dart';

class NftListModel {
  final int page;
  final String search;
  final String currentSearch;
  final CliPaginatedResponse<Nft> data;

  const NftListModel({required this.page, required this.data, this.search = "", this.currentSearch = ""});

  NftListModel copyWith({
    int? page,
    CliPaginatedResponse<Nft>? data,
    String? search,
    String? currentSearch,
  }) {
    return NftListModel(
      page: page ?? this.page,
      data: data ?? this.data,
      search: search ?? this.search,
      currentSearch: currentSearch ?? this.currentSearch,
    );
  }
}

class NftListProvider extends StateNotifier<NftListModel> {
  final Ref ref;
  final dynamic refresh;

  final TextEditingController searchController = TextEditingController();

  NftListProvider(
    this.ref,
    this.refresh,
    NftListModel model,
  ) : super(model);

  Future<void> load(int page, [String? address]) async {
    // email ??= ref.read(webSessionProvider).keypair?.email;
    // address ??= ref.read(webSessionProvider).keypair?.address;

    print("LOADING NFTListProvider");
    print(address);
    if (kIsWeb) {
      if (address == null) {
        return;
      }

      print("Hello");

      final nfts = await ExplorerService().listNfts(address, page: page, search: state.search.isNotEmpty ? state.search : null);
      final d = CliPaginatedResponse(count: nfts.length, results: nfts, page: page);
      state = state.copyWith(data: d, page: page, currentSearch: state.search);
      return;
    }
    final data = await NftService().list(page, search: state.search);

    state = state.copyWith(data: data, page: page, currentSearch: state.search);
  }

  Future<void> reloadCurrentPage({String? address}) async {
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

final nftListProvider = StateNotifierProvider<NftListProvider, NftListModel>(
  (ref) => NftListProvider(ref, ref.refresh, NftListModel(page: kIsWeb ? 1 : 0, data: CliPaginatedResponse.empty())),
);
