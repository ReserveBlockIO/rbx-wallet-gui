import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';

class TokenNftsProvider extends StateNotifier<Map<String, TokenScFeature>> {
  final Ref ref;

  TokenNftsProvider(this.ref) : super({});

  add(String scId, [bool forceUpdate = false]) async {
    if (!forceUpdate) {
      if (state.containsKey(scId)) {
        return;
      }
    }

    final nft = await NftService().getNftData(scId);

    if (nft != null) {
      final token = TokenScFeature.fromNft(nft);
      if (token != null) {
        state = {
          ...state,
          scId: token,
        };
      }
    }
  }
}

final tokenNftsProvider = StateNotifierProvider<TokenNftsProvider, Map<String, TokenScFeature>>(
  (ref) => TokenNftsProvider(ref),
);
