import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/models/paginated_response.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';

class MintedNftListProvider extends StateNotifier<NftListModel> {
  final Reader read;

  final TextEditingController searchController = TextEditingController();

  MintedNftListProvider(this.read, NftListModel model) : super(model) {
    load(1);
  }

  Future<void> load(int page) async {
    //TODO: make web work

    if (kIsWeb) {
      final nfts = await await TransactionService().listMintedNfts(read(webSessionProvider).keypair!.email, read(webSessionProvider).keypair!.public);
      final d = CliPaginatedResponse(count: nfts.length, results: nfts, page: 1);
      state = state.copyWith(data: d, page: 1, currentSearch: '');
      return;
    }

    // final nfts = kIsWeb
    //     ? (await TransactionService().listMintedNfts(read(webSessionProvider).keypair!.email, read(webSessionProvider).keypair!.public))
    //     : (await NftService().minted()).where((nft) => nft.manageable == true).toList();

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
