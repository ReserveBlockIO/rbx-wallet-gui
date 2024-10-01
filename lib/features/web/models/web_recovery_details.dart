import 'package:freezed_annotation/freezed_annotation.dart';
import '../../transactions/models/web_transaction.dart';

part 'web_recovery_details.freezed.dart';
part 'web_recovery_details.g.dart';

@freezed
abstract class WebRecoveryDetails with _$WebRecoveryDetails {
  const WebRecoveryDetails._();

  factory WebRecoveryDetails({
    @JsonKey(name: "original_address") required String originalAddress,
    @JsonKey(name: "new_address") required String newAddress,
    @Default(0) double amount,
    @JsonKey(name: "outstanding_transactions") List<WebTransaction>? outstandingTransactions,
  }) = _WebRecoveryDetails;

  factory WebRecoveryDetails.fromJson(Map<String, dynamic> json) => _$WebRecoveryDetailsFromJson(json);
}
