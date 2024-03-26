// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_adnr_create_form_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BtcAdnrCreateFormState {
  String? get btcAddress => throw _privateConstructorUsedError;
  String? get selectedAddress => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BtcAdnrCreateFormStateCopyWith<BtcAdnrCreateFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcAdnrCreateFormStateCopyWith<$Res> {
  factory $BtcAdnrCreateFormStateCopyWith(BtcAdnrCreateFormState value,
          $Res Function(BtcAdnrCreateFormState) then) =
      _$BtcAdnrCreateFormStateCopyWithImpl<$Res, BtcAdnrCreateFormState>;
  @useResult
  $Res call({String? btcAddress, String? selectedAddress, String name});
}

/// @nodoc
class _$BtcAdnrCreateFormStateCopyWithImpl<$Res,
        $Val extends BtcAdnrCreateFormState>
    implements $BtcAdnrCreateFormStateCopyWith<$Res> {
  _$BtcAdnrCreateFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? btcAddress = freezed,
    Object? selectedAddress = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      btcAddress: freezed == btcAddress
          ? _value.btcAddress
          : btcAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcAdnrCreateFormStateCopyWith<$Res>
    implements $BtcAdnrCreateFormStateCopyWith<$Res> {
  factory _$$_BtcAdnrCreateFormStateCopyWith(_$_BtcAdnrCreateFormState value,
          $Res Function(_$_BtcAdnrCreateFormState) then) =
      __$$_BtcAdnrCreateFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? btcAddress, String? selectedAddress, String name});
}

/// @nodoc
class __$$_BtcAdnrCreateFormStateCopyWithImpl<$Res>
    extends _$BtcAdnrCreateFormStateCopyWithImpl<$Res,
        _$_BtcAdnrCreateFormState>
    implements _$$_BtcAdnrCreateFormStateCopyWith<$Res> {
  __$$_BtcAdnrCreateFormStateCopyWithImpl(_$_BtcAdnrCreateFormState _value,
      $Res Function(_$_BtcAdnrCreateFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? btcAddress = freezed,
    Object? selectedAddress = freezed,
    Object? name = null,
  }) {
    return _then(_$_BtcAdnrCreateFormState(
      btcAddress: freezed == btcAddress
          ? _value.btcAddress
          : btcAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BtcAdnrCreateFormState extends _BtcAdnrCreateFormState {
  _$_BtcAdnrCreateFormState(
      {this.btcAddress, this.selectedAddress, this.name = ""})
      : super._();

  @override
  final String? btcAddress;
  @override
  final String? selectedAddress;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'BtcAdnrCreateFormState(btcAddress: $btcAddress, selectedAddress: $selectedAddress, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcAdnrCreateFormState &&
            (identical(other.btcAddress, btcAddress) ||
                other.btcAddress == btcAddress) &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, btcAddress, selectedAddress, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcAdnrCreateFormStateCopyWith<_$_BtcAdnrCreateFormState> get copyWith =>
      __$$_BtcAdnrCreateFormStateCopyWithImpl<_$_BtcAdnrCreateFormState>(
          this, _$identity);
}

abstract class _BtcAdnrCreateFormState extends BtcAdnrCreateFormState {
  factory _BtcAdnrCreateFormState(
      {final String? btcAddress,
      final String? selectedAddress,
      final String name}) = _$_BtcAdnrCreateFormState;
  _BtcAdnrCreateFormState._() : super._();

  @override
  String? get btcAddress;
  @override
  String? get selectedAddress;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_BtcAdnrCreateFormStateCopyWith<_$_BtcAdnrCreateFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
