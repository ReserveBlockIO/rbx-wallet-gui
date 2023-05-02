import 'package:auto_route/auto_route.dart';
import 'package:base58check/base58.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/web/components/web_no_wallet.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_bid_detail_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/base_screen.dart';

class BuildSaleStartTxScreen extends BaseScreen {
  final String scId;
  final int bidId;

  const BuildSaleStartTxScreen({
    Key? key,
    @PathParam('scId') required this.scId,
    @PathParam('bidId') required this.bidId,
  }) : super(key: key, includeWebDrawer: true, horizontalPadding: 0, verticalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Send Sale Start TX"),
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider).keypair;

    if (keypair == null) {
      return WebNotWallet();
    }

    final data = ref.watch(webBidDetailProvider(bidId));

    return data.when(
      error: (_, __) => Center(child: Text("Error: Bid not found.")),
      loading: () => CenteredLoader(),
      data: (bid) {
        if (bid == null) {
          return Center(child: Text("Error: Bid not found."));
        }
        final toAddress = bid.address;
        final bidSignature = bid.signature;
        final purchaseKey = bid.purchaseKey;
        final amount = bid.amount;

        return Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: glowingBox,
            ),
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Please approve the Sale Start TX for your shop purchase.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text("Smart Contract ID: $scId"),
                    Text("Buyer: $toAddress"),
                    Text("Amount: $amount"),
                    SizedBox(
                      height: 16,
                    ),
                    AppButton(
                      label: "Start Transaction",
                      variant: AppColorVariant.Success,
                      onPressed: () async {
                        final txService = RawService();

                        final message = scId;

                        final beaconSignature = await RawTransaction.getSignature(
                          message: message,
                          privateKey: keypair.private,
                          publicKey: keypair.public,
                        );

                        if (beaconSignature == null) {
                          Toast.error("Couldn't produce beacon upload signature");
                          return false;
                        }

                        final locator = await RawService().beaconUpload(scId, toAddress, beaconSignature);

                        if (locator == null) {
                          Toast.error("Could not create beacon upload request.");
                          return false;
                        }

                        var txPayload = {
                          "Function": "Sale_Start()",
                          "ContractUID": scId,
                          "NextOwner": toAddress,
                          "SoldFor": amount,
                          "KeySign": purchaseKey,
                          "BidSignature": bidSignature,
                          "Locators": locator,
                        };

                        final timestamp = await txService.getTimestamp();
                        if (timestamp == null) {
                          Toast.error("Could not get timestamp");
                          return false;
                        }

                        final nonce = await txService.getNonce(keypair.address);
                        if (nonce == null) {
                          Toast.error("Could not get nonce");
                          return false;
                        }

                        var txData = RawTransaction.buildTransaction(
                          toAddress: toAddress,
                          fromAddress: keypair.address,
                          type: TxType.nftSale,
                          amount: 0,
                          nonce: nonce,
                          timestamp: timestamp,
                          data: txPayload,
                        );

                        final fee = await txService.getFee(txData);
                        if (fee == null) {
                          Toast.error("Could not get fee");
                          return false;
                        }

                        txData = RawTransaction.buildTransaction(
                          toAddress: toAddress,
                          fromAddress: keypair.address,
                          type: TxType.nftSale,
                          amount: 0,
                          nonce: nonce,
                          timestamp: timestamp,
                          data: txPayload,
                          fee: fee,
                        );

                        final hash = await txService.getHash(txData);
                        if (hash == null) {
                          Toast.error("Could not generate hash");
                          return false;
                        }

                        final signature = await RawTransaction.getSignature(
                          message: hash,
                          privateKey: keypair.private,
                          publicKey: keypair.public,
                        );

                        if (signature == null) {
                          Toast.error("Signature generation failed.");
                          return false;
                        }

                        final isValid = await txService.validateSignature(
                          hash,
                          keypair.address,
                          signature,
                        );

                        if (!isValid) {
                          Toast.error("Signature not valid (primary)");
                          return false;
                        }

                        txData = RawTransaction.buildTransaction(
                          toAddress: toAddress,
                          fromAddress: keypair.address,
                          type: TxType.nftSale,
                          amount: 0,
                          nonce: nonce,
                          timestamp: timestamp,
                          data: txPayload,
                          fee: fee,
                          hash: hash,
                          signature: signature,
                        );

                        final verifyTransactionData = (await txService.sendTransaction(
                          transactionData: txData,
                          execute: false,
                        ));

                        if (verifyTransactionData == null) {
                          Toast.error("Could not verify transaction");
                          return false;
                        }

                        if (verifyTransactionData['Result'] != "Success") {
                          print(verifyTransactionData['Message']);
                          Toast.error(verifyTransactionData['Message']);
                          return false;
                        }

                        Toast.message(verifyTransactionData['Message']);

                        final tx = await txService.sendTransaction(
                          transactionData: txData,
                          execute: true,
                        );

                        if (tx != null) {
                          if (tx['Result'] == "Success") {
                            Toast.message("TX Broadcasted");
                            return true;
                          }
                        }

                        Toast.error();
                        return false;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
