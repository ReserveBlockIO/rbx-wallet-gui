import 'package:freezed_annotation/freezed_annotation.dart';

part 'adj_vote.freezed.dart';
part 'adj_vote.g.dart';

enum Provider { onlineCloudVPS, onlineDedicated, localDedicated, homeMachine, officeMachine }

enum OS { linux, windows, mac }

enum HDSizeSpecifier { gb, tb, pb }

providerToJson(Provider value) => Provider.values.indexOf(value);
osToJson(OS value) => OS.values.indexOf(value);
hdSizeSpecifierToJson(HDSizeSpecifier value) => HDSizeSpecifier.values.indexOf(value);

providerFromJson(int value) => Provider.values[value];
osFromJson(int value) => OS.values[value];
hdSizeSpecifierFromJson(int value) => HDSizeSpecifier.values[value];

@freezed
class AdjVote with _$AdjVote {
  const AdjVote._();

  factory AdjVote({
    @JsonKey(name: "RBXAddress") required String rbxAddress,
    @JsonKey(name: "IPAddress") required String ipAddress,
    @JsonKey(name: "ProviderForMachine", toJson: providerToJson, fromJson: providerFromJson) required Provider provider,
    @JsonKey(name: "MachineType") required String machineType,
    @JsonKey(name: "MachineOS", toJson: osToJson, fromJson: osFromJson) required OS machineOs,
    @JsonKey(name: "MachineRam") required int machineRam,
    @JsonKey(name: "MachineCPU") required String machineCPU,
    @JsonKey(name: "MachineCPUCores") required int machineCPUCores,
    @JsonKey(name: "MachineCPUThreads") required int machineCPUThreads,
    @JsonKey(name: "MachineHDDSize") required int machineHDDSize,
    @JsonKey(name: "MachineHDDSpecifier", toJson: hdSizeSpecifierToJson, fromJson: hdSizeSpecifierFromJson)
        required HDSizeSpecifier machineHDDSpecifier,
    @JsonKey(name: "InternetSpeedUp") required int internetSpeedUp,
    @JsonKey(name: "InternetSpeedDown") required int internetSpeedDown,
    @JsonKey(name: "Bandwith") required int bandwith,
    @JsonKey(name: "TechnicalBackground") required String technicalBackground,
    @JsonKey(name: "ReasonForAdjJoin") required String reasonForAdjJoin,
    @JsonKey(name: "GithubLink") required String githubLink,
    @JsonKey(name: "SupplementalURLs") required String supplementalURLs,
  }) = _AdjVote;

  factory AdjVote.fromJson(Map<String, dynamic> json) => _$AdjVoteFromJson(json);

  factory AdjVote.empty() {
    return AdjVote(
      rbxAddress: "",
      ipAddress: "",
      provider: Provider.onlineCloudVPS,
      machineType: "",
      machineOs: OS.linux,
      machineRam: 0,
      machineCPU: "",
      machineCPUCores: 0,
      machineCPUThreads: 0,
      machineHDDSize: 0,
      machineHDDSpecifier: HDSizeSpecifier.gb,
      internetSpeedUp: 0,
      internetSpeedDown: 0,
      bandwith: 0,
      technicalBackground: '',
      reasonForAdjJoin: "",
      githubLink: "",
      supplementalURLs: "",
    );
  }
}
