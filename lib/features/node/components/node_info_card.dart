import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/features/node/models/node_info.dart';
import 'package:timeago/timeago.dart' as timeago;

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
                children: [
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
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    node.ip,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${node.height}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${node.latency}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    node.lastCheked != null
                        ? DateFormat('hh:mm a').format(node.lastCheked!)
                        : "-",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: ListTile(
            dense: true,
            title: Text(node.ip),
            subtitle: Text("Height: ${node.height} | Latency: ${node.latency}"),
            trailing: node.lastCheked != null
                ? Text(timeago.format(node.lastCheked!))
                : null,
          ),
        ),
      ),
    );
  }
}
