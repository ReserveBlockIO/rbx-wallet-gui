import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/base_screen.dart';
import '../../../core/env.dart';
import '../models/mother_child_list.dart';

class MotherDashboardScreen extends BaseScreen {
  const MotherDashboardScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("MOTHER Dashboard"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        TextButton(
            onPressed: () {
              final url = "${Env.apiBaseUrl}/mother".replaceAll("https://", "http://");
              launchUrlString(url);
            },
            child: const Text(
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
    return const MotherChildList();
  }
}
