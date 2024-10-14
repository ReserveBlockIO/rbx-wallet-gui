import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../btc_web/services/btc_web_service.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../bridge/models/log_entry.dart';
import '../../bridge/providers/log_provider.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../raw/raw_service.dart';
import '../../web/utils/raw_transaction.dart';
import '../providers/adnr_pending_provider.dart';
import '../services/adnr_service.dart';

class CreateAdnrDialog extends BaseComponent {
  final String address;
  final String? adnr;
  final bool isBtc;
  const CreateAdnrDialog({
    required this.address,
    required this.adnr,
    this.isBtc = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return AlertDialog(
      title: Text(isBtc ? "New BTC Domain" : "New VFX Domain"),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${isBtc ? 'BTC' : 'VFX'} Domains cost $ADNR_COST VFX."),
              Text(
                "Your domain must only contain letters and numbers and will automatically be appended with ${isBtc ? '".btc"' : '".vfx"'} upon verification",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextFormField(
                controller: controller,
                validator: (value) => formValidatorAlphaNumeric(value, "Domain Name"),
                decoration: InputDecoration(label: Text("Domain Name"), suffix: Text(isBtc ? '.btc' : '.vfx')),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white38),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }

            if (address.length > 65) {
              Toast.error("Maximum characters for domain is 65");
              return;
            }

            if (kIsWeb) {
              final keyPair = ref.read(webSessionProvider).keypair;
              if (keyPair == null) {
                Toast.error("No account");
                return;
              }

              final domainWithoutSuffix = controller.text;
              final domain = "$domainWithoutSuffix.${isBtc ? 'btc' : 'vfx'}";

              ref.read(globalLoadingProvider.notifier).start();

              final available = await ExplorerService().adnrAvailable(domain);

              if (!available) {
                ref.read(globalLoadingProvider.notifier).complete();
                Toast.error("This ${isBtc ? 'BTC' : 'VFX'} Domain already exists");
                return;
              }
              final btcAddress = isBtc ? ref.read(webSessionProvider).btcKeypair?.address : null;
              if (isBtc && btcAddress == null) {
                Toast.error("No BTC Address Found");
                return;
              }
              final btcWif = ref.read(webSessionProvider).btcKeypair?.wif;
              if (isBtc && btcWif == null) {
                Toast.error("No BTC WIF Private Key Found");
                return;
              }

              String? btcMessage;
              String? btcSignature;

              if (isBtc) {
                // btcMessage = "1711996047";
                btcMessage = (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();
                btcSignature = await BtcWebService().signMessage(ref.read(webSessionProvider).btcKeypair!.wif, btcMessage);
                print("SIGNATURE: $btcSignature");
              }

              final data = isBtc
                  ? {
                      "Function": "BTCAdnrCreate()",
                      "Name": domainWithoutSuffix,
                      "BTCAddress": btcAddress,
                      "Message": btcMessage,
                      "Signature": btcSignature,
                    }
                  : {"Function": "AdnrCreate()", "Name": domainWithoutSuffix};

              print(data);

              final txData = await RawTransaction.generate(
                keypair: ref.read(webSessionProvider).keypair!,
                amount: ADNR_COST,
                toAddress: "Adnr_Base",
                txType: TxType.adnr,
                data: data,
              );

              ref.read(globalLoadingProvider.notifier).complete();

              if (txData == null) {
                Toast.error("Invalid transaction data.");
                return;
              }

              final txFee = txData['Fee'];

              final confirmed = await ConfirmDialog.show(
                title: "Valid Transaction",
                body:
                    "The ${isBtc ? 'BTC' : 'VFX'} Domain transaction is valid.\nAre you sure you want to proceed?\n\nDomain: $domain\nAmount: $ADNR_COST VFX\nFee: $txFee VFX\nTotal: ${ADNR_COST + txFee} VFX",
                confirmText: "Send",
                cancelText: "Cancel",
              );

              if (confirmed != true) {
                Navigator.of(context).pop();
                return;
              }
              ref.read(globalLoadingProvider.notifier).start();

              final tx = await RawService().sendTransaction(transactionData: txData, execute: true, widgetRef: ref);
              ref.read(globalLoadingProvider.notifier).complete();

              if (tx != null && tx['Result'] == "Success") {
                ref.read(adnrPendingProvider.notifier).addId(address, "create", "null");
                Toast.message("${isBtc ? 'BTC' : 'VFX'} Domain Transaction has been broadcasted. See log for hash.");
                Navigator.of(context).pop();

                return;
              }

              Toast.error();
            } else {
              ref.read(globalLoadingProvider.notifier).start();
              final result = await AdnrService().createAdnr(address, controller.text);
              ref.read(globalLoadingProvider.notifier).complete();

              if (result.success) {
                Toast.message("VFX Domain Transaction has been broadcasted. See log for hash.");
                if (result.hash != null) {
                  ref.read(logProvider.notifier).append(
                        LogEntry(
                            message: "ADNR create transaction broadcasted. Tx Hash: ${result.hash}",
                            textToCopy: result.hash,
                            variant: AppColorVariant.Success),
                      );

                  ref.read(adnrPendingProvider.notifier).addId(address, "create", adnr ?? "null");
                }

                Navigator.of(context).pop();
                return;
              }

              Toast.error(result.message);
            }
          },
          child: const Text(
            "Create",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
