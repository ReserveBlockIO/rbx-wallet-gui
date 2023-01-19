// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adj_vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdjVote _$$_AdjVoteFromJson(Map<String, dynamic> json) => _$_AdjVote(
      rbxAddress: json['RBXAddress'] as String,
      ipAddress: json['IPAddress'] as String,
      provider: providerFromJson(json['ProviderForMachine'] as int),
      machineType: json['MachineType'] as String,
      machineOs: osFromJson(json['MachineOS'] as int),
      machineRam: json['MachineRam'] as int,
      machineCPU: json['MachineCPU'] as String,
      machineCPUCores: json['MachineCPUCores'] as int,
      machineCPUThreads: json['MachineCPUThreads'] as int,
      machineHDDSize: json['MachineHDDSize'] as int,
      machineHDDSpecifier: hdSizeSpecifierFromJson(json['MachineHDDSpecifier'] as int),
      internetSpeedUp: json['InternetSpeedUp'] as int,
      internetSpeedDown: json['InternetSpeedDown'] as int,
      bandwith: json['Bandwith'] as int,
      technicalBackground: json['TechnicalBackground'] as String,
      reasonForAdjJoin: json['ReasonForAdjJoin'] as String,
      githubLink: json['GithubLink'] as String,
      supplementalURLs: json['SupplementalURLs'] as String,
    );

Map<String, dynamic> _$$_AdjVoteToJson(_$_AdjVote instance) => <String, dynamic>{
      'RBXAddress': instance.rbxAddress,
      'IPAddress': instance.ipAddress,
      'ProviderForMachine': providerToJson(instance.provider),
      'MachineType': instance.machineType,
      'MachineOS': osToJson(instance.machineOs),
      'MachineRam': instance.machineRam,
      'MachineCPU': instance.machineCPU,
      'MachineCPUCores': instance.machineCPUCores,
      'MachineCPUThreads': instance.machineCPUThreads,
      'MachineHDDSize': instance.machineHDDSize,
      'MachineHDDSpecifier': hdSizeSpecifierToJson(instance.machineHDDSpecifier),
      'InternetSpeedUp': instance.internetSpeedUp,
      'InternetSpeedDown': instance.internetSpeedDown,
      'Bandwith': instance.bandwith,
      'TechnicalBackground': instance.technicalBackground,
      'ReasonForAdjJoin': instance.reasonForAdjJoin,
      'GithubLink': instance.githubLink,
      'SupplementalURLs': instance.supplementalURLs,
    };
