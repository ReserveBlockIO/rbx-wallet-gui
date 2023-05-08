import 'dart:async';

import 'package:flutter/material.dart';

class Poller extends StatefulWidget {
  final int seconds;
  final Function pollFunction;
  final bool callOnInit;
  const Poller({
    super.key,
    required this.pollFunction,
    this.seconds = 15,
    this.callOnInit = true,
  });

  @override
  State<Poller> createState() => _PollerState();
}

class _PollerState extends State<Poller> {
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 15), (timer) {
      widget.pollFunction();
    });
    super.initState();
    if (widget.callOnInit) {
      widget.pollFunction();
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
