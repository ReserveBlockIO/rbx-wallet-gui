// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewTopic _$NewTopicFromJson(Map<String, dynamic> json) {
  return _NewTopic.fromJson(json);
}

/// @nodoc
mixin _$NewTopic {
  @JsonKey(name: "TopicName")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicDescription")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
  VotingDays get votingEndDays => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteTopicCategory", toJson: categoryToJson)
  VoteTopicCategory get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewTopicCopyWith<NewTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTopicCopyWith<$Res> {
  factory $NewTopicCopyWith(NewTopic value, $Res Function(NewTopic) then) =
      _$NewTopicCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "TopicName")
          String name,
      @JsonKey(name: "TopicDescription")
          String description,
      @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
          VotingDays votingEndDays,
      @JsonKey(name: "VoteTopicCategory", toJson: categoryToJson)
          VoteTopicCategory category});
}

/// @nodoc
class _$NewTopicCopyWithImpl<$Res> implements $NewTopicCopyWith<$Res> {
  _$NewTopicCopyWithImpl(this._value, this._then);

  final NewTopic _value;
  // ignore: unused_field
  final $Res Function(NewTopic) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? votingEndDays = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      votingEndDays: votingEndDays == freezed
          ? _value.votingEndDays
          : votingEndDays // ignore: cast_nullable_to_non_nullable
              as VotingDays,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as VoteTopicCategory,
    ));
  }
}

/// @nodoc
abstract class _$$_NewTopicCopyWith<$Res> implements $NewTopicCopyWith<$Res> {
  factory _$$_NewTopicCopyWith(
          _$_NewTopic value, $Res Function(_$_NewTopic) then) =
      __$$_NewTopicCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "TopicName")
          String name,
      @JsonKey(name: "TopicDescription")
          String description,
      @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
          VotingDays votingEndDays,
      @JsonKey(name: "VoteTopicCategory", toJson: categoryToJson)
          VoteTopicCategory category});
}

/// @nodoc
class __$$_NewTopicCopyWithImpl<$Res> extends _$NewTopicCopyWithImpl<$Res>
    implements _$$_NewTopicCopyWith<$Res> {
  __$$_NewTopicCopyWithImpl(
      _$_NewTopic _value, $Res Function(_$_NewTopic) _then)
      : super(_value, (v) => _then(v as _$_NewTopic));

  @override
  _$_NewTopic get _value => super._value as _$_NewTopic;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? votingEndDays = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_NewTopic(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      votingEndDays: votingEndDays == freezed
          ? _value.votingEndDays
          : votingEndDays // ignore: cast_nullable_to_non_nullable
              as VotingDays,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as VoteTopicCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewTopic extends _NewTopic {
  _$_NewTopic(
      {@JsonKey(name: "TopicName")
          required this.name,
      @JsonKey(name: "TopicDescription")
          required this.description,
      @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
          required this.votingEndDays,
      @JsonKey(name: "VoteTopicCategory", toJson: categoryToJson)
          required this.category})
      : super._();

  factory _$_NewTopic.fromJson(Map<String, dynamic> json) =>
      _$$_NewTopicFromJson(json);

  @override
  @JsonKey(name: "TopicName")
  final String name;
  @override
  @JsonKey(name: "TopicDescription")
  final String description;
  @override
  @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
  final VotingDays votingEndDays;
  @override
  @JsonKey(name: "VoteTopicCategory", toJson: categoryToJson)
  final VoteTopicCategory category;

  @override
  String toString() {
    return 'NewTopic(name: $name, description: $description, votingEndDays: $votingEndDays, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewTopic &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.votingEndDays, votingEndDays) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(votingEndDays),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$$_NewTopicCopyWith<_$_NewTopic> get copyWith =>
      __$$_NewTopicCopyWithImpl<_$_NewTopic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewTopicToJson(this);
  }
}

abstract class _NewTopic extends NewTopic {
  factory _NewTopic(
      {@JsonKey(name: "TopicName")
          required final String name,
      @JsonKey(name: "TopicDescription")
          required final String description,
      @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
          required final VotingDays votingEndDays,
      @JsonKey(name: "VoteTopicCategory", toJson: categoryToJson)
          required final VoteTopicCategory category}) = _$_NewTopic;
  _NewTopic._() : super._();

  factory _NewTopic.fromJson(Map<String, dynamic> json) = _$_NewTopic.fromJson;

  @override
  @JsonKey(name: "TopicName")
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TopicDescription")
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
  VotingDays get votingEndDays => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "VoteTopicCategory", toJson: categoryToJson)
  VoteTopicCategory get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NewTopicCopyWith<_$_NewTopic> get copyWith =>
      throw _privateConstructorUsedError;
}
