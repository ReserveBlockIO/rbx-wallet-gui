// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adj_vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdjVote _$$_AdjVoteFromJson(Map<String, dynamic> json) => _$_AdjVote(
      rbxAddress: json['RBXAddress'] as String,
      ipAddress: json['IPAddress'] as String,
      provider: $enumDecode(_$ProviderEnumMap, json['ProviderForMachine']),
      machineType: json['MachineType'] as String,
      machineOs: $enumDecode(_$OSEnumMap, json['MachineOS']),
      machineRam: json['MachineRam'] as int,
      machineCPU: json['MachineCPU'] as String,
      machineCPUCores: json['MachineCPUCores'] as int,
      machineCPUThreads: json['MachineCPUThreads'] as int,
      machineHDDSize: json['MachineHDDSize'] as int,
      machineHDDSpecifier:
          $enumDecode(_$HDSizeSpecifierEnumMap, json['MachineHDDSpecifier']),
      internetSpeedUp: json['InternetSpeedUp'] as int,
      internetSpeedDown: json['InternetSpeedDown'] as int,
      bandwith: json['Bandwith'] as int,
      technicalBackground: json['TechnicalBackground'] as String,
      reasonForAdjJoin: json['ReasonForAdjJoin'] as String,
      githubLink: json['GithubLink'] as String,
      supplementalURLs: json['SupplementalURLs'] as String,
    );

Map<String, dynamic> _$$_AdjVoteToJson(_$_AdjVote instance) =>
    <String, dynamic>{
      'RBXAddress': instance.rbxAddress,
      'IPAddress': instance.ipAddress,
      'ProviderForMachine': _$ProviderEnumMap[instance.provider]!,
      'MachineType': instance.machineType,
      'MachineOS': _$OSEnumMap[instance.machineOs]!,
      'MachineRam': instance.machineRam,
      'MachineCPU': instance.machineCPU,
      'MachineCPUCores': instance.machineCPUCores,
      'MachineCPUThreads': instance.machineCPUThreads,
      'MachineHDDSize': instance.machineHDDSize,
      'MachineHDDSpecifier':
          _$HDSizeSpecifierEnumMap[instance.machineHDDSpecifier]!,
      'InternetSpeedUp': instance.internetSpeedUp,
      'InternetSpeedDown': instance.internetSpeedDown,
      'Bandwith': instance.bandwith,
      'TechnicalBackground': instance.technicalBackground,
      'ReasonForAdjJoin': instance.reasonForAdjJoin,
      'GithubLink': instance.githubLink,
      'SupplementalURLs': instance.supplementalURLs,
    };

const _$ProviderEnumMap = {
  Provider.onlineCloudVPS: 'onlineCloudVPS',
  Provider.onlineDedicated: 'onlineDedicated',
  Provider.localDedicated: 'localDedicated',
  Provider.homeMachine: 'homeMachine',
  Provider.officeMachine: 'officeMachine',
};

const _$OSEnumMap = {
  OS.linux: 'linux',
  OS.windows: 'windows',
  OS.mac: 'mac',
};

const _$HDSizeSpecifierEnumMap = {
  HDSizeSpecifier.gb: 'gb',
  HDSizeSpecifier.tb: 'tb',
  HDSizeSpecifier.pb: 'pb',
};
