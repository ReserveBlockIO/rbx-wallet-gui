import 'package:flutter/material.dart';

class NotAcceptingRbxMessage extends StatelessWidget {
  const NotAcceptingRbxMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "The seller is unable to accept RBX due to the current inability to swap for other currency but is accepting credit cards via Stripe. All transactions and transfers will still occur on-chain on the RBX network.",
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
