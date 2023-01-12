import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';

part 'transaction_notification.freezed.dart';

@freezed
class TransactionNotification with _$TransactionNotification {
  const TransactionNotification._();

  factory TransactionNotification({
    required String identifier,
    Transaction? transaction,
    required String title,
    String? body,
    @Default(AppColorVariant.Success) AppColorVariant color,
  }) = _TransactionNotification;
}
