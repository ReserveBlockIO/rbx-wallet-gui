import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../components/add_beacon_modal.dart';
import '../components/beacon_list.dart';
import '../components/create_beacon_modal.dart';
import '../providers/beacon_list_provider.dart';

class BeaconListScreen extends BaseScreen {
  const BeaconListScreen({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final beacons = ref.watch(beaconListProvider);
    final myBeacons = beacons.where((b) => b.selfBeacon);

    return AppBar(
      centerTitle: true,
      title: Text("Beacons"),
      backgroundColor: Colors.black54,
      leading: IconButton(
        onPressed: () {
          ref.read(beaconListProvider.notifier).refresh();
        },
        icon: Icon(Icons.refresh),
      ),
      actions: [
        AppButton(
          label: "Add",
          variant: AppColorVariant.Light,
          onPressed: () async {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return AddBeaconModal();
                });
          },
        ),
        SizedBox(
          width: 8,
        ),
        AppButton(
          label: "Create",
          variant: AppColorVariant.Light,
          onPressed: () async {
            if (myBeacons.isNotEmpty) {
              Toast.error("Only one beacon per wallet allowed.");
              return;
            }
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CreateBeaconModal();
                });
          },
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(child: BeaconList()),
      ],
    );
  }
}
