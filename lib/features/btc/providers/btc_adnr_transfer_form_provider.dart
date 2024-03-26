import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/adnr/providers/adnr_pending_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:collection/collection.dart';

import '../../bridge/models/log_entry.dart';

part 'btc_adnr_transfer_form_provider.freezed.dart';

@freezed
abstract class BtcAdnrTransferFormState with _$BtcAdnrTransferFormState {
  const BtcAdnrTransferFormState._();

  factory BtcAdnrTransferFormState({
    String? fromBtcAddress,
  }) = _BtcAdnrTransferFormState;
}

class BtcAdnrTransferFormProvider extends StateNotifier<BtcAdnrTransferFormState> {
  final Ref ref;
  BtcAdnrTransferFormProvider(this.ref) : super(BtcAdnrTransferFormState());

  final formKey = GlobalKey<FormState>();

  final toBtcAddressController = TextEditingController();
  final toRbxAddressController = TextEditingController();

  initWithFromBtcAddress({required String fromBtcAddress}) {
    state = state.copyWith(
      fromBtcAddress: fromBtcAddress,
    );
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    //   if (state.btcAddress == null) {
    //     Toast.error("Selecting a BTC address is required.");
    //     return null;
    //   }

    //   if (state.selectedAddress == null) {
    //     Toast.error("Selecting an RBX Address is required.");
    //     return null;
    //   }

    //   final wallet = ref.read(walletListProvider).firstWhereOrNull((w) => w.address == state.selectedAddress);

    //   if (wallet == null) {
    //     Toast.error("The RBX wallet that controls this BTC domain was not found. [${state.selectedAddress}]");
    //     return null;
    //   }

    //   if (wallet.balance < (ADNR_COST + MIN_RBX_FOR_SC_ACTION)) {
    //     Toast.error("Not enough RBX in your controlling wallet to delete an RBX domain. [${state.selectedAddress}]");
    //     return null;
    //   }

    //   final nameValue = nameController.text.trim().replaceAll(".btc", "");

    //   ref.read(globalLoadingProvider.notifier).start();

    //   final hash = await BtcService().createAdnr(
    //     address: state.selectedAddress!,
    //     btcAddress: state.btcAddress!,
    //     name: nameValue,
    //   );

    //   ref.read(globalLoadingProvider.notifier).complete();

    //   if (hash != null) {
    //     ref.read(adnrPendingProvider.notifier).addId(state.btcAddress!, "create", nameValue);
    //     ref.read(logProvider.notifier).append(
    //           LogEntry(message: "BTC Domain Create TX Sent: $hash", textToCopy: hash, variant: AppColorVariant.Btc),
    //         );
    //     return true;
    //   }

    //   return false;
  }
}

final btcAdnrTransferFormProvider = StateNotifierProvider<BtcAdnrTransferFormProvider, BtcAdnrTransferFormState>((ref) {
  return BtcAdnrTransferFormProvider(ref);
});
