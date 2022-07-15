import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class InfoDialog {
  static show({
    required String title,
    String? body,
    Widget? content,
    String? closeText,
    IconData? icon,
    Color? headerColor = Colors.white38,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    icon,
                    color: headerColor,
                  ),
                ),
              Text(
                title,
                style: TextStyle(
                  color: headerColor,
                ),
              ),
            ],
          ),
          content: body != null
              ? ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Text(body),
                )
              : content,
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
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
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
                primary: destructive ? Theme.of(context).colorScheme.danger : Theme.of(context).colorScheme.info,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                confirmText ?? "Yes",
                style: TextStyle(
                  color: destructive ? Theme.of(context).colorScheme.danger : Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class PromptModal {
  static Future<String?> show({
    required String title,
    required String? Function(String?) validator,
    required String labelText,
    BuildContext? contextOverride,
    bool obscureText = false,
    String? cancelText,
    String? confirmText,
    String initialValue = "",
    bool destructive = false,
    bool allowCancel = true,
    int? lines,
    bool tightPadding = false,
    Function(String)? onValidSubmission,
    List<TextInputFormatter> inputFormatters = const [],
  }) async {
    // final context = rootNavigatorKey.currentContext!;
    final context = contextOverride ?? rootScaffoldKey.currentContext!;

    final GlobalKey<FormState> _formKey = GlobalKey();

    final TextEditingController _controller = TextEditingController(text: initialValue);

    return await showDialog(
      context: context,
      barrierDismissible: allowCancel,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          titlePadding: tightPadding ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 20),
          contentPadding: tightPadding ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
          insetPadding: tightPadding ? const EdgeInsets.all(8.0) : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _controller,
                  obscureText: obscureText,
                  autofocus: true,
                  minLines: lines,
                  maxLines: lines,
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
            if (allowCancel)
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
                primary: destructive ? Theme.of(context).colorScheme.danger : Theme.of(context).colorScheme.info,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                final value = _controller.value.text;

                if (onValidSubmission != null) {
                  onValidSubmission(value);
                  Navigator.of(context).pop();
                  return;
                } else {
                  Navigator.of(context).pop(value);
                }
              },
              child: Text(confirmText ?? "Submit", style: TextStyle(color: Theme.of(context).colorScheme.info)),
            )
          ],
        );
      },
    );
  }
}

class AuthModalResponse {
  final String email;
  final String password;

  const AuthModalResponse(this.email, this.password);
}

class AuthModal {
  static Future<void> show({
    bool forCreate = true,
    bool withExplanation = false,
    required BuildContext context,
    required Function(AuthModalResponse) onValidSubmission,
  }) async {
    // final context = rootNavigatorKey.currentContext!;

    final GlobalKey<FormState> _formKey = GlobalKey();

    final TextEditingController _emailController = TextEditingController(text: '');

    final TextEditingController _passwordController = TextEditingController(text: '');

    final TextEditingController _confirmPasswordController = TextEditingController(text: '');

    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(forCreate ? "Create Wallet" : "Login",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          titlePadding: const EdgeInsets.all(12.0),
          contentPadding: const EdgeInsets.all(12.0),
          insetPadding: const EdgeInsets.all(8.0),
          backgroundColor: Color(0xFF040f26),
          content: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (withExplanation)
                      Text("A web wallet is required to continue.\nPlease create your account now with your email address and a password."),
                    Text(
                      "Your email and password is used to seed your private key which is processed in this browser and will never be transmitted accross the internet.",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: "Email Address",
                      ),
                      validator: formValidatorEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                      validator: formValidatorPassword,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    if (forCreate)
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Confirm Password",
                        ),
                        validator: formValidatorPassword,
                        keyboardType: TextInputType.emailAddress,
                      ),
                  ],
                ),
              ),
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
                "Cancel",
                style: TextStyle(color: Theme.of(context).colorScheme.info),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).colorScheme.info,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                if (forCreate && _passwordController.text != _confirmPasswordController.text) {
                  Toast.error("Passwords do not match");
                  return;
                }

                onValidSubmission(
                  AuthModalResponse(_emailController.text, _passwordController.text),
                );

                Navigator.of(context).pop();
              },
              child: Text(forCreate ? "Create" : "Login", style: TextStyle(color: Theme.of(context).colorScheme.info)),
            )
          ],
        );
      },
    );
  }
}
