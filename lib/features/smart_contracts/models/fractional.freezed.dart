// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  $FractionalCopyWith<Fractional> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FractionalCopyWith<$Res> {
  factory $FractionalCopyWith(Fractional value, $Res Function(Fractional) then) = _$FractionalCopyWithImpl<$Res>;
  $Res call({String id, double creatorRetains, double fractionalInterest, bool allowVoting, String votingDescription});
}

/// @nodoc
class _$FractionalCopyWithImpl<$Res> implements $FractionalCopyWith<$Res> {
  _$FractionalCopyWithImpl(this._value, this._then);

  final Fractional _value;
  // ignore: unused_field
  final $Res Function(Fractional) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? creatorRetains = freezed,
    Object? fractionalInterest = freezed,
    Object? allowVoting = freezed,
    Object? votingDescription = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRetains: creatorRetains == freezed
          ? _value.creatorRetains
          : creatorRetains // ignore: cast_nullable_to_non_nullable
              as double,
      fractionalInterest: fractionalInterest == freezed
          ? _value.fractionalInterest
          : fractionalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      allowVoting: allowVoting == freezed
          ? _value.allowVoting
          : allowVoting // ignore: cast_nullable_to_non_nullable
              as bool,
      votingDescription: votingDescription == freezed
          ? _value.votingDescription
          : votingDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FractionalCopyWith<$Res> implements $FractionalCopyWith<$Res> {
  factory _$$_FractionalCopyWith(_$_Fractional value, $Res Function(_$_Fractional) then) = __$$_FractionalCopyWithImpl<$Res>;
  @override
  $Res call({String id, double creatorRetains, double fractionalInterest, bool allowVoting, String votingDescription});
}

/// @nodoc
class __$$_FractionalCopyWithImpl<$Res> extends _$FractionalCopyWithImpl<$Res> implements _$$_FractionalCopyWith<$Res> {
  __$$_FractionalCopyWithImpl(_$_Fractional _value, $Res Function(_$_Fractional) _then) : super(_value, (v) => _then(v as _$_Fractional));

  @override
  _$_Fractional get _value => super._value as _$_Fractional;

  @override
  $Res call({
    Object? id = freezed,
    Object? creatorRetains = freezed,
    Object? fractionalInterest = freezed,
    Object? allowVoting = freezed,
    Object? votingDescription = freezed,
  }) {
    return _then(_$_Fractional(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRetains: creatorRetains == freezed
          ? _value.creatorRetains
          : creatorRetains // ignore: cast_nullable_to_non_nullable
              as double,
      fractionalInterest: fractionalInterest == freezed
          ? _value.fractionalInterest
          : fractionalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      allowVoting: allowVoting == freezed
          ? _value.allowVoting
          : allowVoting // ignore: cast_nullable_to_non_nullable
              as bool,
      votingDescription: votingDescription == freezed
          ? _value.votingDescription
          : votingDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Fractional extends _Fractional {
  const _$_Fractional({this.id = "", this.creatorRetains = 0, this.fractionalInterest = 5, this.allowVoting = false, this.votingDescription = ""})
      : super._();

  factory _$_Fractional.fromJson(Map<String, dynamic> json) => _$$_FractionalFromJson(json);

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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.creatorRetains, creatorRetains) &&
            const DeepCollectionEquality().equals(other.fractionalInterest, fractionalInterest) &&
            const DeepCollectionEquality().equals(other.allowVoting, allowVoting) &&
            const DeepCollectionEquality().equals(other.votingDescription, votingDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(creatorRetains),
      const DeepCollectionEquality().hash(fractionalInterest),
      const DeepCollectionEquality().hash(allowVoting),
      const DeepCollectionEquality().hash(votingDescription));

  @JsonKey(ignore: true)
  @override
  _$$_FractionalCopyWith<_$_Fractional> get copyWith => __$$_FractionalCopyWithImpl<_$_Fractional>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FractionalToJson(this);
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

  factory _Fractional.fromJson(Map<String, dynamic> json) = _$_Fractional.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  double get creatorRetains => throw _privateConstructorUsedError;
  @override
  double get fractionalInterest => throw _privateConstructorUsedError;
  @override
  bool get allowVoting => throw _privateConstructorUsedError;
  @override
  String get votingDescription => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FractionalCopyWith<_$_Fractional> get copyWith => throw _privateConstructorUsedError;
}
