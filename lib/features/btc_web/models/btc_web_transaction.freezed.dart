// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_web_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BtcWebTransaction _$BtcWebTransactionFromJson(Map<String, dynamic> json) {
  return _BtcWebTransaction.fromJson(json);
}

/// @nodoc
mixin _$BtcWebTransaction {
  String get txid =>
      throw _privateConstructorUsedError; // required int version,
// required int locktime,
  List<BtcWebVin> get vin => throw _privateConstructorUsedError;
  List<BtcWebVout> get vout => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  int get fee => throw _privateConstructorUsedError;
  BtcWebTxStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWebTransactionCopyWith<BtcWebTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWebTransactionCopyWith<$Res> {
  factory $BtcWebTransactionCopyWith(
          BtcWebTransaction value, $Res Function(BtcWebTransaction) then) =
      _$BtcWebTransactionCopyWithImpl<$Res, BtcWebTransaction>;
  @useResult
  $Res call(
      {String txid,
      List<BtcWebVin> vin,
      List<BtcWebVout> vout,
      int size,
      int weight,
      int fee,
      BtcWebTxStatus status});

  $BtcWebTxStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$BtcWebTransactionCopyWithImpl<$Res, $Val extends BtcWebTransaction>
    implements $BtcWebTransactionCopyWith<$Res> {
  _$BtcWebTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? vin = null,
    Object? vout = null,
    Object? size = null,
    Object? weight = null,
    Object? fee = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      txid: null == txid
          ? _value.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as String,
      vin: null == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as List<BtcWebVin>,
      vout: null == vout
          ? _value.vout
          : vout // ignore: cast_nullable_to_non_nullable
              as List<BtcWebVout>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BtcWebTxStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BtcWebTxStatusCopyWith<$Res> get status {
    return $BtcWebTxStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BtcWebTransactionCopyWith<$Res>
    implements $BtcWebTransactionCopyWith<$Res> {
  factory _$$_BtcWebTransactionCopyWith(_$_BtcWebTransaction value,
          $Res Function(_$_BtcWebTransaction) then) =
      __$$_BtcWebTransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String txid,
      List<BtcWebVin> vin,
      List<BtcWebVout> vout,
      int size,
      int weight,
      int fee,
      BtcWebTxStatus status});

  @override
  $BtcWebTxStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_BtcWebTransactionCopyWithImpl<$Res>
    extends _$BtcWebTransactionCopyWithImpl<$Res, _$_BtcWebTransaction>
    implements _$$_BtcWebTransactionCopyWith<$Res> {
  __$$_BtcWebTransactionCopyWithImpl(
      _$_BtcWebTransaction _value, $Res Function(_$_BtcWebTransaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? vin = null,
    Object? vout = null,
    Object? size = null,
    Object? weight = null,
    Object? fee = null,
    Object? status = null,
  }) {
    return _then(_$_BtcWebTransaction(
      txid: null == txid
          ? _value.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as String,
      vin: null == vin
          ? _value._vin
          : vin // ignore: cast_nullable_to_non_nullable
              as List<BtcWebVin>,
      vout: null == vout
          ? _value._vout
          : vout // ignore: cast_nullable_to_non_nullable
              as List<BtcWebVout>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BtcWebTxStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWebTransaction extends _BtcWebTransaction {
  _$_BtcWebTransaction(
      {required this.txid,
      required final List<BtcWebVin> vin,
      required final List<BtcWebVout> vout,
      required this.size,
      required this.weight,
      required this.fee,
      required this.status})
      : _vin = vin,
        _vout = vout,
        super._();

  factory _$_BtcWebTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWebTransactionFromJson(json);

  @override
  final String txid;
// required int version,
// required int locktime,
  final List<BtcWebVin> _vin;
// required int version,
// required int locktime,
  @override
  List<BtcWebVin> get vin {
    if (_vin is EqualUnmodifiableListView) return _vin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vin);
  }

  final List<BtcWebVout> _vout;
  @override
  List<BtcWebVout> get vout {
    if (_vout is EqualUnmodifiableListView) return _vout;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vout);
  }

  @override
  final int size;
  @override
  final int weight;
  @override
  final int fee;
  @override
  final BtcWebTxStatus status;

  @override
  String toString() {
    return 'BtcWebTransaction(txid: $txid, vin: $vin, vout: $vout, size: $size, weight: $weight, fee: $fee, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWebTransaction &&
            (identical(other.txid, txid) || other.txid == txid) &&
            const DeepCollectionEquality().equals(other._vin, _vin) &&
            const DeepCollectionEquality().equals(other._vout, _vout) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      txid,
      const DeepCollectionEquality().hash(_vin),
      const DeepCollectionEquality().hash(_vout),
      size,
      weight,
      fee,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWebTransactionCopyWith<_$_BtcWebTransaction> get copyWith =>
      __$$_BtcWebTransactionCopyWithImpl<_$_BtcWebTransaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWebTransactionToJson(
      this,
    );
  }
}

abstract class _BtcWebTransaction extends BtcWebTransaction {
  factory _BtcWebTransaction(
      {required final String txid,
      required final List<BtcWebVin> vin,
      required final List<BtcWebVout> vout,
      required final int size,
      required final int weight,
      required final int fee,
      required final BtcWebTxStatus status}) = _$_BtcWebTransaction;
  _BtcWebTransaction._() : super._();

  factory _BtcWebTransaction.fromJson(Map<String, dynamic> json) =
      _$_BtcWebTransaction.fromJson;

  @override
  String get txid;
  @override // required int version,
// required int locktime,
  List<BtcWebVin> get vin;
  @override
  List<BtcWebVout> get vout;
  @override
  int get size;
  @override
  int get weight;
  @override
  int get fee;
  @override
  BtcWebTxStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWebTransactionCopyWith<_$_BtcWebTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

BtcWebVin _$BtcWebVinFromJson(Map<String, dynamic> json) {
  return _BtcWebVin.fromJson(json);
}

/// @nodoc
mixin _$BtcWebVin {
  String get txid => throw _privateConstructorUsedError;
  int get vout => throw _privateConstructorUsedError;
  BtcWebVout get prevout =>
      throw _privateConstructorUsedError; // required String scriptsig,
// @JsonKey(name: 'scriptsig_asm') required String scriptsigAsm,
// required List<String> witness,
// @JsonKey(name: 'is_coinbase') required bool isCoinbase,
  int get sequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWebVinCopyWith<BtcWebVin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWebVinCopyWith<$Res> {
  factory $BtcWebVinCopyWith(BtcWebVin value, $Res Function(BtcWebVin) then) =
      _$BtcWebVinCopyWithImpl<$Res, BtcWebVin>;
  @useResult
  $Res call({String txid, int vout, BtcWebVout prevout, int sequence});

  $BtcWebVoutCopyWith<$Res> get prevout;
}

/// @nodoc
class _$BtcWebVinCopyWithImpl<$Res, $Val extends BtcWebVin>
    implements $BtcWebVinCopyWith<$Res> {
  _$BtcWebVinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? vout = null,
    Object? prevout = null,
    Object? sequence = null,
  }) {
    return _then(_value.copyWith(
      txid: null == txid
          ? _value.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as String,
      vout: null == vout
          ? _value.vout
          : vout // ignore: cast_nullable_to_non_nullable
              as int,
      prevout: null == prevout
          ? _value.prevout
          : prevout // ignore: cast_nullable_to_non_nullable
              as BtcWebVout,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BtcWebVoutCopyWith<$Res> get prevout {
    return $BtcWebVoutCopyWith<$Res>(_value.prevout, (value) {
      return _then(_value.copyWith(prevout: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BtcWebVinCopyWith<$Res> implements $BtcWebVinCopyWith<$Res> {
  factory _$$_BtcWebVinCopyWith(
          _$_BtcWebVin value, $Res Function(_$_BtcWebVin) then) =
      __$$_BtcWebVinCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String txid, int vout, BtcWebVout prevout, int sequence});

  @override
  $BtcWebVoutCopyWith<$Res> get prevout;
}

/// @nodoc
class __$$_BtcWebVinCopyWithImpl<$Res>
    extends _$BtcWebVinCopyWithImpl<$Res, _$_BtcWebVin>
    implements _$$_BtcWebVinCopyWith<$Res> {
  __$$_BtcWebVinCopyWithImpl(
      _$_BtcWebVin _value, $Res Function(_$_BtcWebVin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? vout = null,
    Object? prevout = null,
    Object? sequence = null,
  }) {
    return _then(_$_BtcWebVin(
      txid: null == txid
          ? _value.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as String,
      vout: null == vout
          ? _value.vout
          : vout // ignore: cast_nullable_to_non_nullable
              as int,
      prevout: null == prevout
          ? _value.prevout
          : prevout // ignore: cast_nullable_to_non_nullable
              as BtcWebVout,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWebVin implements _BtcWebVin {
  const _$_BtcWebVin(
      {required this.txid,
      required this.vout,
      required this.prevout,
      required this.sequence});

  factory _$_BtcWebVin.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWebVinFromJson(json);

  @override
  final String txid;
  @override
  final int vout;
  @override
  final BtcWebVout prevout;
// required String scriptsig,
// @JsonKey(name: 'scriptsig_asm') required String scriptsigAsm,
// required List<String> witness,
// @JsonKey(name: 'is_coinbase') required bool isCoinbase,
  @override
  final int sequence;

  @override
  String toString() {
    return 'BtcWebVin(txid: $txid, vout: $vout, prevout: $prevout, sequence: $sequence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWebVin &&
            (identical(other.txid, txid) || other.txid == txid) &&
            (identical(other.vout, vout) || other.vout == vout) &&
            (identical(other.prevout, prevout) || other.prevout == prevout) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, txid, vout, prevout, sequence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWebVinCopyWith<_$_BtcWebVin> get copyWith =>
      __$$_BtcWebVinCopyWithImpl<_$_BtcWebVin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWebVinToJson(
      this,
    );
  }
}

abstract class _BtcWebVin implements BtcWebVin {
  const factory _BtcWebVin(
      {required final String txid,
      required final int vout,
      required final BtcWebVout prevout,
      required final int sequence}) = _$_BtcWebVin;

  factory _BtcWebVin.fromJson(Map<String, dynamic> json) =
      _$_BtcWebVin.fromJson;

  @override
  String get txid;
  @override
  int get vout;
  @override
  BtcWebVout get prevout;
  @override // required String scriptsig,
// @JsonKey(name: 'scriptsig_asm') required String scriptsigAsm,
// required List<String> witness,
// @JsonKey(name: 'is_coinbase') required bool isCoinbase,
  int get sequence;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWebVinCopyWith<_$_BtcWebVin> get copyWith =>
      throw _privateConstructorUsedError;
}

BtcWebVout _$BtcWebVoutFromJson(Map<String, dynamic> json) {
  return _BtcWebVout.fromJson(json);
}

/// @nodoc
mixin _$BtcWebVout {
  String get scriptpubkey => throw _privateConstructorUsedError;
  @JsonKey(name: 'scriptpubkey_asm')
  String get scriptpubkeyAsm => throw _privateConstructorUsedError;
  @JsonKey(name: 'scriptpubkey_type')
  String get scriptpubkeyType => throw _privateConstructorUsedError;
  @JsonKey(name: 'scriptpubkey_address')
  String get scriptpubkeyAddress => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWebVoutCopyWith<BtcWebVout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWebVoutCopyWith<$Res> {
  factory $BtcWebVoutCopyWith(
          BtcWebVout value, $Res Function(BtcWebVout) then) =
      _$BtcWebVoutCopyWithImpl<$Res, BtcWebVout>;
  @useResult
  $Res call(
      {String scriptpubkey,
      @JsonKey(name: 'scriptpubkey_asm') String scriptpubkeyAsm,
      @JsonKey(name: 'scriptpubkey_type') String scriptpubkeyType,
      @JsonKey(name: 'scriptpubkey_address') String scriptpubkeyAddress,
      int value});
}

/// @nodoc
class _$BtcWebVoutCopyWithImpl<$Res, $Val extends BtcWebVout>
    implements $BtcWebVoutCopyWith<$Res> {
  _$BtcWebVoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scriptpubkey = null,
    Object? scriptpubkeyAsm = null,
    Object? scriptpubkeyType = null,
    Object? scriptpubkeyAddress = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      scriptpubkey: null == scriptpubkey
          ? _value.scriptpubkey
          : scriptpubkey // ignore: cast_nullable_to_non_nullable
              as String,
      scriptpubkeyAsm: null == scriptpubkeyAsm
          ? _value.scriptpubkeyAsm
          : scriptpubkeyAsm // ignore: cast_nullable_to_non_nullable
              as String,
      scriptpubkeyType: null == scriptpubkeyType
          ? _value.scriptpubkeyType
          : scriptpubkeyType // ignore: cast_nullable_to_non_nullable
              as String,
      scriptpubkeyAddress: null == scriptpubkeyAddress
          ? _value.scriptpubkeyAddress
          : scriptpubkeyAddress // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcWebVoutCopyWith<$Res>
    implements $BtcWebVoutCopyWith<$Res> {
  factory _$$_BtcWebVoutCopyWith(
          _$_BtcWebVout value, $Res Function(_$_BtcWebVout) then) =
      __$$_BtcWebVoutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String scriptpubkey,
      @JsonKey(name: 'scriptpubkey_asm') String scriptpubkeyAsm,
      @JsonKey(name: 'scriptpubkey_type') String scriptpubkeyType,
      @JsonKey(name: 'scriptpubkey_address') String scriptpubkeyAddress,
      int value});
}

/// @nodoc
class __$$_BtcWebVoutCopyWithImpl<$Res>
    extends _$BtcWebVoutCopyWithImpl<$Res, _$_BtcWebVout>
    implements _$$_BtcWebVoutCopyWith<$Res> {
  __$$_BtcWebVoutCopyWithImpl(
      _$_BtcWebVout _value, $Res Function(_$_BtcWebVout) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scriptpubkey = null,
    Object? scriptpubkeyAsm = null,
    Object? scriptpubkeyType = null,
    Object? scriptpubkeyAddress = null,
    Object? value = null,
  }) {
    return _then(_$_BtcWebVout(
      scriptpubkey: null == scriptpubkey
          ? _value.scriptpubkey
          : scriptpubkey // ignore: cast_nullable_to_non_nullable
              as String,
      scriptpubkeyAsm: null == scriptpubkeyAsm
          ? _value.scriptpubkeyAsm
          : scriptpubkeyAsm // ignore: cast_nullable_to_non_nullable
              as String,
      scriptpubkeyType: null == scriptpubkeyType
          ? _value.scriptpubkeyType
          : scriptpubkeyType // ignore: cast_nullable_to_non_nullable
              as String,
      scriptpubkeyAddress: null == scriptpubkeyAddress
          ? _value.scriptpubkeyAddress
          : scriptpubkeyAddress // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWebVout implements _BtcWebVout {
  const _$_BtcWebVout(
      {required this.scriptpubkey,
      @JsonKey(name: 'scriptpubkey_asm') required this.scriptpubkeyAsm,
      @JsonKey(name: 'scriptpubkey_type') required this.scriptpubkeyType,
      @JsonKey(name: 'scriptpubkey_address') required this.scriptpubkeyAddress,
      required this.value});

  factory _$_BtcWebVout.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWebVoutFromJson(json);

  @override
  final String scriptpubkey;
  @override
  @JsonKey(name: 'scriptpubkey_asm')
  final String scriptpubkeyAsm;
  @override
  @JsonKey(name: 'scriptpubkey_type')
  final String scriptpubkeyType;
  @override
  @JsonKey(name: 'scriptpubkey_address')
  final String scriptpubkeyAddress;
  @override
  final int value;

  @override
  String toString() {
    return 'BtcWebVout(scriptpubkey: $scriptpubkey, scriptpubkeyAsm: $scriptpubkeyAsm, scriptpubkeyType: $scriptpubkeyType, scriptpubkeyAddress: $scriptpubkeyAddress, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWebVout &&
            (identical(other.scriptpubkey, scriptpubkey) ||
                other.scriptpubkey == scriptpubkey) &&
            (identical(other.scriptpubkeyAsm, scriptpubkeyAsm) ||
                other.scriptpubkeyAsm == scriptpubkeyAsm) &&
            (identical(other.scriptpubkeyType, scriptpubkeyType) ||
                other.scriptpubkeyType == scriptpubkeyType) &&
            (identical(other.scriptpubkeyAddress, scriptpubkeyAddress) ||
                other.scriptpubkeyAddress == scriptpubkeyAddress) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, scriptpubkey, scriptpubkeyAsm,
      scriptpubkeyType, scriptpubkeyAddress, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWebVoutCopyWith<_$_BtcWebVout> get copyWith =>
      __$$_BtcWebVoutCopyWithImpl<_$_BtcWebVout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWebVoutToJson(
      this,
    );
  }
}

abstract class _BtcWebVout implements BtcWebVout {
  const factory _BtcWebVout(
      {required final String scriptpubkey,
      @JsonKey(name: 'scriptpubkey_asm')
          required final String scriptpubkeyAsm,
      @JsonKey(name: 'scriptpubkey_type')
          required final String scriptpubkeyType,
      @JsonKey(name: 'scriptpubkey_address')
          required final String scriptpubkeyAddress,
      required final int value}) = _$_BtcWebVout;

  factory _BtcWebVout.fromJson(Map<String, dynamic> json) =
      _$_BtcWebVout.fromJson;

  @override
  String get scriptpubkey;
  @override
  @JsonKey(name: 'scriptpubkey_asm')
  String get scriptpubkeyAsm;
  @override
  @JsonKey(name: 'scriptpubkey_type')
  String get scriptpubkeyType;
  @override
  @JsonKey(name: 'scriptpubkey_address')
  String get scriptpubkeyAddress;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWebVoutCopyWith<_$_BtcWebVout> get copyWith =>
      throw _privateConstructorUsedError;
}

BtcWebTxStatus _$BtcWebTxStatusFromJson(Map<String, dynamic> json) {
  return _BtcWebTxStatus.fromJson(json);
}

/// @nodoc
mixin _$BtcWebTxStatus {
  bool get confirmed => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_height')
  int? get blockHeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_hash')
  String? get blockHash => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_time')
  int? get blockTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWebTxStatusCopyWith<BtcWebTxStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWebTxStatusCopyWith<$Res> {
  factory $BtcWebTxStatusCopyWith(
          BtcWebTxStatus value, $Res Function(BtcWebTxStatus) then) =
      _$BtcWebTxStatusCopyWithImpl<$Res, BtcWebTxStatus>;
  @useResult
  $Res call(
      {bool confirmed,
      @JsonKey(name: 'block_height') int? blockHeight,
      @JsonKey(name: 'block_hash') String? blockHash,
      @JsonKey(name: 'block_time') int? blockTime});
}

/// @nodoc
class _$BtcWebTxStatusCopyWithImpl<$Res, $Val extends BtcWebTxStatus>
    implements $BtcWebTxStatusCopyWith<$Res> {
  _$BtcWebTxStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmed = null,
    Object? blockHeight = freezed,
    Object? blockHash = freezed,
    Object? blockTime = freezed,
  }) {
    return _then(_value.copyWith(
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      blockHeight: freezed == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      blockHash: freezed == blockHash
          ? _value.blockHash
          : blockHash // ignore: cast_nullable_to_non_nullable
              as String?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcWebTxStatusCopyWith<$Res>
    implements $BtcWebTxStatusCopyWith<$Res> {
  factory _$$_BtcWebTxStatusCopyWith(
          _$_BtcWebTxStatus value, $Res Function(_$_BtcWebTxStatus) then) =
      __$$_BtcWebTxStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool confirmed,
      @JsonKey(name: 'block_height') int? blockHeight,
      @JsonKey(name: 'block_hash') String? blockHash,
      @JsonKey(name: 'block_time') int? blockTime});
}

/// @nodoc
class __$$_BtcWebTxStatusCopyWithImpl<$Res>
    extends _$BtcWebTxStatusCopyWithImpl<$Res, _$_BtcWebTxStatus>
    implements _$$_BtcWebTxStatusCopyWith<$Res> {
  __$$_BtcWebTxStatusCopyWithImpl(
      _$_BtcWebTxStatus _value, $Res Function(_$_BtcWebTxStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmed = null,
    Object? blockHeight = freezed,
    Object? blockHash = freezed,
    Object? blockTime = freezed,
  }) {
    return _then(_$_BtcWebTxStatus(
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      blockHeight: freezed == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      blockHash: freezed == blockHash
          ? _value.blockHash
          : blockHash // ignore: cast_nullable_to_non_nullable
              as String?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWebTxStatus implements _BtcWebTxStatus {
  const _$_BtcWebTxStatus(
      {required this.confirmed,
      @JsonKey(name: 'block_height') this.blockHeight,
      @JsonKey(name: 'block_hash') this.blockHash,
      @JsonKey(name: 'block_time') this.blockTime});

  factory _$_BtcWebTxStatus.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWebTxStatusFromJson(json);

  @override
  final bool confirmed;
  @override
  @JsonKey(name: 'block_height')
  final int? blockHeight;
  @override
  @JsonKey(name: 'block_hash')
  final String? blockHash;
  @override
  @JsonKey(name: 'block_time')
  final int? blockTime;

  @override
  String toString() {
    return 'BtcWebTxStatus(confirmed: $confirmed, blockHeight: $blockHeight, blockHash: $blockHash, blockTime: $blockTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWebTxStatus &&
            (identical(other.confirmed, confirmed) ||
                other.confirmed == confirmed) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.blockHash, blockHash) ||
                other.blockHash == blockHash) &&
            (identical(other.blockTime, blockTime) ||
                other.blockTime == blockTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, confirmed, blockHeight, blockHash, blockTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWebTxStatusCopyWith<_$_BtcWebTxStatus> get copyWith =>
      __$$_BtcWebTxStatusCopyWithImpl<_$_BtcWebTxStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWebTxStatusToJson(
      this,
    );
  }
}

abstract class _BtcWebTxStatus implements BtcWebTxStatus {
  const factory _BtcWebTxStatus(
      {required final bool confirmed,
      @JsonKey(name: 'block_height') final int? blockHeight,
      @JsonKey(name: 'block_hash') final String? blockHash,
      @JsonKey(name: 'block_time') final int? blockTime}) = _$_BtcWebTxStatus;

  factory _BtcWebTxStatus.fromJson(Map<String, dynamic> json) =
      _$_BtcWebTxStatus.fromJson;

  @override
  bool get confirmed;
  @override
  @JsonKey(name: 'block_height')
  int? get blockHeight;
  @override
  @JsonKey(name: 'block_hash')
  String? get blockHash;
  @override
  @JsonKey(name: 'block_time')
  int? get blockTime;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWebTxStatusCopyWith<_$_BtcWebTxStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
