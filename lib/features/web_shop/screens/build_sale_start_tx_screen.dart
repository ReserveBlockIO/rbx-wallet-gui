import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_constants.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/auth_utils.dart';
import '../../auth/components/auth_type_modal.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../raw/raw_service.dart';
import '../../web/utils/raw_transaction.dart';
import '../providers/web_bid_detail_provider.dart';
import '../../../utils/toast.dart';

import '../../../core/base_screen.dart';

class BuildSaleStartTxScreen extends BaseScreen {
  final String scId;
  final int bidId;
  final String ownerAddress;

  const BuildSaleStartTxScreen({
    Key? key,
    @PathParam('scId') required this.scId,
    @PathParam('bidId') required this.bidId,
    @PathParam('ownerAddress') required this.ownerAddress,
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
    bool completed = false;

    return Builder(
      builder: (context) {
        final keypair = ref.watch(webSessionProvider.select((v) => v.keypair));
        if (keypair == null || ownerAddress != keypair.address) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "To to authorize this transaction, you must sign in as",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  ownerAddress,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                AppButton(
                  label: "Sign In",
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                      context: context,
                      builder: (context) {
                        return AuthTypeModal(
                          handleMneumonic: () async {
                            await handleRecoverFromMnemonic(context, ref);
                            if (ref.read(webSessionProvider).isAuthenticated) {
                              // redirectToDashboard();
                              if (ownerAddress == ref.read(webSessionProvider).keypair?.address) {
                                Toast.message("Logged in successfully");
                              } else {
                                Toast.error("Incorrect login details for $ownerAddress.");
                              }
                            } else {
                              Toast.error("Could not login");
                            }
                            AutoRouter.of(context).pop();
                          },
                          handleUsername: () {
                            AuthModal.show(
                              context: context,
                              forCreate: false,
                              onValidSubmission: (auth) async {
                                await handleCreateWithEmail(context, ref, auth.email, auth.password, false);

                                if (ref.read(webSessionProvider).isAuthenticated) {
                                  // redirectToDashboard();
                                  if (ownerAddress == ref.read(webSessionProvider).keypair?.address) {
                                    Toast.message("Logged in successfully");
                                  } else {
                                    Toast.error("Incorrect login details for $ownerAddress.");
                                  }
                                } else {
                                  Toast.error("Could not login");
                                }
                                AutoRouter.of(context).pop();
                              },
                            );
                          },
                          handlePrivateKey: (context) async {
                            await handleImportWithPrivateKey(context, ref).then((value) {
                              AutoRouter.of(context).pop();

                              if (ref.read(webSessionProvider).isAuthenticated) {
                                // redirectToDashboard();
                                if (ownerAddress == ref.read(webSessionProvider).keypair?.address) {
                                  Toast.message("Logged in successfully");
                                } else {
                                  Toast.error("Incorrect login details for $ownerAddress.");
                                }
                              } else {
                                Toast.error("Could not login");
                              }
                              AutoRouter.of(context).pop();
                            });
                            // await Future.delayed(const Duration(milliseconds: 300));
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
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
                    child: StatefulBuilder(builder: (context, setState) {
                      if (completed) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Transaction Sent.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }

                      return Column(
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
                              ref.read(globalLoadingProvider.notifier).start();
                              final txService = RawService();

                              String? locator;

                              final message = scId;

                              final beaconSignature = await RawTransaction.getSignature(
                                message: message,
                                privateKey: keypair.private,
                                publicKey: keypair.public,
                              );

                              if (beaconSignature == null) {
                                Toast.error("Couldn't produce beacon upload signature");
                                ref.read(globalLoadingProvider.notifier).complete();

                                return false;
                              }

                              locator = await RawService().beaconUpload(scId, toAddress, beaconSignature);

                              if (locator == null) {
                                // Toast.error("Could not create beacon upload request.");
                                await Future.delayed(Duration(seconds: 3));

                                locator = await RawService().beaconUpload(scId, toAddress, beaconSignature);

                                if (locator == null) {
                                  print("Could not create beacon upload request.");
                                }
                              }

                              var txPayload = {
                                "Function": "Sale_Start()",
                                "ContractUID": scId,
                                "NextOwner": toAddress,
                                "SoldFor": amount,
                                "KeySign": purchaseKey,
                                "BidSignature": bidSignature,
                                "Locators": locator ?? "NA",
                              };

                              final timestamp = await txService.getTimestamp();
                              if (timestamp == null) {
                                Toast.error("Could not get timestamp");
                                ref.read(globalLoadingProvider.notifier).complete();
                                return false;
                              }

                              final nonce = await txService.getNonce(keypair.address);
                              if (nonce == null) {
                                Toast.error("Could not get nonce");
                                ref.read(globalLoadingProvider.notifier).complete();
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
                                ref.read(globalLoadingProvider.notifier).complete();
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
                                ref.read(globalLoadingProvider.notifier).complete();
                                return false;
                              }

                              final signature = await RawTransaction.getSignature(
                                message: hash,
                                privateKey: keypair.private,
                                publicKey: keypair.public,
                              );

                              if (signature == null) {
                                Toast.error("Signature generation failed.");
                                ref.read(globalLoadingProvider.notifier).complete();
                                return false;
                              }

                              final isValid = await txService.validateSignature(
                                hash,
                                keypair.address,
                                signature,
                              );

                              if (!isValid) {
                                Toast.error("Signature not valid (primary)");
                                ref.read(globalLoadingProvider.notifier).complete();
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
                                ref.read(globalLoadingProvider.notifier).complete();
                                return false;
                              }

                              if (verifyTransactionData['Result'] != "Success") {
                                print(verifyTransactionData['Message']);
                                Toast.error(verifyTransactionData['Message']);
                                ref.read(globalLoadingProvider.notifier).complete();
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
                                  ref.read(globalLoadingProvider.notifier).complete();

                                  setState(() {
                                    completed = true;
                                  });
                                  return true;
                                }
                              }

                              Toast.error();
                              ref.read(globalLoadingProvider.notifier).complete();
                              return false;
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
