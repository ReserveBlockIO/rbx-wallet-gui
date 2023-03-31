// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adj_vote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdjVote _$AdjVoteFromJson(Map<String, dynamic> json) {
  return _AdjVote.fromJson(json);
}

/// @nodoc
mixin _$AdjVote {
  @JsonKey(name: "RBXAddress")
  String get rbxAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "IPAddress")
  String get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(
      name: "ProviderForMachine",
      toJson: providerToJson,
      fromJson: providerFromJson)
  Provider get provider => throw _privateConstructorUsedError;
  @JsonKey(name: "MachineType")
  String get machineType => throw _privateConstructorUsedError;
  @JsonKey(name: "MachineOS", toJson: osToJson, fromJson: osFromJson)
  OS get machineOs => throw _privateConstructorUsedError;
  @JsonKey(name: "MachineRam")
  int get machineRam => throw _privateConstructorUsedError;
  @JsonKey(name: "MachineCPU")
  String get machineCPU => throw _privateConstructorUsedError;
  @JsonKey(name: "MachineCPUCores")
  int get machineCPUCores => throw _privateConstructorUsedError;
  @JsonKey(name: "MachineCPUThreads")
  int get machineCPUThreads => throw _privateConstructorUsedError;
  @JsonKey(name: "MachineHDDSize")
  int get machineHDDSize => throw _privateConstructorUsedError;
  @JsonKey(
      name: "MachineHDDSpecifier",
      toJson: hdSizeSpecifierToJson,
      fromJson: hdSizeSpecifierFromJson)
  HDSizeSpecifier get machineHDDSpecifier => throw _privateConstructorUsedError;
  @JsonKey(name: "InternetSpeedUp")
  int get internetSpeedUp => throw _privateConstructorUsedError;
  @JsonKey(name: "InternetSpeedDown")
  int get internetSpeedDown => throw _privateConstructorUsedError;
  @JsonKey(name: "Bandwith")
  int get bandwith => throw _privateConstructorUsedError;
  @JsonKey(name: "TechnicalBackground")
  String get technicalBackground => throw _privateConstructorUsedError;
  @JsonKey(name: "ReasonForAdjJoin")
  String get reasonForAdjJoin => throw _privateConstructorUsedError;
  @JsonKey(name: "GithubLink")
  String get githubLink => throw _privateConstructorUsedError;
  @JsonKey(name: "SupplementalURLs")
  String get supplementalURLs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdjVoteCopyWith<AdjVote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdjVoteCopyWith<$Res> {
  factory $AdjVoteCopyWith(AdjVote value, $Res Function(AdjVote) then) =
      _$AdjVoteCopyWithImpl<$Res, AdjVote>;
  @useResult
  $Res call(
      {@JsonKey(name: "RBXAddress")
          String rbxAddress,
      @JsonKey(name: "IPAddress")
          String ipAddress,
      @JsonKey(name: "ProviderForMachine", toJson: providerToJson, fromJson: providerFromJson)
          Provider provider,
      @JsonKey(name: "MachineType")
          String machineType,
      @JsonKey(name: "MachineOS", toJson: osToJson, fromJson: osFromJson)
          OS machineOs,
      @JsonKey(name: "MachineRam")
          int machineRam,
      @JsonKey(name: "MachineCPU")
          String machineCPU,
      @JsonKey(name: "MachineCPUCores")
          int machineCPUCores,
      @JsonKey(name: "MachineCPUThreads")
          int machineCPUThreads,
      @JsonKey(name: "MachineHDDSize")
          int machineHDDSize,
      @JsonKey(name: "MachineHDDSpecifier", toJson: hdSizeSpecifierToJson, fromJson: hdSizeSpecifierFromJson)
          HDSizeSpecifier machineHDDSpecifier,
      @JsonKey(name: "InternetSpeedUp")
          int internetSpeedUp,
      @JsonKey(name: "InternetSpeedDown")
          int internetSpeedDown,
      @JsonKey(name: "Bandwith")
          int bandwith,
      @JsonKey(name: "TechnicalBackground")
          String technicalBackground,
      @JsonKey(name: "ReasonForAdjJoin")
          String reasonForAdjJoin,
      @JsonKey(name: "GithubLink")
          String githubLink,
      @JsonKey(name: "SupplementalURLs")
          String supplementalURLs});
}

/// @nodoc
class _$AdjVoteCopyWithImpl<$Res, $Val extends AdjVote>
    implements $AdjVoteCopyWith<$Res> {
  _$AdjVoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rbxAddress = null,
    Object? ipAddress = null,
    Object? provider = null,
    Object? machineType = null,
    Object? machineOs = null,
    Object? machineRam = null,
    Object? machineCPU = null,
    Object? machineCPUCores = null,
    Object? machineCPUThreads = null,
    Object? machineHDDSize = null,
    Object? machineHDDSpecifier = null,
    Object? internetSpeedUp = null,
    Object? internetSpeedDown = null,
    Object? bandwith = null,
    Object? technicalBackground = null,
    Object? reasonForAdjJoin = null,
    Object? githubLink = null,
    Object? supplementalURLs = null,
  }) {
    return _then(_value.copyWith(
      rbxAddress: null == rbxAddress
          ? _value.rbxAddress
          : rbxAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      machineType: null == machineType
          ? _value.machineType
          : machineType // ignore: cast_nullable_to_non_nullable
              as String,
      machineOs: null == machineOs
          ? _value.machineOs
          : machineOs // ignore: cast_nullable_to_non_nullable
              as OS,
      machineRam: null == machineRam
          ? _value.machineRam
          : machineRam // ignore: cast_nullable_to_non_nullable
              as int,
      machineCPU: null == machineCPU
          ? _value.machineCPU
          : machineCPU // ignore: cast_nullable_to_non_nullable
              as String,
      machineCPUCores: null == machineCPUCores
          ? _value.machineCPUCores
          : machineCPUCores // ignore: cast_nullable_to_non_nullable
              as int,
      machineCPUThreads: null == machineCPUThreads
          ? _value.machineCPUThreads
          : machineCPUThreads // ignore: cast_nullable_to_non_nullable
              as int,
      machineHDDSize: null == machineHDDSize
          ? _value.machineHDDSize
          : machineHDDSize // ignore: cast_nullable_to_non_nullable
              as int,
      machineHDDSpecifier: null == machineHDDSpecifier
          ? _value.machineHDDSpecifier
          : machineHDDSpecifier // ignore: cast_nullable_to_non_nullable
              as HDSizeSpecifier,
      internetSpeedUp: null == internetSpeedUp
          ? _value.internetSpeedUp
          : internetSpeedUp // ignore: cast_nullable_to_non_nullable
              as int,
      internetSpeedDown: null == internetSpeedDown
          ? _value.internetSpeedDown
          : internetSpeedDown // ignore: cast_nullable_to_non_nullable
              as int,
      bandwith: null == bandwith
          ? _value.bandwith
          : bandwith // ignore: cast_nullable_to_non_nullable
              as int,
      technicalBackground: null == technicalBackground
          ? _value.technicalBackground
          : technicalBackground // ignore: cast_nullable_to_non_nullable
              as String,
      reasonForAdjJoin: null == reasonForAdjJoin
          ? _value.reasonForAdjJoin
          : reasonForAdjJoin // ignore: cast_nullable_to_non_nullable
              as String,
      githubLink: null == githubLink
          ? _value.githubLink
          : githubLink // ignore: cast_nullable_to_non_nullable
              as String,
      supplementalURLs: null == supplementalURLs
          ? _value.supplementalURLs
          : supplementalURLs // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdjVoteCopyWith<$Res> implements $AdjVoteCopyWith<$Res> {
  factory _$$_AdjVoteCopyWith(
          _$_AdjVote value, $Res Function(_$_AdjVote) then) =
      __$$_AdjVoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "RBXAddress")
          String rbxAddress,
      @JsonKey(name: "IPAddress")
          String ipAddress,
      @JsonKey(name: "ProviderForMachine", toJson: providerToJson, fromJson: providerFromJson)
          Provider provider,
      @JsonKey(name: "MachineType")
          String machineType,
      @JsonKey(name: "MachineOS", toJson: osToJson, fromJson: osFromJson)
          OS machineOs,
      @JsonKey(name: "MachineRam")
          int machineRam,
      @JsonKey(name: "MachineCPU")
          String machineCPU,
      @JsonKey(name: "MachineCPUCores")
          int machineCPUCores,
      @JsonKey(name: "MachineCPUThreads")
          int machineCPUThreads,
      @JsonKey(name: "MachineHDDSize")
          int machineHDDSize,
      @JsonKey(name: "MachineHDDSpecifier", toJson: hdSizeSpecifierToJson, fromJson: hdSizeSpecifierFromJson)
          HDSizeSpecifier machineHDDSpecifier,
      @JsonKey(name: "InternetSpeedUp")
          int internetSpeedUp,
      @JsonKey(name: "InternetSpeedDown")
          int internetSpeedDown,
      @JsonKey(name: "Bandwith")
          int bandwith,
      @JsonKey(name: "TechnicalBackground")
          String technicalBackground,
      @JsonKey(name: "ReasonForAdjJoin")
          String reasonForAdjJoin,
      @JsonKey(name: "GithubLink")
          String githubLink,
      @JsonKey(name: "SupplementalURLs")
          String supplementalURLs});
}

/// @nodoc
class __$$_AdjVoteCopyWithImpl<$Res>
    extends _$AdjVoteCopyWithImpl<$Res, _$_AdjVote>
    implements _$$_AdjVoteCopyWith<$Res> {
  __$$_AdjVoteCopyWithImpl(_$_AdjVote _value, $Res Function(_$_AdjVote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rbxAddress = null,
    Object? ipAddress = null,
    Object? provider = null,
    Object? machineType = null,
    Object? machineOs = null,
    Object? machineRam = null,
    Object? machineCPU = null,
    Object? machineCPUCores = null,
    Object? machineCPUThreads = null,
    Object? machineHDDSize = null,
    Object? machineHDDSpecifier = null,
    Object? internetSpeedUp = null,
    Object? internetSpeedDown = null,
    Object? bandwith = null,
    Object? technicalBackground = null,
    Object? reasonForAdjJoin = null,
    Object? githubLink = null,
    Object? supplementalURLs = null,
  }) {
    return _then(_$_AdjVote(
      rbxAddress: null == rbxAddress
          ? _value.rbxAddress
          : rbxAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      machineType: null == machineType
          ? _value.machineType
          : machineType // ignore: cast_nullable_to_non_nullable
              as String,
      machineOs: null == machineOs
          ? _value.machineOs
          : machineOs // ignore: cast_nullable_to_non_nullable
              as OS,
      machineRam: null == machineRam
          ? _value.machineRam
          : machineRam // ignore: cast_nullable_to_non_nullable
              as int,
      machineCPU: null == machineCPU
          ? _value.machineCPU
          : machineCPU // ignore: cast_nullable_to_non_nullable
              as String,
      machineCPUCores: null == machineCPUCores
          ? _value.machineCPUCores
          : machineCPUCores // ignore: cast_nullable_to_non_nullable
              as int,
      machineCPUThreads: null == machineCPUThreads
          ? _value.machineCPUThreads
          : machineCPUThreads // ignore: cast_nullable_to_non_nullable
              as int,
      machineHDDSize: null == machineHDDSize
          ? _value.machineHDDSize
          : machineHDDSize // ignore: cast_nullable_to_non_nullable
              as int,
      machineHDDSpecifier: null == machineHDDSpecifier
          ? _value.machineHDDSpecifier
          : machineHDDSpecifier // ignore: cast_nullable_to_non_nullable
              as HDSizeSpecifier,
      internetSpeedUp: null == internetSpeedUp
          ? _value.internetSpeedUp
          : internetSpeedUp // ignore: cast_nullable_to_non_nullable
              as int,
      internetSpeedDown: null == internetSpeedDown
          ? _value.internetSpeedDown
          : internetSpeedDown // ignore: cast_nullable_to_non_nullable
              as int,
      bandwith: null == bandwith
          ? _value.bandwith
          : bandwith // ignore: cast_nullable_to_non_nullable
              as int,
      technicalBackground: null == technicalBackground
          ? _value.technicalBackground
          : technicalBackground // ignore: cast_nullable_to_non_nullable
              as String,
      reasonForAdjJoin: null == reasonForAdjJoin
          ? _value.reasonForAdjJoin
          : reasonForAdjJoin // ignore: cast_nullable_to_non_nullable
              as String,
      githubLink: null == githubLink
          ? _value.githubLink
          : githubLink // ignore: cast_nullable_to_non_nullable
              as String,
      supplementalURLs: null == supplementalURLs
          ? _value.supplementalURLs
          : supplementalURLs // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdjVote extends _AdjVote {
  _$_AdjVote(
      {@JsonKey(name: "RBXAddress")
          required this.rbxAddress,
      @JsonKey(name: "IPAddress")
          required this.ipAddress,
      @JsonKey(name: "ProviderForMachine", toJson: providerToJson, fromJson: providerFromJson)
          required this.provider,
      @JsonKey(name: "MachineType")
          required this.machineType,
      @JsonKey(name: "MachineOS", toJson: osToJson, fromJson: osFromJson)
          required this.machineOs,
      @JsonKey(name: "MachineRam")
          required this.machineRam,
      @JsonKey(name: "MachineCPU")
          required this.machineCPU,
      @JsonKey(name: "MachineCPUCores")
          required this.machineCPUCores,
      @JsonKey(name: "MachineCPUThreads")
          required this.machineCPUThreads,
      @JsonKey(name: "MachineHDDSize")
          required this.machineHDDSize,
      @JsonKey(name: "MachineHDDSpecifier", toJson: hdSizeSpecifierToJson, fromJson: hdSizeSpecifierFromJson)
          required this.machineHDDSpecifier,
      @JsonKey(name: "InternetSpeedUp")
          required this.internetSpeedUp,
      @JsonKey(name: "InternetSpeedDown")
          required this.internetSpeedDown,
      @JsonKey(name: "Bandwith")
          required this.bandwith,
      @JsonKey(name: "TechnicalBackground")
          required this.technicalBackground,
      @JsonKey(name: "ReasonForAdjJoin")
          required this.reasonForAdjJoin,
      @JsonKey(name: "GithubLink")
          required this.githubLink,
      @JsonKey(name: "SupplementalURLs")
          required this.supplementalURLs})
      : super._();

  factory _$_AdjVote.fromJson(Map<String, dynamic> json) =>
      _$$_AdjVoteFromJson(json);

  @override
  @JsonKey(name: "RBXAddress")
  final String rbxAddress;
  @override
  @JsonKey(name: "IPAddress")
  final String ipAddress;
  @override
  @JsonKey(
      name: "ProviderForMachine",
      toJson: providerToJson,
      fromJson: providerFromJson)
  final Provider provider;
  @override
  @JsonKey(name: "MachineType")
  final String machineType;
  @override
  @JsonKey(name: "MachineOS", toJson: osToJson, fromJson: osFromJson)
  final OS machineOs;
  @override
  @JsonKey(name: "MachineRam")
  final int machineRam;
  @override
  @JsonKey(name: "MachineCPU")
  final String machineCPU;
  @override
  @JsonKey(name: "MachineCPUCores")
  final int machineCPUCores;
  @override
  @JsonKey(name: "MachineCPUThreads")
  final int machineCPUThreads;
  @override
  @JsonKey(name: "MachineHDDSize")
  final int machineHDDSize;
  @override
  @JsonKey(
      name: "MachineHDDSpecifier",
      toJson: hdSizeSpecifierToJson,
      fromJson: hdSizeSpecifierFromJson)
  final HDSizeSpecifier machineHDDSpecifier;
  @override
  @JsonKey(name: "InternetSpeedUp")
  final int internetSpeedUp;
  @override
  @JsonKey(name: "InternetSpeedDown")
  final int internetSpeedDown;
  @override
  @JsonKey(name: "Bandwith")
  final int bandwith;
  @override
  @JsonKey(name: "TechnicalBackground")
  final String technicalBackground;
  @override
  @JsonKey(name: "ReasonForAdjJoin")
  final String reasonForAdjJoin;
  @override
  @JsonKey(name: "GithubLink")
  final String githubLink;
  @override
  @JsonKey(name: "SupplementalURLs")
  final String supplementalURLs;

  @override
  String toString() {
    return 'AdjVote(rbxAddress: $rbxAddress, ipAddress: $ipAddress, provider: $provider, machineType: $machineType, machineOs: $machineOs, machineRam: $machineRam, machineCPU: $machineCPU, machineCPUCores: $machineCPUCores, machineCPUThreads: $machineCPUThreads, machineHDDSize: $machineHDDSize, machineHDDSpecifier: $machineHDDSpecifier, internetSpeedUp: $internetSpeedUp, internetSpeedDown: $internetSpeedDown, bandwith: $bandwith, technicalBackground: $technicalBackground, reasonForAdjJoin: $reasonForAdjJoin, githubLink: $githubLink, supplementalURLs: $supplementalURLs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdjVote &&
            (identical(other.rbxAddress, rbxAddress) ||
                other.rbxAddress == rbxAddress) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.machineType, machineType) ||
                other.machineType == machineType) &&
            (identical(other.machineOs, machineOs) ||
                other.machineOs == machineOs) &&
            (identical(other.machineRam, machineRam) ||
                other.machineRam == machineRam) &&
            (identical(other.machineCPU, machineCPU) ||
                other.machineCPU == machineCPU) &&
            (identical(other.machineCPUCores, machineCPUCores) ||
                other.machineCPUCores == machineCPUCores) &&
            (identical(other.machineCPUThreads, machineCPUThreads) ||
                other.machineCPUThreads == machineCPUThreads) &&
            (identical(other.machineHDDSize, machineHDDSize) ||
                other.machineHDDSize == machineHDDSize) &&
            (identical(other.machineHDDSpecifier, machineHDDSpecifier) ||
                other.machineHDDSpecifier == machineHDDSpecifier) &&
            (identical(other.internetSpeedUp, internetSpeedUp) ||
                other.internetSpeedUp == internetSpeedUp) &&
            (identical(other.internetSpeedDown, internetSpeedDown) ||
                other.internetSpeedDown == internetSpeedDown) &&
            (identical(other.bandwith, bandwith) ||
                other.bandwith == bandwith) &&
            (identical(other.technicalBackground, technicalBackground) ||
                other.technicalBackground == technicalBackground) &&
            (identical(other.reasonForAdjJoin, reasonForAdjJoin) ||
                other.reasonForAdjJoin == reasonForAdjJoin) &&
            (identical(other.githubLink, githubLink) ||
                other.githubLink == githubLink) &&
            (identical(other.supplementalURLs, supplementalURLs) ||
                other.supplementalURLs == supplementalURLs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      rbxAddress,
      ipAddress,
      provider,
      machineType,
      machineOs,
      machineRam,
      machineCPU,
      machineCPUCores,
      machineCPUThreads,
      machineHDDSize,
      machineHDDSpecifier,
      internetSpeedUp,
      internetSpeedDown,
      bandwith,
      technicalBackground,
      reasonForAdjJoin,
      githubLink,
      supplementalURLs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdjVoteCopyWith<_$_AdjVote> get copyWith =>
      __$$_AdjVoteCopyWithImpl<_$_AdjVote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdjVoteToJson(
      this,
    );
  }
}

abstract class _AdjVote extends AdjVote {
  factory _AdjVote(
      {@JsonKey(name: "RBXAddress")
          required final String rbxAddress,
      @JsonKey(name: "IPAddress")
          required final String ipAddress,
      @JsonKey(name: "ProviderForMachine", toJson: providerToJson, fromJson: providerFromJson)
          required final Provider provider,
      @JsonKey(name: "MachineType")
          required final String machineType,
      @JsonKey(name: "MachineOS", toJson: osToJson, fromJson: osFromJson)
          required final OS machineOs,
      @JsonKey(name: "MachineRam")
          required final int machineRam,
      @JsonKey(name: "MachineCPU")
          required final String machineCPU,
      @JsonKey(name: "MachineCPUCores")
          required final int machineCPUCores,
      @JsonKey(name: "MachineCPUThreads")
          required final int machineCPUThreads,
      @JsonKey(name: "MachineHDDSize")
          required final int machineHDDSize,
      @JsonKey(name: "MachineHDDSpecifier", toJson: hdSizeSpecifierToJson, fromJson: hdSizeSpecifierFromJson)
          required final HDSizeSpecifier machineHDDSpecifier,
      @JsonKey(name: "InternetSpeedUp")
          required final int internetSpeedUp,
      @JsonKey(name: "InternetSpeedDown")
          required final int internetSpeedDown,
      @JsonKey(name: "Bandwith")
          required final int bandwith,
      @JsonKey(name: "TechnicalBackground")
          required final String technicalBackground,
      @JsonKey(name: "ReasonForAdjJoin")
          required final String reasonForAdjJoin,
      @JsonKey(name: "GithubLink")
          required final String githubLink,
      @JsonKey(name: "SupplementalURLs")
          required final String supplementalURLs}) = _$_AdjVote;
  _AdjVote._() : super._();

  factory _AdjVote.fromJson(Map<String, dynamic> json) = _$_AdjVote.fromJson;

  @override
  @JsonKey(name: "RBXAddress")
  String get rbxAddress;
  @override
  @JsonKey(name: "IPAddress")
  String get ipAddress;
  @override
  @JsonKey(
      name: "ProviderForMachine",
      toJson: providerToJson,
      fromJson: providerFromJson)
  Provider get provider;
  @override
  @JsonKey(name: "MachineType")
  String get machineType;
  @override
  @JsonKey(name: "MachineOS", toJson: osToJson, fromJson: osFromJson)
  OS get machineOs;
  @override
  @JsonKey(name: "MachineRam")
  int get machineRam;
  @override
  @JsonKey(name: "MachineCPU")
  String get machineCPU;
  @override
  @JsonKey(name: "MachineCPUCores")
  int get machineCPUCores;
  @override
  @JsonKey(name: "MachineCPUThreads")
  int get machineCPUThreads;
  @override
  @JsonKey(name: "MachineHDDSize")
  int get machineHDDSize;
  @override
  @JsonKey(
      name: "MachineHDDSpecifier",
      toJson: hdSizeSpecifierToJson,
      fromJson: hdSizeSpecifierFromJson)
  HDSizeSpecifier get machineHDDSpecifier;
  @override
  @JsonKey(name: "InternetSpeedUp")
  int get internetSpeedUp;
  @override
  @JsonKey(name: "InternetSpeedDown")
  int get internetSpeedDown;
  @override
  @JsonKey(name: "Bandwith")
  int get bandwith;
  @override
  @JsonKey(name: "TechnicalBackground")
  String get technicalBackground;
  @override
  @JsonKey(name: "ReasonForAdjJoin")
  String get reasonForAdjJoin;
  @override
  @JsonKey(name: "GithubLink")
  String get githubLink;
  @override
  @JsonKey(name: "SupplementalURLs")
  String get supplementalURLs;
  @override
  @JsonKey(ignore: true)
  _$$_AdjVoteCopyWith<_$_AdjVote> get copyWith =>
      throw _privateConstructorUsedError;
}
