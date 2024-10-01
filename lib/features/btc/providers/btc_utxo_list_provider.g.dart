// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_utxo_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$btcUtxoListHash() => r'c46a056b5379ee6ff97c27b579682d7fd8d13bdc';

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

abstract class _$BtcUtxoList extends BuildlessNotifier<List<BtcUtxo>> {
  late final String address;

  List<BtcUtxo> build(
    String address,
  );
}

/// See also [BtcUtxoList].
@ProviderFor(BtcUtxoList)
const btcUtxoListProvider = BtcUtxoListFamily();

/// See also [BtcUtxoList].
class BtcUtxoListFamily extends Family<List<BtcUtxo>> {
  /// See also [BtcUtxoList].
  const BtcUtxoListFamily();

  /// See also [BtcUtxoList].
  BtcUtxoListProvider call(
    String address,
  ) {
    return BtcUtxoListProvider(
      address,
    );
  }

  @override
  BtcUtxoListProvider getProviderOverride(
    covariant BtcUtxoListProvider provider,
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
  String? get name => r'btcUtxoListProvider';
}

/// See also [BtcUtxoList].
class BtcUtxoListProvider
    extends NotifierProviderImpl<BtcUtxoList, List<BtcUtxo>> {
  /// See also [BtcUtxoList].
  BtcUtxoListProvider(
    this.address,
  ) : super.internal(
          () => BtcUtxoList()..address = address,
          from: btcUtxoListProvider,
          name: r'btcUtxoListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$btcUtxoListHash,
          dependencies: BtcUtxoListFamily._dependencies,
          allTransitiveDependencies:
              BtcUtxoListFamily._allTransitiveDependencies,
        );

  final String address;

  @override
  bool operator ==(Object other) {
    return other is BtcUtxoListProvider && other.address == address;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<BtcUtxo> runNotifierBuild(
    covariant BtcUtxoList notifier,
  ) {
    return notifier.build(
      address,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
