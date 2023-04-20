// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fractional.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Fractional _$FractionalFromJson(Map<String, dynamic> json) {
  return _Fractional.fromJson(json);
}

/// @nodoc
mixin _$Fractional {
  String get id => throw _privateConstructorUsedError;
  double get creatorRetains => throw _privateConstructorUsedError;
  double get fractionalInterest => throw _privateConstructorUsedError;
  bool get allowVoting => throw _privateConstructorUsedError;
  String get votingDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FractionalCopyWith<Fractional> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FractionalCopyWith<$Res> {
  factory $FractionalCopyWith(
          Fractional value, $Res Function(Fractional) then) =
      _$FractionalCopyWithImpl<$Res, Fractional>;
  @useResult
  $Res call(
      {String id,
      double creatorRetains,
      double fractionalInterest,
      bool allowVoting,
      String votingDescription});
}

/// @nodoc
class _$FractionalCopyWithImpl<$Res, $Val extends Fractional>
    implements $FractionalCopyWith<$Res> {
  _$FractionalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorRetains = null,
    Object? fractionalInterest = null,
    Object? allowVoting = null,
    Object? votingDescription = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRetains: null == creatorRetains
          ? _value.creatorRetains
          : creatorRetains // ignore: cast_nullable_to_non_nullable
              as double,
      fractionalInterest: null == fractionalInterest
          ? _value.fractionalInterest
          : fractionalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      allowVoting: null == allowVoting
          ? _value.allowVoting
          : allowVoting // ignore: cast_nullable_to_non_nullable
              as bool,
      votingDescription: null == votingDescription
          ? _value.votingDescription
          : votingDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FractionalCopyWith<$Res>
    implements $FractionalCopyWith<$Res> {
  factory _$$_FractionalCopyWith(
          _$_Fractional value, $Res Function(_$_Fractional) then) =
      __$$_FractionalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double creatorRetains,
      double fractionalInterest,
      bool allowVoting,
      String votingDescription});
}

/// @nodoc
class __$$_FractionalCopyWithImpl<$Res>
    extends _$FractionalCopyWithImpl<$Res, _$_Fractional>
    implements _$$_FractionalCopyWith<$Res> {
  __$$_FractionalCopyWithImpl(
      _$_Fractional _value, $Res Function(_$_Fractional) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorRetains = null,
    Object? fractionalInterest = null,
    Object? allowVoting = null,
    Object? votingDescription = null,
  }) {
    return _then(_$_Fractional(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRetains: null == creatorRetains
          ? _value.creatorRetains
          : creatorRetains // ignore: cast_nullable_to_non_nullable
              as double,
      fractionalInterest: null == fractionalInterest
          ? _value.fractionalInterest
          : fractionalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      allowVoting: null == allowVoting
          ? _value.allowVoting
          : allowVoting // ignore: cast_nullable_to_non_nullable
              as bool,
      votingDescription: null == votingDescription
          ? _value.votingDescription
          : votingDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Fractional extends _Fractional {
  const _$_Fractional(
      {this.id = "",
      this.creatorRetains = 0,
      this.fractionalInterest = 5,
      this.allowVoting = false,
      this.votingDescription = ""})
      : super._();

  factory _$_Fractional.fromJson(Map<String, dynamic> json) =>
      _$$_FractionalFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final double creatorRetains;
  @override
  @JsonKey()
  final double fractionalInterest;
  @override
  @JsonKey()
  final bool allowVoting;
  @override
  @JsonKey()
  final String votingDescription;

  @override
  String toString() {
    return 'Fractional(id: $id, creatorRetains: $creatorRetains, fractionalInterest: $fractionalInterest, allowVoting: $allowVoting, votingDescription: $votingDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fractional &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorRetains, creatorRetains) ||
                other.creatorRetains == creatorRetains) &&
            (identical(other.fractionalInterest, fractionalInterest) ||
                other.fractionalInterest == fractionalInterest) &&
            (identical(other.allowVoting, allowVoting) ||
                other.allowVoting == allowVoting) &&
            (identical(other.votingDescription, votingDescription) ||
                other.votingDescription == votingDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, creatorRetains,
      fractionalInterest, allowVoting, votingDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FractionalCopyWith<_$_Fractional> get copyWith =>
      __$$_FractionalCopyWithImpl<_$_Fractional>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FractionalToJson(
      this,
    );
  }
}

abstract class _Fractional extends Fractional {
  const factory _Fractional(
      {final String id,
      final double creatorRetains,
      final double fractionalInterest,
      final bool allowVoting,
      final String votingDescription}) = _$_Fractional;
  const _Fractional._() : super._();

  factory _Fractional.fromJson(Map<String, dynamic> json) =
      _$_Fractional.fromJson;

  @override
  String get id;
  @override
  double get creatorRetains;
  @override
  double get fractionalInterest;
  @override
  bool get allowVoting;
  @override
  String get votingDescription;
  @override
  @JsonKey(ignore: true)
  _$$_FractionalCopyWith<_$_Fractional> get copyWith =>
      throw _privateConstructorUsedError;
}
