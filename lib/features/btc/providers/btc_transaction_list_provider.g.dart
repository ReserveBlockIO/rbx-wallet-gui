// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_transaction_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$btcTransactionListHash() =>
    r'5bb3c12b02748427ed9ed176de57bed76957dc53';

/// See also [BtcTransactionList].
@ProviderFor(BtcTransactionList)
final btcTransactionListProvider =
    NotifierProvider<BtcTransactionList, List<BtcTransaction>>.internal(
  BtcTransactionList.new,
  name: r'btcTransactionListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$btcTransactionListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BtcTransactionList = Notifier<List<BtcTransaction>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
