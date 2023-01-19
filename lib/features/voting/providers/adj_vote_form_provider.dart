import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;

import '../../../core/models/value_label.dart';
import '../../../utils/validation.dart';
import '../models/adj_vote.dart';
import '../utils.dart';

class AdjVoteFormProvider extends StateNotifier<AdjVote> {
  final Reader read;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController rbxAddressController = TextEditingController();
  final TextEditingController ipAddressController = TextEditingController();
  final TextEditingController machineTypeController = TextEditingController();
  final TextEditingController machineRamController = TextEditingController();
  final TextEditingController machineCPUController = TextEditingController();
  final TextEditingController machineCPUCoresController = TextEditingController();
  final TextEditingController machineCPUThreadsController = TextEditingController();
  final TextEditingController machineHDDSizeController = TextEditingController();
  final TextEditingController internetSpeedUpController = TextEditingController();
  final TextEditingController internetSpeedDownController = TextEditingController();
  final TextEditingController bandwithController = TextEditingController();
  final TextEditingController technicalBackgroundController = TextEditingController();
  final TextEditingController reasonForAdjJoinController = TextEditingController();
  final TextEditingController githubLinkController = TextEditingController();
  final TextEditingController supplementalURLsController = TextEditingController();

  AdjVoteFormProvider(this.read, AdjVote model) : super(model) {
    rbxAddressController.addListener(() {
      state = state.copyWith(rbxAddress: rbxAddressController.text);
    });

    ipAddressController.addListener(() {
      state = state.copyWith(ipAddress: ipAddressController.text);
    });

    machineTypeController.addListener(() {
      state = state.copyWith(machineType: machineTypeController.text);
    });

    machineRamController.addListener(() {
      state = state.copyWith(machineRam: int.tryParse(machineRamController.text) ?? 0);
    });

    machineCPUController.addListener(() {
      state = state.copyWith(machineCPU: machineCPUController.text);
    });

    machineCPUCoresController.addListener(() {
      state = state.copyWith(machineCPUCores: int.tryParse(machineCPUCoresController.text) ?? 0);
    });

    machineCPUThreadsController.addListener(() {
      state = state.copyWith(machineCPUThreads: int.tryParse(machineCPUThreadsController.text) ?? 0);
    });

    machineHDDSizeController.addListener(() {
      state = state.copyWith(machineHDDSize: int.tryParse(machineHDDSizeController.text) ?? 0);
    });

    internetSpeedUpController.addListener(() {
      state = state.copyWith(internetSpeedUp: int.tryParse(internetSpeedUpController.text) ?? 0);
    });

    internetSpeedDownController.addListener(() {
      state = state.copyWith(internetSpeedDown: int.tryParse(internetSpeedDownController.text) ?? 0);
    });

    bandwithController.addListener(() {
      state = state.copyWith(bandwith: int.tryParse(machineRamController.text) ?? 0);
    });

    technicalBackgroundController.addListener(() {
      state = state.copyWith(technicalBackground: technicalBackgroundController.text);
    });

    reasonForAdjJoinController.addListener(() {
      state = state.copyWith(reasonForAdjJoin: reasonForAdjJoinController.text);
    });

    githubLinkController.addListener(() {
      state = state.copyWith(githubLink: githubLinkController.text);
    });

    supplementalURLsController.addListener(() {
      state = state.copyWith(supplementalURLs: supplementalURLsController.text);
    });

    load(state);
  }

  load(AdjVote topic) {
    state = topic;

    rbxAddressController.text = topic.rbxAddress;
    ipAddressController.text = topic.ipAddress;
    machineTypeController.text = topic.machineType;
    machineRamController.text = topic.machineRam.toString();
    machineCPUController.text = topic.machineCPU;
    machineCPUCoresController.text = topic.machineCPUCores.toString();
    machineCPUThreadsController.text = topic.machineCPUThreads.toString();
    machineHDDSizeController.text = topic.machineHDDSize.toString();
    internetSpeedUpController.text = topic.internetSpeedUp.toString();
    internetSpeedDownController.text = topic.internetSpeedDown.toString();
    bandwithController.text = topic.bandwith.toString();
    technicalBackgroundController.text = topic.technicalBackground;
    reasonForAdjJoinController.text = topic.reasonForAdjJoin;
    githubLinkController.text = topic.githubLink;
    supplementalURLsController.text = topic.supplementalURLs;
  }

  String? rbxAddressValidator(String? value) => formValidatorRbxAddress(value, false);
  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");
  String? descriptionValidator(String? val) => formValidatorNotEmpty(val, "Description");

  List<ValueLabel<Provider>> providerOptions(BuildContext context) {
    return providerValueLabels(context);
  }

  List<ValueLabel<OS>> osOptions(BuildContext context) {
    return osValueLabels(context);
  }

  List<ValueLabel<HDSizeSpecifier>> hdSizeSpecifierOptions(BuildContext context) {
    return hdSizeSpecifierValueLabels(context);
  }

  setProvider(Provider? provider) {
    if (provider == null) return;
    state = state.copyWith(provider: provider);
  }

  setMachineOs(OS? machineOs) {
    if (machineOs == null) return;
    state = state.copyWith(machineOs: machineOs);
  }

  setHdSizeSpecifier(HDSizeSpecifier? machineHDDSpecifier) {
    if (machineHDDSpecifier == null) return;
    state = state.copyWith(machineHDDSpecifier: machineHDDSpecifier);
  }

  clear() {
    load(AdjVote.empty());
  }

  Map<String, dynamic> serialize() {
    return state.toJson();
  }
}

final adjVoteFormProvider = StateNotifierProvider<AdjVoteFormProvider, AdjVote>((ref) {
  return AdjVoteFormProvider(ref.read, AdjVote.empty());
});
