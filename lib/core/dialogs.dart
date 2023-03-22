import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app.dart';
import '../utils/toast.dart';
import '../utils/validation.dart';
import 'theme/app_theme.dart';

class InfoDialog {
  static show({
    required String title,
    String? body,
    Widget? content,
    String? closeText,
    IconData? icon,
    Color? headerColor = Colors.white,
    BuildContext? contextOverride,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: contextOverride ?? context,
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
          content: body != null ? ConstrainedBox(constraints: const BoxConstraints(maxWidth: 500), child: Text(body)) : content,
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
                primary: destructive ? Colors.red.shade600 : Theme.of(context).colorScheme.info,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                confirmText ?? "Yes",
                style: TextStyle(
                  color: destructive ? Colors.red.shade600 : Colors.white,
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
    String? body,
    bool obscureText = false,
    bool revealObscure = false,
    String? cancelText,
    String? confirmText,
    String initialValue = "",
    bool destructive = false,
    bool allowCancel = true,
    int? lines,
    bool tightPadding = false,
    TextInputType? keyboardType,
    Function(String)? onValidSubmission,
    List<TextInputFormatter> inputFormatters = const [],
    final bool popOnValidSubmission = true,
    final Widget? titleTrailing,
  }) async {
    // final context = rootNavigatorKey.currentContext!;
    final context = contextOverride ?? rootScaffoldKey.currentContext!;

    final GlobalKey<FormState> _formKey = GlobalKey();

    final TextEditingController _controller = TextEditingController(text: initialValue);

    bool _obscureText = obscureText;

    return await showDialog(
      context: context,
      barrierDismissible: allowCancel,
      builder: (context) {
        return AlertDialog(
          title: titleTrailing != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    titleTrailing
                  ],
                )
              : Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
          titlePadding: tightPadding ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 20),
          contentPadding: tightPadding ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
          insetPadding: tightPadding ? const EdgeInsets.all(8.0) : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (body != null) Text(body),
                  StatefulBuilder(builder: (context, setState) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _controller,
                            obscureText: _obscureText,
                            autofocus: true,
                            minLines: lines,
                            maxLines: lines,
                            keyboardType: keyboardType,
                            decoration: InputDecoration(
                              label: Text(labelText),
                            ),
                            validator: validator,
                            inputFormatters: inputFormatters,
                          ),
                        ),
                        if (obscureText && revealObscure)
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText ? Icons.remove_red_eye : Icons.hide_source_outlined,
                            ),
                          )
                      ],
                    );
                  }),
                ],
              ),
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
                primary: destructive ? Colors.red.shade600 : Theme.of(context).colorScheme.info,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                final value = _controller.value.text;

                if (onValidSubmission != null) {
                  if (popOnValidSubmission) {
                    Navigator.of(context).pop();
                  }
                  onValidSubmission(value);
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

    Future<void> submit(BuildContext context) async {
      if (!_formKey.currentState!.validate()) return;

      if (forCreate && _passwordController.text != _confirmPasswordController.text) {
        Toast.error("Passwords do not match");
        return;
      }

      onValidSubmission(
        AuthModalResponse(_emailController.text, _passwordController.text),
      );

      Navigator.of(context).pop();
    }

    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(forCreate ? "Create Wallet" : "Login",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          titlePadding: const EdgeInsets.all(18.0),
          contentPadding: const EdgeInsets.all(18.0),
          insetPadding: const EdgeInsets.all(8.0),
          backgroundColor: const Color(0xFF040f26),
          content: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (withExplanation)
                      const Text("A wallet is required to continue.\nPlease create your account now with your email address and a password."),
                    const Text(
                      "Your email and password is used to seed your private key which is processed in this browser and will never be transmitted across the internet.",
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
                      onFieldSubmitted: (_) {
                        if (!forCreate) {
                          submit(context);
                        }
                      },
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
                        onFieldSubmitted: (_) {
                          submit(context);
                        },
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
                style: TextStyle(color: Theme.of(context).colorScheme.info.withOpacity(0.7)),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).colorScheme.info,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                submit(context);
              },
              child: Text(forCreate ? "Create" : "Login", style: TextStyle(color: Theme.of(context).colorScheme.info)),
            )
          ],
        );
      },
    );
  }
}
