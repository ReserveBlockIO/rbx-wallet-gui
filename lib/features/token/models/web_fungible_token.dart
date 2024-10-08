import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_fungible_token.freezed.dart';
part 'web_fungible_token.g.dart';

@freezed
class WebFungibleToken with _$WebFungibleToken {
  const WebFungibleToken._();

  const factory WebFungibleToken({
    @JsonKey(name: "sc_identifier") required String smartContractId,
    required String name,
    required String ticker,
    @JsonKey(name: "owner_address") required String ownerAddress,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "can_mint") required bool canMint,
    @JsonKey(name: "can_burn") required bool canBurn,
    @JsonKey(name: "can_vote") required bool canVote,
    @JsonKey(name: "is_paused") required bool isPaused,
    @JsonKey(name: "circulating_supply") required double circulatingSupply,
    @JsonKey(name: "initial_supply") required double initialSupply,
    @JsonKey(name: "banned_addresses") required List<String> bannedAddresses,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _WebFungibleToken;

  factory WebFungibleToken.fromJson(Map<String, dynamic> json) => _$WebFungibleTokenFromJson(json);

  String get label {
    return "[$ticker] $name${isPaused ? ' (PAUSED)' : ''}";
  }
}

class WebFungibleTokenBalance {
  final WebFungibleToken token;
  final String address;
  final double balance;

  const WebFungibleTokenBalance({
    required this.token,
    required this.address,
    required this.balance,
  });
}

class WebFungibleTokenDetail {
  final WebFungibleToken token;
  final Map<String, dynamic> holders;

  const WebFungibleTokenDetail({
    required this.token,
    required this.holders,
  });
}
