import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/app_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../adnr/providers/adnr_pending_provider.dart';
import '../../bridge/providers/log_provider.dart';
import '../services/btc_service.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../../../utils/toast.dart';
import 'package:collection/collection.dart';

import '../../bridge/models/log_entry.dart';

part 'btc_adnr_create_form_provider.freezed.dart';

@freezed
abstract class BtcAdnrCreateFormState with _$BtcAdnrCreateFormState {
  const BtcAdnrCreateFormState._();

  factory BtcAdnrCreateFormState({
    String? btcAddress,
    String? selectedAddress,
    @Default("") String name,
  }) = _BtcAdnrCreateFormState;
}

class BtcAdnrCreateFormProvider extends StateNotifier<BtcAdnrCreateFormState> {
  final Ref ref;
  BtcAdnrCreateFormProvider(this.ref) : super(BtcAdnrCreateFormState());

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  initWithData({required String btcAddress, String? selectedAddress, String name = ''}) {
    state = state.copyWith(
      btcAddress: btcAddress,
      selectedAddress: selectedAddress,
      name: name,
    );

    nameController.text = name;
  }

  setSelectedAddress(String address) {
    state = state.copyWith(selectedAddress: address);
  }

  String? nameValidator(String? value) {
    value = value?.trim() ?? '';
    value = value.replaceAll(".btc", "");

    if (value.isEmpty) {
      return "Domain Name Required";
    }

    if (value.length > BTC_ADNR_MAX_LENGTH) {
      return "Domain must be less than ${BTC_ADNR_MAX_LENGTH + 1} charcters.";
    }

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return "Invalid domain. Must only contain letters and/or numbers.";
    }

    return null;
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    if (state.btcAddress == null) {
      Toast.error("Selecting a BTC address is required.");
      return null;
    }

    if (state.selectedAddress == null) {
      Toast.error("Selecting a VFX Address is required.");
      return null;
    }

    final wallet = ref.read(walletListProvider).firstWhereOrNull((w) => w.address == state.selectedAddress);

    if (wallet == null) {
      Toast.error("The VFX account that controls this BTC domain was not found. [${state.selectedAddress}]");
      return null;
    }

    if (wallet.balance < (ADNR_COST + MIN_RBX_FOR_SC_ACTION)) {
      Toast.error("Not enough VFX in your controlling account to delete a VFX domain. [${state.selectedAddress}]");
      return null;
    }

    final nameValue = nameController.text.trim().replaceAll(".btc", "");

    ref.read(globalLoadingProvider.notifier).start();

    final hash = await BtcService().createAdnr(
      address: state.selectedAddress!,
      btcAddress: state.btcAddress!,
      name: nameValue,
    );

    ref.read(globalLoadingProvider.notifier).complete();

    if (hash != null) {
      ref.read(adnrPendingProvider.notifier).addId(state.btcAddress!, "create", 'null');
      ref.read(logProvider.notifier).append(
            LogEntry(message: "BTC Domain Create TX Sent: $hash", textToCopy: hash, variant: AppColorVariant.Btc),
          );
      state = BtcAdnrCreateFormState();
      return true;
    }

    return false;
  }
}

final btcAdnrCreateFormProvider = StateNotifierProvider<BtcAdnrCreateFormProvider, BtcAdnrCreateFormState>((ref) {
  return BtcAdnrCreateFormProvider(ref);
});
