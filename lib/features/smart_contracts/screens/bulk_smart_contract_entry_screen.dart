import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/models/bulk_smart_contract_entry.dart';

class BulkSmartContractEntryScreen extends BaseScreen {
  final BulkSmartContractEntry entry;
  const BulkSmartContractEntryScreen(this.entry, {Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(entry.name),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                entry.primaryAssetUrl,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ${entry.name}",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    "Creator: ${entry.creatorName}",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    "Description: ${entry.description}",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    "Quantity: ${entry.quantity}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
