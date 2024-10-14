import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/providers/session_provider.dart';
import '../../nft/models/nft.dart';

part 'token_account.freezed.dart';
part 'token_account.g.dart';

@freezed
class TokenAccount with _$TokenAccount {
  const TokenAccount._();

  const factory TokenAccount({
    @JsonKey(name: "SmartContractUID") required String smartContractId,
    @JsonKey(name: "TokenName") required String name,
    @JsonKey(name: "TokenTicker") required String ticker,
    @JsonKey(name: "Balance") required double balance,
    @JsonKey(name: "LockedBalance") required double lockedBalance,
    @JsonKey(name: "DecimalPlaces") required int decimalPlaces,
  }) = _TokenAccount;

  factory TokenAccount.fromJson(Map<String, dynamic> json) => _$TokenAccountFromJson(json);

  String get label {
    return "[$ticker] $name";
  }

  static TokenAccount? fromNft(Nft nft, WidgetRef ref) {
    if (nft.isToken) {
      final details = nft.tokenDetails;
      if (details != null) {
        double balance = 0.0;
        double lockedBalance = 0.0;

        for (final b in ref.read(sessionProvider).balances) {
          for (final t in b.tokens) {
            if (t.smartContractId == nft.id) {
              balance = t.balance;
              lockedBalance = t.lockedBalance;
            }
          }
        }

        return TokenAccount(
          smartContractId: nft.id,
          name: details.name,
          ticker: details.ticker,
          balance: balance,
          lockedBalance: lockedBalance,
          decimalPlaces: details.decimalPlaces,
        );
      }
    }

    return null;
  }
}
