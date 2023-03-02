// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$NewTopicCopyWithImpl<$Res, NewTopic>;
  @useResult
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
class _$NewTopicCopyWithImpl<$Res, $Val extends NewTopic>
    implements $NewTopicCopyWith<$Res> {
  _$NewTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? votingEndDays = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      votingEndDays: null == votingEndDays
          ? _value.votingEndDays
          : votingEndDays // ignore: cast_nullable_to_non_nullable
              as VotingDays,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as VoteTopicCategory,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewTopicCopyWith<$Res> implements $NewTopicCopyWith<$Res> {
  factory _$$_NewTopicCopyWith(
          _$_NewTopic value, $Res Function(_$_NewTopic) then) =
      __$$_NewTopicCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_NewTopicCopyWithImpl<$Res>
    extends _$NewTopicCopyWithImpl<$Res, _$_NewTopic>
    implements _$$_NewTopicCopyWith<$Res> {
  __$$_NewTopicCopyWithImpl(
      _$_NewTopic _value, $Res Function(_$_NewTopic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? votingEndDays = null,
    Object? category = null,
  }) {
    return _then(_$_NewTopic(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      votingEndDays: null == votingEndDays
          ? _value.votingEndDays
          : votingEndDays // ignore: cast_nullable_to_non_nullable
              as VotingDays,
      category: null == category
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
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.votingEndDays, votingEndDays) ||
                other.votingEndDays == votingEndDays) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, votingEndDays, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewTopicCopyWith<_$_NewTopic> get copyWith =>
      __$$_NewTopicCopyWithImpl<_$_NewTopic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewTopicToJson(
      this,
    );
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
  String get name;
  @override
  @JsonKey(name: "TopicDescription")
  String get description;
  @override
  @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
  VotingDays get votingEndDays;
  @override
  @JsonKey(name: "VoteTopicCategory", toJson: categoryToJson)
  VoteTopicCategory get category;
  @override
  @JsonKey(ignore: true)
  _$$_NewTopicCopyWith<_$_NewTopic> get copyWith =>
      throw _privateConstructorUsedError;
}
