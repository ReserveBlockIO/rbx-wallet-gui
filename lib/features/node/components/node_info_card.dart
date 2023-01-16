import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/node_info.dart';

class NodeInfoCard extends StatelessWidget {
  final NodeInfo node;
  const NodeInfoCard(this.node, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "IP:",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Height:",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Latency:",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Last Checked:",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    node.ip,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${node.height}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${node.latency}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    node.lastCheked != null ? DateFormat('hh:mm a').format(node.lastCheked!) : "-",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
