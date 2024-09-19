import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'utils.dart';
import '../features/global_loader/global_loading_provider.dart';
import '../features/payment/components/payment_disclaimer.dart';

import '../app.dart';
import '../features/bridge/services/bridge_service.dart';
import '../utils/toast.dart';
import '../utils/validation.dart';
import 'theme/app_theme.dart';

class InfoDialog {
  static alert(
    BuildContext context, {
    required String title,
    String? body,
    Widget? content,
    String? closeText,
    IconData? icon,
    Color? headerColor = Colors.white,
    Color? buttonColorOverride,
    bool withBackArrow = false,
  }) {
    return AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (withBackArrow)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.navigate_before),
            ),
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
              color: buttonColorOverride ?? Theme.of(context).colorScheme.secondary,
            ),
          ),
        )
      ],
    );
  }

  static show({
    required String title,
    String? body,
    Widget? content,
    String? closeText,
    IconData? icon,
    Color? headerColor = Colors.white,
    BuildContext? contextOverride,
    Color? buttonColorOverride,
    bool withBackArrow = false,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: contextOverride ?? context,
      builder: (context) {
        return alert(context,
            title: title,
            body: body,
            content: content,
            closeText: closeText,
            icon: icon,
            headerColor: headerColor,
            buttonColorOverride: buttonColorOverride,
            withBackArrow: withBackArrow);
      },
    );
  }
}

class ConfirmDialog {
  static alert(
    BuildContext context, {
    required String title,
    Widget? content,
    String? body,
    String? cancelText,
    String? confirmText,
    bool destructive = false,
  }) {
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
  }

  static Future<bool?> show({
    required String title,
    Widget? content,
    String? body,
    String? cancelText,
    String? confirmText,
    bool destructive = false,
    BuildContext? context,
  }) async {
    return await showDialog(
      context: context ?? rootNavigatorKey.currentContext!,
      builder: (context) {
        return alert(
          context,
          title: title,
          content: content,
          body: body,
          cancelText: cancelText,
          confirmText: confirmText,
          destructive: destructive,
        );
      },
    );
  }
}

class RecoverDialog {
  static alert(BuildContext context, {required String hash}) {
    return Consumer(builder: (context, ref, child) {
      return AlertDialog(
        title: Text("Recovery process has started"),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SelectableText(
            "Your Reserve (Protected) Account is being recovered to your recovery address.\n\nTransaction Hash: $hash\n\nAll non-settled transactions for funds and NFTs will be transferred as well as your current available balance. \n\nIt is recommended you import your recovery private key into a new machine. NFT media will not be transferred over so please export them by clicking the button below and import them to your new environment.",
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
            onPressed: () async {
              final success = await backupMedia(context, ref);
              if (success == true) {
                // Navigator.of(context).pop();
                if (Platform.isMacOS) {
                  Toast.message("Media backed up successfully.");
                }
              } else {
                Toast.error();
              }
            },
            child: Text(
              "Export NFT Media",
              style: TextStyle(color: Theme.of(context).colorScheme.info),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red.shade600,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              await BridgeService().killCli();
              ref.read(globalLoadingProvider.notifier).start();
              await Future.delayed(const Duration(milliseconds: 3000));
              ref.read(globalLoadingProvider.notifier).complete();
              FlutterWindowClose.closeWindow();
            },
            child: Text(
              "Close Wallet",
              style: TextStyle(
                color: Colors.red.shade600,
              ),
            ),
          )
        ],
      );
    });
  }

  static Future<bool?> show({
    required String hash,
    BuildContext? context,
  }) async {
    return await showDialog(
      context: context ?? rootNavigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) {
        return alert(
          context,
          hash: hash,
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
    String? footer,
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
    bool popOnValidSubmission = true,
    Widget? titleTrailing,
    String? prefixText,
    Color? labelColor,
  }) async {
    // final context = rootNavigatorKey.currentContext!;
    final context = contextOverride ?? rootNavigatorKey.currentContext!;

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
            constraints: const BoxConstraints(maxWidth: 600, minWidth: 400),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              label: Text(
                                labelText,
                                style: TextStyle(color: labelColor ?? Theme.of(context).colorScheme.secondary),
                              ),
                              prefixText: prefixText,
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
                  if (footer != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        footer,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
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

    bool obscuringPassword = true;

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
                    StatefulBuilder(builder: (context, setState) {
                      return Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: obscuringPassword,
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
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                obscuringPassword = !obscuringPassword;
                              });
                            },
                            icon: Icon(
                              obscuringPassword ? Icons.remove_red_eye : Icons.hide_source_outlined,
                            ),
                          )
                        ],
                      );
                    }),
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

class PaymentTermsDialog {
  static Future<bool?> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        bool hasAgreed = false;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Disclaimer"),
              content: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PaymentDisclaimer(),
                    SizedBox(height: 8),
                    CheckboxListTile(
                      value: hasAgreed,
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            hasAgreed = val;
                          });
                        }
                      },
                      title: Text("I have read and agree to the disclaimer."),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      checkColor: Colors.white,
                      activeColor: Theme.of(context).colorScheme.primary,
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                TextButton(
                  onPressed: hasAgreed
                      ? () {
                          Navigator.of(context).pop(true);
                        }
                      : () {
                          Toast.error("You must agree to the terms before proceeding.");
                        },
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: hasAgreed ? Colors.white : Colors.white54),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
