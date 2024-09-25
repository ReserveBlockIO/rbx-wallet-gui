import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../transactions/providers/transaction_list_provider.dart';

part 'validated_blocks_provider.g.dart';

class ValidatedBlock {
  final int height;
  final String validatorAddress;
  final int timestamp;

  ValidatedBlock({
    required this.height,
    required this.validatorAddress,
    required this.timestamp,
  });

  String get parseTimeStamp {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var d12 = DateFormat('MM-dd-yyyy hh:mm a').format(date);
    return d12;
  }
}

@Riverpod(keepAlive: true)
List<ValidatedBlock> validatedBlocks(ValidatedBlocksRef ref) {
  return ref
      .watch(transactionListProvider(TransactionListType.Validated))
      .map((tx) => ValidatedBlock(
            height: tx.height,
            validatorAddress: tx.toAddress,
            timestamp: tx.timestamp,
          ))
      .toList()
    ..reversed;
}
