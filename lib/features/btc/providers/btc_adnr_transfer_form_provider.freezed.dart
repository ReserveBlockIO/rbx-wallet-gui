// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_adnr_transfer_form_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BtcAdnrTransferFormState {
  String? get fromBtcAddress => throw _privateConstructorUsedError;
  String? get domainName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BtcAdnrTransferFormStateCopyWith<BtcAdnrTransferFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcAdnrTransferFormStateCopyWith<$Res> {
  factory $BtcAdnrTransferFormStateCopyWith(BtcAdnrTransferFormState value,
          $Res Function(BtcAdnrTransferFormState) then) =
      _$BtcAdnrTransferFormStateCopyWithImpl<$Res, BtcAdnrTransferFormState>;
  @useResult
  $Res call({String? fromBtcAddress, String? domainName});
}

/// @nodoc
class _$BtcAdnrTransferFormStateCopyWithImpl<$Res,
        $Val extends BtcAdnrTransferFormState>
    implements $BtcAdnrTransferFormStateCopyWith<$Res> {
  _$BtcAdnrTransferFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromBtcAddress = freezed,
    Object? domainName = freezed,
  }) {
    return _then(_value.copyWith(
      fromBtcAddress: freezed == fromBtcAddress
          ? _value.fromBtcAddress
          : fromBtcAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      domainName: freezed == domainName
          ? _value.domainName
          : domainName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcAdnrTransferFormStateCopyWith<$Res>
    implements $BtcAdnrTransferFormStateCopyWith<$Res> {
  factory _$$_BtcAdnrTransferFormStateCopyWith(
          _$_BtcAdnrTransferFormState value,
          $Res Function(_$_BtcAdnrTransferFormState) then) =
      __$$_BtcAdnrTransferFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? fromBtcAddress, String? domainName});
}

/// @nodoc
class __$$_BtcAdnrTransferFormStateCopyWithImpl<$Res>
    extends _$BtcAdnrTransferFormStateCopyWithImpl<$Res,
        _$_BtcAdnrTransferFormState>
    implements _$$_BtcAdnrTransferFormStateCopyWith<$Res> {
  __$$_BtcAdnrTransferFormStateCopyWithImpl(_$_BtcAdnrTransferFormState _value,
      $Res Function(_$_BtcAdnrTransferFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromBtcAddress = freezed,
    Object? domainName = freezed,
  }) {
    return _then(_$_BtcAdnrTransferFormState(
      fromBtcAddress: freezed == fromBtcAddress
          ? _value.fromBtcAddress
          : fromBtcAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      domainName: freezed == domainName
          ? _value.domainName
          : domainName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_BtcAdnrTransferFormState extends _BtcAdnrTransferFormState {
  _$_BtcAdnrTransferFormState({this.fromBtcAddress, this.domainName})
      : super._();

  @override
  final String? fromBtcAddress;
  @override
  final String? domainName;

  @override
  String toString() {
    return 'BtcAdnrTransferFormState(fromBtcAddress: $fromBtcAddress, domainName: $domainName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcAdnrTransferFormState &&
            (identical(other.fromBtcAddress, fromBtcAddress) ||
                other.fromBtcAddress == fromBtcAddress) &&
            (identical(other.domainName, domainName) ||
                other.domainName == domainName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromBtcAddress, domainName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcAdnrTransferFormStateCopyWith<_$_BtcAdnrTransferFormState>
      get copyWith => __$$_BtcAdnrTransferFormStateCopyWithImpl<
          _$_BtcAdnrTransferFormState>(this, _$identity);
}

abstract class _BtcAdnrTransferFormState extends BtcAdnrTransferFormState {
  factory _BtcAdnrTransferFormState(
      {final String? fromBtcAddress,
      final String? domainName}) = _$_BtcAdnrTransferFormState;
  _BtcAdnrTransferFormState._() : super._();

  @override
  String? get fromBtcAddress;
  @override
  String? get domainName;
  @override
  @JsonKey(ignore: true)
  _$$_BtcAdnrTransferFormStateCopyWith<_$_BtcAdnrTransferFormState>
      get copyWith => throw _privateConstructorUsedError;
}
