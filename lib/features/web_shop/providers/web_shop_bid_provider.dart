import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/dst/models/bid.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/transactions/providers/web_transaction_list_provider.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_collection_detail_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_listing_list_provider.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
import 'package:collection/collection.dart';

class WebBidListProvider extends StateNotifier<List<Bid>> {
  final Ref ref;
  final int listingId;

  WebBidListProvider(this.ref, this.listingId) : super([]);

  // Future<List<Bid>> fetchBids([OrganizedListing? listing]) async {
  //   List<Bid> globalBids = [];
  //   if (listing != null) {
  //     globalBids = await RemoteShopService().getBidsByListingId(listing.id);

  //   }

  //   final myBids = await DstService().listBuyerBids(listingId);

  //   final bids = [...myBids];

  //   for (final b in globalBids) {
  //     final exists = bids.firstWhereOrNull((bid) => bid.bidSignature == b.bidSignature) != null;
  //     if (!exists) {
  //       bids.add(b);
  //     }
  //   }

  //   bids.sort((a, b) => a.bidSendTime > b.bidSendTime ? -1 : 1);

  //   ref.read(connectedShopProvider.notifier).refresh(true);

  //   state = bids;
  //   return bids;
  // }

  bool validateBeforeBid(WebListing listing, double amount) {
    if (kIsWeb) {
      final balance = ref.read(webSessionProvider).balance;
      if (balance == null) {
        Toast.error("No Balance");
        return false;
      }

      if (balance < (amount + MIN_RBX_FOR_SC_ACTION)) {
        Toast.error("Not enough balance.");
        return false;
      }

      return true;
    }
    final wallet = ref.read(sessionProvider).currentWallet;

    if (wallet == null) {
      Toast.error("No wallet selected");
      return false;
    }

    if (wallet.balance < (amount + MIN_RBX_FOR_SC_ACTION)) {
      Toast.error("Not enough balance.");
      return false;
    }

    if (wallet.isValidating) {
      if (wallet.balance < (amount + MIN_RBX_FOR_SC_ACTION + ASSURED_AMOUNT_TO_VALIDATE)) {
        Toast.error("Not enough balance since you are validating.");
        return false;
      }
    }

    return true;
  }

  Future<String?> getBidSignature(String purchaseKey, double amount, Keypair keypair) async {
    const bidModifier = 100000000;

    final modifiedAmount = (amount * bidModifier).round();

    final message = "${purchaseKey}_${modifiedAmount}_${keypair.address}";

    print("message: $message");

    return await RawTransaction.getSignature(message: message, privateKey: keypair.private, publicKey: keypair.public);
  }

  Future<dynamic> buildSaleCompleteTx(Nft nft, double amount, String buyerAddress, String keySign) async {
    final txService = RawService();
    final keypair = ref.read(webSessionProvider).keypair;

    if (keypair == null) {
      Toast.error("no wallet");
      return;
    }

    final scId = nft.id;
    final currentOwnerAddress = nft.currentOwner;

    final royaltyType = nft.royalty?.type;
    double? royaltyAmount = nft.royalty?.amount;
    final royaltyAddress = nft.royalty?.address;

    double amountLessRoyalty = amount;

    final timestamp = await txService.getTimestamp();
    if (timestamp == null) {
      Toast.error("Could not get timestamp");
      return false;
    }

    final nonce = await txService.getNonce(buyerAddress);
    if (nonce == null) {
      Toast.error("Could not get nonce");
      return false;
    }

    final List<Map<String, dynamic>> subTxs = [];
    bool hasRoyalty = false;

    if (royaltyAmount != null && royaltyAddress != null) {
      hasRoyalty = true;

      if (royaltyType == RoyaltyType.percent) {
        royaltyAmount = (royaltyAmount * amount);
      }

      amountLessRoyalty = amount - royaltyAmount;

      final Map<String, dynamic> royaltyPayload = {
        "Function": "Sale_Complete()",
        "ContractUID": scId,
        "Royalty": true,
        "RoyaltyAmount": royaltyAmount,
        "RoyaltyPaidTo": royaltyAddress,
        "TXNum": "2/2"
      };

      var royaltyData = RawTransaction.buildTransaction(
        toAddress: royaltyAddress,
        fromAddress: buyerAddress,
        type: TxType.nftSale,
        amount: royaltyAmount,
        nonce: nonce,
        timestamp: timestamp,
        data: royaltyPayload,
      );

      final fee = await txService.getFee(royaltyData);
      if (fee == null) {
        Toast.error("Could not get fee");
        return false;
      }

      royaltyData = RawTransaction.buildTransaction(
        toAddress: royaltyAddress,
        fromAddress: buyerAddress,
        type: TxType.nftSale,
        amount: royaltyAmount,
        nonce: nonce,
        timestamp: timestamp,
        data: royaltyPayload,
        fee: fee,
      );

      final hash = await txService.getHash(royaltyData);
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
        Toast.error("Signature not valid");
        return false;
      }

      royaltyData = RawTransaction.buildTransaction(
        toAddress: royaltyAddress,
        fromAddress: buyerAddress,
        type: TxType.nftSale,
        amount: royaltyAmount,
        nonce: nonce,
        timestamp: timestamp,
        data: royaltyPayload,
        fee: fee,
        hash: hash,
        signature: signature,
      );

      subTxs.add(royaltyData);
    }

    final Map<String, dynamic> payloadObject = hasRoyalty
        ? {
            "Function": "Sale_Complete()",
            "ContractUID": scId,
            "TXNum": "1/2",
            "Royalty": true,
          }
        : {
            "Function": "Sale_Complete()",
            "ContractUID": scId,
          };

    final payload = jsonEncode(payloadObject);

    var txData = RawTransaction.buildTransaction(
      toAddress: currentOwnerAddress,
      fromAddress: buyerAddress,
      type: TxType.nftSale,
      amount: amountLessRoyalty,
      nonce: nonce,
      timestamp: timestamp,
      data: payload,
    );

    final fee = await txService.getFee(txData);
    if (fee == null) {
      Toast.error("Could not get fee");
      return false;
    }

    txData = RawTransaction.buildTransaction(
      toAddress: currentOwnerAddress,
      fromAddress: buyerAddress,
      type: TxType.nftSale,
      amount: amountLessRoyalty,
      nonce: nonce,
      timestamp: timestamp,
      data: payload,
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
      Toast.error("Signature not valid");
      return false;
    }

    txData = RawTransaction.buildTransaction(
      toAddress: currentOwnerAddress,
      fromAddress: buyerAddress,
      type: TxType.nftSale,
      amount: amountLessRoyalty,
      nonce: nonce,
      timestamp: timestamp,
      data: payload,
      fee: fee,
      hash: hash,
      signature: signature,
    );

    subTxs.add(txData);

    var primaryTxPayload = {
      "Function": "Sale_Complete()",
      "ContractUID": scId,
      "Royalty": hasRoyalty,
      "RoyaltyAmount": royaltyAmount,
      "RoyaltyPayTo": royaltyAddress,
      "Transactions": subTxs,
      "KeySign": keySign
    };

    var primaryTxData = RawTransaction.buildTransaction(
      toAddress: currentOwnerAddress,
      fromAddress: buyerAddress,
      type: TxType.nftSale,
      amount: 0,
      nonce: nonce,
      timestamp: timestamp,
      data: primaryTxPayload,
    );

    final primaryFee = await txService.getFee(primaryTxData);
    if (primaryFee == null) {
      Toast.error("Could not get fee");
      return false;
    }

    primaryTxData = RawTransaction.buildTransaction(
      toAddress: currentOwnerAddress,
      fromAddress: buyerAddress,
      type: TxType.nftSale,
      amount: 0,
      nonce: nonce,
      timestamp: timestamp,
      data: primaryTxPayload,
      fee: primaryFee,
    );

    final hashPrimary = await txService.getHash(primaryTxData);
    if (hashPrimary == null) {
      Toast.error("Could not generate hash");
      return false;
    }

    final signaturePrimary = await RawTransaction.getSignature(
      message: hashPrimary,
      privateKey: keypair.private,
      publicKey: keypair.public,
    );

    if (signaturePrimary == null) {
      Toast.error("Signature generation failed.");
      return false;
    }

    final isValidPrimary = await txService.validateSignature(
      hashPrimary,
      keypair.address,
      signaturePrimary,
    );

    if (!isValidPrimary) {
      Toast.error("Signature not valid (primary)");
      return false;
    }

    primaryTxData = RawTransaction.buildTransaction(
      toAddress: currentOwnerAddress,
      fromAddress: buyerAddress,
      type: TxType.nftSale,
      amount: 0,
      nonce: nonce,
      timestamp: timestamp,
      data: primaryTxPayload,
      fee: primaryFee,
      hash: hashPrimary,
      signature: signaturePrimary,
    );

    print("-----");
    print(jsonEncode(primaryTxData));
    print("-----");

    final verifyTransactionData = (await txService.sendTransaction(
      transactionData: primaryTxData,
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
      transactionData: primaryTxData,
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
  }

  Future<void> waitForSaleStart(Nft nft, String buyerAddress, double amount) async {
    final txs = ref.read(webTransactionListProvider(buyerAddress)).transactions;

    String? keySign;
    for (final t in txs) {
      if (t.type == TxType.nftSale) {
        final function = t.nftDataValue("Function");
        if (function == "Sale_Start()") {
          final scId = t.nftDataValue("ContractUID");
          if (scId == nft.id) {
            final owner = t.nftDataValue("NextOwner");
            if (owner == buyerAddress) {
              keySign = t.nftDataValue("KeySign");
              if (keySign != null) {
                break;
              }
            }
          }
        }
      }
    }

    if (keySign != null) {
      print("FOUND THE TX YO");
      buildSaleCompleteTx(nft, amount, buyerAddress, keySign);
      return;
    }

    await Future.delayed(Duration(seconds: 11));

    return await waitForSaleStart(nft, buyerAddress, amount);
  }

  Future<bool?> buyNow(BuildContext context, WebListing listing) async {
    if (!kIsWeb) {
      if (!guardWalletIsSynced(ref)) {
        return null;
      }
    }

    if (!validateBeforeBid(listing, listing.buyNowPrice!)) {
      return null;
    }

    final confirmed = await ConfirmDialog.show(
      context: context,
      title: "Buy Now",
      body: "Are you sure you want to buy now for ${listing.buyNowPrice} RBX?",
      confirmText: "Buy Now",
      cancelText: "Cancel",
    );

    if (confirmed != true) {
      return null;
    }

    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;
    if (address == null) {
      Toast.error("No Wallet");
      return null;
    }

    String? signature;

    if (kIsWeb) {
      final keypair = ref.read(webSessionProvider).keypair;
      if (keypair == null) {
        Toast.error("No Wallet");
        return null;
      }

      signature = await getBidSignature(listing.purchaseKey, listing.buyNowPrice!, keypair);

      if (signature == null) {
        Toast.error("Could not produce signature");
        return null;
      }
    }

    final success = await WebShopService().sendBid(
      amount: listing.buyNowPrice!,
      address: address,
      listingId: listing.id,
      isBuyNow: true,
      signature: signature,
    );

    if (kIsWeb) {
      waitForSaleStart(listing.nft!.smartContract, address, listing.buyNowPrice!);

      if (success) {
        Toast.message("Buy Now TX broadcasted. Please wait for it to be accepted by the shop owner");
      }
    } else {
      final coreBid = Bid.create(
        address: address,
        listingId: listingId,
        collectionId: listing.collection.id,
        bidAmount: listing.buyNowPrice!,
        maxBidAmount: listing.buyNowPrice!,
        purchaseKey: listing.purchaseKey,
        isBuyNow: true,
        bidStatus: success ? BidStatus.Rejected : BidStatus.Accepted,
      );

      final bidSaved = await RemoteShopService().sendBid(coreBid, listing.id);

      return bidSaved && success;
    }

    return success;
  }

  Future<bool?> sendBid(BuildContext context, WebListing listing) async {
    print("sendBid");
    if (!kIsWeb) {
      if (!guardWalletIsSynced(ref)) {
        return null;
      }
    }

    if (listing.auction == null) {
      Toast.error("Auction is not live");
      return null;
    }

    if (!listing.isActive) {
      Toast.error("Auction is over");
      return null;
    }

    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;

    if (address == null) {
      Toast.error("No wallet");
      return null;
    }

    final minimumBid = listing.auction?.currentBidPrice ?? listing.floorPrice! + (listing.auction?.incrementAmount ?? 0.01);
    print(minimumBid);
    final amountStr = await PromptModal.show(
      contextOverride: context,
      title: "Place Bid",
      validator: (val) => formValidatorNumber(val, "Bid Amount"),
      labelText: "Bid Amount (RBX)",
      footer: "Must be greater than $minimumBid RBX",
      confirmText: "Continue",
      cancelText: "Cancel",
    );

    if (amountStr == null) {
      return null;
    }

    final amount = double.tryParse(amountStr);
    if (amount == null) {
      Toast.error("Invalid amount");
      return null;
    }

    if (listing.auction == null) {
      Toast.error("No auction");
      return null;
    }

    if (amount <= listing.auction!.currentBidPrice!) {
      Toast.error("Your bid must be greater than the current highest bid (${listing.auction!.currentBidPrice} RBX)");
      return null;
    }

    if (amount <= listing.auction!.currentBidPrice! + listing.auction!.incrementAmount) {
      Toast.error(
          "The minimum increment amount is ${listing.auction!.incrementAmount} RBX. A bid grater than ${listing.auction!.currentBidPrice! + listing.auction!.incrementAmount} RBX is required.");
      return null;
    }

    double maxAmount = amount;

    if (!validateBeforeBid(listing, listing.floorPrice!)) {
      return null;
    }

    final confirmed = await ConfirmDialog.show(
      context: context,
      title: "Place Bid",
      body: "Are you sure you want to place a bid of $amount RBX${amount != maxAmount ? ' with a max bid of $maxAmount RBX' : ''}?",
      confirmText: "Place Bid",
      cancelText: "Cancel",
    );

    if (confirmed != true) {
      return null;
    }

    String? signature;

    if (kIsWeb) {
      final keypair = ref.read(webSessionProvider).keypair;
      if (keypair == null) {
        Toast.error("No Wallet");
        return null;
      }

      signature = await getBidSignature(listing.purchaseKey, amount, keypair);

      if (signature == null) {
        Toast.error("Could not produce signature");
        return null;
      }
    }

    bool success = await WebShopService().sendBid(
      amount: amount,
      address: address,
      listingId: listing.id,
      isBuyNow: false,
      signature: signature,
    );

    if (kIsWeb) {
      //TODO: web
    } else {
      final coreBid = Bid.create(
        address: address,
        listingId: listingId,
        collectionId: listing.collection.id,
        bidAmount: amount,
        maxBidAmount: amount,
        purchaseKey: listing.purchaseKey,
        isBuyNow: false,
        bidStatus: success ? BidStatus.Rejected : BidStatus.Accepted,
      );

      success = success && await RemoteShopService().sendBid(coreBid, listing.id);
    }

    if (success) {
      ref.read(webListingListProvider("${listing.collection.shop?.id},${listing.collection.id}").notifier).refresh();
      Toast.message("Bid Submitted");
    } else {
      Toast.error();
    }

    return success;
  }
}

final webBidListProvider = StateNotifierProvider.family<WebBidListProvider, List<Bid>, int>((ref, listingId) {
  return WebBidListProvider(ref, listingId);
});
