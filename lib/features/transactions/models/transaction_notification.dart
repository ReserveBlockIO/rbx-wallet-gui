import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/theme/app_theme.dart';
import 'transaction.dart';

part 'transaction_notification.freezed.dart';

@freezed
class TransactionNotification with _$TransactionNotification {
  const TransactionNotification._();

  factory TransactionNotification({
    required String identifier,
    Transaction? transaction,
    required String title,
    String? body,
    IconData? icon,
    @Default(AppColorVariant.Success) AppColorVariant color,
  }) = _TransactionNotification;
}
