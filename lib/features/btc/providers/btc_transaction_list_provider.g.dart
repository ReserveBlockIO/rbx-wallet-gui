// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_transaction_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$btcTransactionListHash() =>
    r'240042a2e51326740eb5c210d40f53f599579cba';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$BtcTransactionList
    extends BuildlessNotifier<List<BtcTransaction>> {
  late final String address;

  List<BtcTransaction> build(
    String address,
  );
}

/// See also [BtcTransactionList].
@ProviderFor(BtcTransactionList)
const btcTransactionListProvider = BtcTransactionListFamily();

/// See also [BtcTransactionList].
class BtcTransactionListFamily extends Family<List<BtcTransaction>> {
  /// See also [BtcTransactionList].
  const BtcTransactionListFamily();

  /// See also [BtcTransactionList].
  BtcTransactionListProvider call(
    String address,
  ) {
    return BtcTransactionListProvider(
      address,
    );
  }

  @override
  BtcTransactionListProvider getProviderOverride(
    covariant BtcTransactionListProvider provider,
  ) {
    return call(
      provider.address,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'btcTransactionListProvider';
}

/// See also [BtcTransactionList].
class BtcTransactionListProvider
    extends NotifierProviderImpl<BtcTransactionList, List<BtcTransaction>> {
  /// See also [BtcTransactionList].
  BtcTransactionListProvider(
    this.address,
  ) : super.internal(
          () => BtcTransactionList()..address = address,
          from: btcTransactionListProvider,
          name: r'btcTransactionListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$btcTransactionListHash,
          dependencies: BtcTransactionListFamily._dependencies,
          allTransitiveDependencies:
              BtcTransactionListFamily._allTransitiveDependencies,
        );

  final String address;

  @override
  bool operator ==(Object other) {
    return other is BtcTransactionListProvider && other.address == address;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<BtcTransaction> runNotifierBuild(
    covariant BtcTransactionList notifier,
  ) {
    return notifier.build(
      address,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
