import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bid.dart';
import '../services/dst_service.dart';

class SellerBidListProvider extends StateNotifier<List<Bid>> {
  final Ref ref;
  final String identifier;
  late final int listingId;
  late final int collectionId;

  SellerBidListProvider(this.ref, this.identifier) : super([]) {
    final parts = identifier.split("_").map((p) => int.tryParse(p)).where((p) => p != null).toList();

    if (parts.length != 2) {
      print("Invalid identifier $identifier");
      return;
    }

    collectionId = parts.first!;
    listingId = parts.last!;

    fetchBids();
  }

  Future<List<Bid>> fetchBids() async {
    final bids = await DstService().listSellerBids(listingId);
    bids.sort((a, b) => a.bidSendTime > b.bidSendTime ? -1 : 1);

    state = bids;
    return bids;
  }
}

final sellerBidListProvider = StateNotifierProvider.family<SellerBidListProvider, List<Bid>, String>((ref, identifier) {
  return SellerBidListProvider(ref, identifier);
});
