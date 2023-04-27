// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../core/services/explorer_service.dart';
// import '../models/nft.dart';

// class WebNftListProvider extends StateNotifier<List<Nft>> {
//   final Ref ref;

//   WebNftListProvider(
//     this.ref, [
//     List<Nft> nfts = const [],
//   ]) : super(nfts) {
//     load();
//   }

//   Future<void> load() async {
//     final nfts = await ExplorerService().listNfts();
//     state = nfts;
//   }
// }

// final webnftListProvider = StateNotifierProvider<WebNftListProvider, List<Nft>>(
//   (ref) => WebNftListProvider(ref),
// );
