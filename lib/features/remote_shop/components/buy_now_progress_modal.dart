import 'package:flutter/material.dart';

class BuyNowProgressModal extends StatefulWidget {
  final String smartContractUid;
  const BuyNowProgressModal({
    super.key,
    required this.smartContractUid,
  });

  @override
  State<BuyNowProgressModal> createState() => _BuyNowProgressModalState();
}

class _BuyNowProgressModalState extends State<BuyNowProgressModal> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("YO"),
            ],
          ),
        ),
      ),
    );
  }
}
