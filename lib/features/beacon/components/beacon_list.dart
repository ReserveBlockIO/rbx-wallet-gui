import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import 'beacon_list_tile.dart';
import '../providers/beacon_list_provider.dart';
import '../../voting/components/topic_list_tile.dart';
import '../../voting/providers/topic_list_provider.dart';

class BeaconList extends BaseComponent {
  const BeaconList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beacons = ref.watch(beaconListProvider);

    if (beacons.isEmpty) {
      return Center(
        child: Text("No Beacons"),
      );
    }

    return ListView.builder(
      itemCount: beacons.length,
      itemBuilder: (context, index) {
        final beacon = beacons[index];

        return BeaconListTile(beacon);
      },
    );
  }
}
