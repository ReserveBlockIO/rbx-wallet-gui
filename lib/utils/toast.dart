import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import '../core/dialogs.dart';
import '../core/theme/app_theme.dart';
import 'html_helpers.dart';

class Toast {
  static message(String message) {
    final context = rootNavigatorKey.currentContext!;

    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: kIsWeb && HtmlHelpers().getUserAgent().contains('OS 15_') ? '-apple-system' : null,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.success,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static error([String message = "A problem occurred."]) {
    final context = rootNavigatorKey.currentContext!;

    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontFamily: kIsWeb && HtmlHelpers().getUserAgent().contains('OS 15_') ? '-apple-system' : null,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.danger,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}

class OverlayToast {
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
