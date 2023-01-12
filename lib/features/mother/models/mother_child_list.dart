import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/mother/components/mother_child_card.dart';
import 'package:rbx_wallet/features/mother/models/mother_child.dart';
import 'package:rbx_wallet/features/mother/services/mother_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MotherChildList extends StatefulWidget {
  const MotherChildList({Key? key}) : super(key: key);

  @override
  State<MotherChildList> createState() => _MotherChildListState();
}

class _MotherChildListState extends State<MotherChildList> {
  Timer? timer;
  List<MotherChild> children = [];

  @override
  void initState() {
    super.initState();
    update();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => update());
  }

  Future<void> update() async {
    final _children = await MotherService().getChildren();
    setState(() {
      children = _children;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final columns = MediaQuery.of(context).size.width < 1200
        ? 2
        : MediaQuery.of(context).size.width < 1600
            ? 3
            : 4;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        childAspectRatio: 1.1,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) {
        final child = children[index];

        return MotherChildCard(child: child);
      },
    );

    // return ListView.builder(
    //   itemCount: children.length,
    //   itemBuilder: (context, index) {
    //     final child = children[index];
    //     final title = child.validatorName == child.address ? child.address : "${child.address} (${child.validatorName})";
    //     final label = "IP: ${child.ipAddress} | Block Height: ${child.blockHeight} | Balance: ${child.balance} RBX";
    //     return Card(
    //       child: ListTile(
    //         title: Text(title),
    //         subtitle: Text(label),
    //         trailing: Icon(Icons.chevron_right),
    //         leading: Builder(builder: (context) {
    //           if (child.isValidating) {
    //             return AppBadge(
    //               label: "Validating",
    //               variant: AppColorVariant.Success,
    //             );
    //           }
    //           return AppBadge(
    //             label: "Not Validating",
    //             variant: AppColorVariant.Danger,
    //           );
    //         }),
    //       ),
    //     );
    //   },
    // );
  }
}
