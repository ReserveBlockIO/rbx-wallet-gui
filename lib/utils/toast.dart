import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

import '../app.dart';
import '../core/dialogs.dart';
import '../core/theme/app_theme.dart';
import 'html_helpers.dart';

class Toast {
  static message(String message, [bool surpress = false]) {
    if (surpress) {
      print(message);
      return;
    }

    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: kIsWeb && HtmlHelpers().getUserAgent().contains('OS 15_') ? '-apple-system' : null,
        ),
      ),
      backgroundColor: AppColors.getSpringGreen(),
      action: SnackBarAction(
        label: "Dismiss",
        textColor: Colors.white70,
        onPressed: () {},
      ),
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static error([String message = "A problem occurred.", bool surpress = false]) {
    if (surpress) {
      print(message);
      return;
    }

    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontFamily: kIsWeb && HtmlHelpers().getUserAgent().contains('OS 15_') ? '-apple-system' : null,
        ),
      ),
      backgroundColor: Color(0xFFBA2121),
      action: SnackBarAction(
        label: "Dismiss",
        textColor: Colors.white70,
        onPressed: () {},
      ),
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}

class OverlayToast {
  static message({required String message, String title = "Success"}) {
    InfoDialog.show(title: title, body: message);
  }

  static error([String? message]) {
    InfoDialog.show(title: "Error", body: message ?? "An error occurred");

    // final context = rootNavigatorKey.currentContext!;
    // showTopSnackBar(
    //   context,
    //   CustomSnackBar.error(
    //     message: message ?? "An error occurred",
    //   ),
    // );
  }
}
