import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/theme/app_theme.dart';
import '../../adnr/providers/adnr_pending_provider.dart';
import '../../bridge/providers/log_provider.dart';
import '../services/btc_service.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';

import '../../bridge/models/log_entry.dart';

part 'btc_adnr_transfer_form_provider.freezed.dart';

@freezed
abstract class BtcAdnrTransferFormState with _$BtcAdnrTransferFormState {
  const BtcAdnrTransferFormState._();

  factory BtcAdnrTransferFormState({
    String? fromBtcAddress,
    String? domainName,
  }) = _BtcAdnrTransferFormState;
}

class BtcAdnrTransferFormProvider extends StateNotifier<BtcAdnrTransferFormState> {
  final Ref ref;
  BtcAdnrTransferFormProvider(this.ref) : super(BtcAdnrTransferFormState());

  final formKey = GlobalKey<FormState>();

  final toBtcAddressController = TextEditingController();
  final toRbxAddressController = TextEditingController();

  initWithFromBtcAddress({required String fromBtcAddress, required String? domainName}) {
    state = state.copyWith(
      fromBtcAddress: fromBtcAddress,
      domainName: domainName,
    );
  }

  String? toBtcAddressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "To BTC address required.";
    }
    return null;
  }

  String? toRbxAddressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "To VFX address required.";
    }

    return formValidatorRbxAddress(value);
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    if (state.fromBtcAddress == null) {
      Toast.error("Selecting a BTC address is required.");
      return false;
    }

    final toBtcAddress = toBtcAddressController.text.trim();
    final toRbxAddress = toRbxAddressController.text.trim();

    ref.read(globalLoadingProvider.notifier).start();

    final hash = await BtcService().transferAdnr(
      fromBtcAddress: state.fromBtcAddress!,
      toBtcAddress: toBtcAddress,
      toRbxAddress: toRbxAddress,
    );

    ref.read(globalLoadingProvider.notifier).complete();
    ref.read(adnrPendingProvider.notifier).addId(state.fromBtcAddress!, "transfer", state.domainName ?? 'null');

    state = BtcAdnrTransferFormState();

    return true;
  }
}

final btcAdnrTransferFormProvider = StateNotifierProvider<BtcAdnrTransferFormProvider, BtcAdnrTransferFormState>((ref) {
  return BtcAdnrTransferFormProvider(ref);
});
