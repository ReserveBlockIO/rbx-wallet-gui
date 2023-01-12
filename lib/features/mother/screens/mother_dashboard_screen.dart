import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/mother/models/mother_child_list.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MotherDashboardScreen extends BaseScreen {
  const MotherDashboardScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("MOTHER Dashboard"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        TextButton(
            onPressed: () {
              launchUrlString("${Env.apiBaseUrl}/mother");
            },
            child: Text(
              "Open in Browser",
              style: TextStyle(
                color: Colors.white,
              ),
            ))
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return MotherChildList();
  }
}
