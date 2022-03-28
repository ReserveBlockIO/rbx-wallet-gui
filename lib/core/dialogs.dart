import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

class InfoDialog {
  static show({
    required String title,
    String? body,
    Widget? content,
    String? closeText,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: body != null ? Text(body) : content,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.info,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                closeText ?? "Close",
                style: TextStyle(color: Theme.of(context).colorScheme.info),
              ),
            )
          ],
        );
      },
    );
  }
}

class ConfirmDialog {
  static show({
    required String title,
    Widget? content,
    String? body,
    String? cancelText,
    String? confirmText,
    bool destructive = false,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: body != null ? Text(body) : content,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.info,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                cancelText ?? "No",
                style: TextStyle(color: Theme.of(context).colorScheme.info),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: destructive
                    ? Theme.of(context).colorScheme.danger
                    : Theme.of(context).colorScheme.info,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                confirmText ?? "Yes",
                style: TextStyle(
                    color: destructive
                        ? Theme.of(context).colorScheme.danger
                        : Theme.of(context).colorScheme.info),
              ),
            )
          ],
        );
      },
    );
  }
}

class PromptModal {
  static Future<List<String>?> show(
      {required String title,
      required String? Function(String?) validator,
      required String labelText,
      bool obscureText = false,
      String? cancelText,
      String? confirmText,
      String initialValue = "",
      bool destructive = false,
      Function(String)? onValidSubmission,
      List<TextInputFormatter> inputFormatters = const []}) async {
    // final context = rootNavigatorKey.currentContext!;
    final context = rootScaffoldKey.currentContext!;

    final GlobalKey<FormState> _formKey = GlobalKey();

    final TextEditingController _controller =
        TextEditingController(text: initialValue);

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _controller,
                  obscureText: obscureText,
                  autofocus: true,
                  decoration: InputDecoration(
                    label: Text(labelText),
                  ),
                  validator: validator,
                  inputFormatters: inputFormatters,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.info,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                cancelText ?? "Cancel",
                style: TextStyle(color: Theme.of(context).colorScheme.info),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: destructive
                    ? Theme.of(context).colorScheme.danger
                    : Theme.of(context).colorScheme.info,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                final value = _controller.value.text;

                if (onValidSubmission != null) {
                  onValidSubmission(value);
                  Navigator.of(context).pop();
                  return;
                }
              },
              child: Text(confirmText ?? "Submit",
                  style: TextStyle(color: Theme.of(context).colorScheme.info)),
            )
          ],
        );
      },
    );
  }
}
