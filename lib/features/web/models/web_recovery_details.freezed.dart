// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_recovery_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebRecoveryDetails _$WebRecoveryDetailsFromJson(Map<String, dynamic> json) {
  return _WebRecoveryDetails.fromJson(json);
}

/// @nodoc
mixin _$WebRecoveryDetails {
  @JsonKey(name: "original_address")
  String get originalAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "new_address")
  String get newAddress => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "outstanding_transactions")
  List<WebTransaction>? get outstandingTransactions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebRecoveryDetailsCopyWith<WebRecoveryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebRecoveryDetailsCopyWith<$Res> {
  factory $WebRecoveryDetailsCopyWith(
          WebRecoveryDetails value, $Res Function(WebRecoveryDetails) then) =
      _$WebRecoveryDetailsCopyWithImpl<$Res, WebRecoveryDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "original_address")
          String originalAddress,
      @JsonKey(name: "new_address")
          String newAddress,
      double amount,
      @JsonKey(name: "outstanding_transactions")
          List<WebTransaction>? outstandingTransactions});
}

/// @nodoc
class _$WebRecoveryDetailsCopyWithImpl<$Res, $Val extends WebRecoveryDetails>
    implements $WebRecoveryDetailsCopyWith<$Res> {
  _$WebRecoveryDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAddress = null,
    Object? newAddress = null,
    Object? amount = null,
    Object? outstandingTransactions = freezed,
  }) {
    return _then(_value.copyWith(
      originalAddress: null == originalAddress
          ? _value.originalAddress
          : originalAddress // ignore: cast_nullable_to_non_nullable
              as String,
      newAddress: null == newAddress
          ? _value.newAddress
          : newAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingTransactions: freezed == outstandingTransactions
          ? _value.outstandingTransactions
          : outstandingTransactions // ignore: cast_nullable_to_non_nullable
              as List<WebTransaction>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebRecoveryDetailsCopyWith<$Res>
    implements $WebRecoveryDetailsCopyWith<$Res> {
  factory _$$_WebRecoveryDetailsCopyWith(_$_WebRecoveryDetails value,
          $Res Function(_$_WebRecoveryDetails) then) =
      __$$_WebRecoveryDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "original_address")
          String originalAddress,
      @JsonKey(name: "new_address")
          String newAddress,
      double amount,
      @JsonKey(name: "outstanding_transactions")
          List<WebTransaction>? outstandingTransactions});
}

/// @nodoc
class __$$_WebRecoveryDetailsCopyWithImpl<$Res>
    extends _$WebRecoveryDetailsCopyWithImpl<$Res, _$_WebRecoveryDetails>
    implements _$$_WebRecoveryDetailsCopyWith<$Res> {
  __$$_WebRecoveryDetailsCopyWithImpl(
      _$_WebRecoveryDetails _value, $Res Function(_$_WebRecoveryDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAddress = null,
    Object? newAddress = null,
    Object? amount = null,
    Object? outstandingTransactions = freezed,
  }) {
    return _then(_$_WebRecoveryDetails(
      originalAddress: null == originalAddress
          ? _value.originalAddress
          : originalAddress // ignore: cast_nullable_to_non_nullable
              as String,
      newAddress: null == newAddress
          ? _value.newAddress
          : newAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingTransactions: freezed == outstandingTransactions
          ? _value._outstandingTransactions
          : outstandingTransactions // ignore: cast_nullable_to_non_nullable
              as List<WebTransaction>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebRecoveryDetails extends _WebRecoveryDetails {
  _$_WebRecoveryDetails(
      {@JsonKey(name: "original_address")
          required this.originalAddress,
      @JsonKey(name: "new_address")
          required this.newAddress,
      this.amount = 0,
      @JsonKey(name: "outstanding_transactions")
          final List<WebTransaction>? outstandingTransactions})
      : _outstandingTransactions = outstandingTransactions,
        super._();

  factory _$_WebRecoveryDetails.fromJson(Map<String, dynamic> json) =>
      _$$_WebRecoveryDetailsFromJson(json);

  @override
  @JsonKey(name: "original_address")
  final String originalAddress;
  @override
  @JsonKey(name: "new_address")
  final String newAddress;
  @override
  @JsonKey()
  final double amount;
  final List<WebTransaction>? _outstandingTransactions;
  @override
  @JsonKey(name: "outstanding_transactions")
  List<WebTransaction>? get outstandingTransactions {
    final value = _outstandingTransactions;
    if (value == null) return null;
    if (_outstandingTransactions is EqualUnmodifiableListView)
      return _outstandingTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WebRecoveryDetails(originalAddress: $originalAddress, newAddress: $newAddress, amount: $amount, outstandingTransactions: $outstandingTransactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebRecoveryDetails &&
            (identical(other.originalAddress, originalAddress) ||
                other.originalAddress == originalAddress) &&
            (identical(other.newAddress, newAddress) ||
                other.newAddress == newAddress) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(
                other._outstandingTransactions, _outstandingTransactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, originalAddress, newAddress,
      amount, const DeepCollectionEquality().hash(_outstandingTransactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebRecoveryDetailsCopyWith<_$_WebRecoveryDetails> get copyWith =>
      __$$_WebRecoveryDetailsCopyWithImpl<_$_WebRecoveryDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebRecoveryDetailsToJson(
      this,
    );
  }
}

abstract class _WebRecoveryDetails extends WebRecoveryDetails {
  factory _WebRecoveryDetails(
          {@JsonKey(name: "original_address")
              required final String originalAddress,
          @JsonKey(name: "new_address")
              required final String newAddress,
          final double amount,
          @JsonKey(name: "outstanding_transactions")
              final List<WebTransaction>? outstandingTransactions}) =
      _$_WebRecoveryDetails;
  _WebRecoveryDetails._() : super._();

  factory _WebRecoveryDetails.fromJson(Map<String, dynamic> json) =
      _$_WebRecoveryDetails.fromJson;

  @override
  @JsonKey(name: "original_address")
  String get originalAddress;
  @override
  @JsonKey(name: "new_address")
  String get newAddress;
  @override
  double get amount;
  @override
  @JsonKey(name: "outstanding_transactions")
  List<WebTransaction>? get outstandingTransactions;
  @override
  @JsonKey(ignore: true)
  _$$_WebRecoveryDetailsCopyWith<_$_WebRecoveryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
