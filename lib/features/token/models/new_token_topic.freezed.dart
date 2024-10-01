// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_token_topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewTokenTopic _$NewTokenTopicFromJson(Map<String, dynamic> json) {
  return _NewTokenTopic.fromJson(json);
}

/// @nodoc
mixin _$NewTokenTopic {
  @JsonKey(name: "TopicName")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicDescription")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "MinimumVoteRequirement")
  int get minimumVoteRequirement => throw _privateConstructorUsedError;
  @JsonKey(name: "FromAddress")
  String get fromAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
  TokenVotingDays get votingEndDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewTokenTopicCopyWith<NewTokenTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTokenTopicCopyWith<$Res> {
  factory $NewTokenTopicCopyWith(
          NewTokenTopic value, $Res Function(NewTokenTopic) then) =
      _$NewTokenTopicCopyWithImpl<$Res, NewTokenTopic>;
  @useResult
  $Res call(
      {@JsonKey(name: "TopicName")
          String name,
      @JsonKey(name: "TopicDescription")
          String description,
      @JsonKey(name: "SmartContractUID")
          String smartContractUid,
      @JsonKey(name: "MinimumVoteRequirement")
          int minimumVoteRequirement,
      @JsonKey(name: "FromAddress")
          String fromAddress,
      @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
          TokenVotingDays votingEndDays});
}

/// @nodoc
class _$NewTokenTopicCopyWithImpl<$Res, $Val extends NewTokenTopic>
    implements $NewTokenTopicCopyWith<$Res> {
  _$NewTokenTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? smartContractUid = null,
    Object? minimumVoteRequirement = null,
    Object? fromAddress = null,
    Object? votingEndDays = null,
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
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as int,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      votingEndDays: null == votingEndDays
          ? _value.votingEndDays
          : votingEndDays // ignore: cast_nullable_to_non_nullable
              as TokenVotingDays,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewTokenTopicCopyWith<$Res>
    implements $NewTokenTopicCopyWith<$Res> {
  factory _$$_NewTokenTopicCopyWith(
          _$_NewTokenTopic value, $Res Function(_$_NewTokenTopic) then) =
      __$$_NewTokenTopicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "TopicName")
          String name,
      @JsonKey(name: "TopicDescription")
          String description,
      @JsonKey(name: "SmartContractUID")
          String smartContractUid,
      @JsonKey(name: "MinimumVoteRequirement")
          int minimumVoteRequirement,
      @JsonKey(name: "FromAddress")
          String fromAddress,
      @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
          TokenVotingDays votingEndDays});
}

/// @nodoc
class __$$_NewTokenTopicCopyWithImpl<$Res>
    extends _$NewTokenTopicCopyWithImpl<$Res, _$_NewTokenTopic>
    implements _$$_NewTokenTopicCopyWith<$Res> {
  __$$_NewTokenTopicCopyWithImpl(
      _$_NewTokenTopic _value, $Res Function(_$_NewTokenTopic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? smartContractUid = null,
    Object? minimumVoteRequirement = null,
    Object? fromAddress = null,
    Object? votingEndDays = null,
  }) {
    return _then(_$_NewTokenTopic(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as int,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      votingEndDays: null == votingEndDays
          ? _value.votingEndDays
          : votingEndDays // ignore: cast_nullable_to_non_nullable
              as TokenVotingDays,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewTokenTopic extends _NewTokenTopic {
  _$_NewTokenTopic(
      {@JsonKey(name: "TopicName")
          required this.name,
      @JsonKey(name: "TopicDescription")
          required this.description,
      @JsonKey(name: "SmartContractUID")
          required this.smartContractUid,
      @JsonKey(name: "MinimumVoteRequirement")
          required this.minimumVoteRequirement,
      @JsonKey(name: "FromAddress")
          required this.fromAddress,
      @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
          required this.votingEndDays})
      : super._();

  factory _$_NewTokenTopic.fromJson(Map<String, dynamic> json) =>
      _$$_NewTokenTopicFromJson(json);

  @override
  @JsonKey(name: "TopicName")
  final String name;
  @override
  @JsonKey(name: "TopicDescription")
  final String description;
  @override
  @JsonKey(name: "SmartContractUID")
  final String smartContractUid;
  @override
  @JsonKey(name: "MinimumVoteRequirement")
  final int minimumVoteRequirement;
  @override
  @JsonKey(name: "FromAddress")
  final String fromAddress;
  @override
  @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
  final TokenVotingDays votingEndDays;

  @override
  String toString() {
    return 'NewTokenTopic(name: $name, description: $description, smartContractUid: $smartContractUid, minimumVoteRequirement: $minimumVoteRequirement, fromAddress: $fromAddress, votingEndDays: $votingEndDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewTokenTopic &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.minimumVoteRequirement, minimumVoteRequirement) ||
                other.minimumVoteRequirement == minimumVoteRequirement) &&
            (identical(other.fromAddress, fromAddress) ||
                other.fromAddress == fromAddress) &&
            (identical(other.votingEndDays, votingEndDays) ||
                other.votingEndDays == votingEndDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description,
      smartContractUid, minimumVoteRequirement, fromAddress, votingEndDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewTokenTopicCopyWith<_$_NewTokenTopic> get copyWith =>
      __$$_NewTokenTopicCopyWithImpl<_$_NewTokenTopic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewTokenTopicToJson(
      this,
    );
  }
}

abstract class _NewTokenTopic extends NewTokenTopic {
  factory _NewTokenTopic(
      {@JsonKey(name: "TopicName")
          required final String name,
      @JsonKey(name: "TopicDescription")
          required final String description,
      @JsonKey(name: "SmartContractUID")
          required final String smartContractUid,
      @JsonKey(name: "MinimumVoteRequirement")
          required final int minimumVoteRequirement,
      @JsonKey(name: "FromAddress")
          required final String fromAddress,
      @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
          required final TokenVotingDays votingEndDays}) = _$_NewTokenTopic;
  _NewTokenTopic._() : super._();

  factory _NewTokenTopic.fromJson(Map<String, dynamic> json) =
      _$_NewTokenTopic.fromJson;

  @override
  @JsonKey(name: "TopicName")
  String get name;
  @override
  @JsonKey(name: "TopicDescription")
  String get description;
  @override
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid;
  @override
  @JsonKey(name: "MinimumVoteRequirement")
  int get minimumVoteRequirement;
  @override
  @JsonKey(name: "FromAddress")
  String get fromAddress;
  @override
  @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson)
  TokenVotingDays get votingEndDays;
  @override
  @JsonKey(ignore: true)
  _$$_NewTokenTopicCopyWith<_$_NewTokenTopic> get copyWith =>
      throw _privateConstructorUsedError;
}
