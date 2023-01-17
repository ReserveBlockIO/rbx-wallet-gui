import 'package:flutter/material.dart';
import '../models/bulk_smart_contract_entry.dart';
import '../screens/bulk_smart_contract_entry_screen.dart';

class BulkSmartContractEntryListTile extends StatelessWidget {
  const BulkSmartContractEntryListTile({
    Key? key,
    required this.entry,
  }) : super(key: key);

  final BulkSmartContractEntry entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(entry.name),
        leading: Image.network(
          entry.primaryAssetUrl,
          width: 32,
          height: 32,
          fit: BoxFit.contain,
        ),
        subtitle: Text("Quantity: ${entry.quantity}"),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BulkSmartContractEntryScreen(entry),
            ),
          );
        },
      ),
    );
  }
}
