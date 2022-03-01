// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

enum AppButtonType { Elevated, Outlined, Text }

class AppButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final AppButtonType type;
  final AppColorVariant variant;
  final AppSizeVariant size;
  final bool processing;
  final IconData? icon;
  final bool iconTrails;

  const AppButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.type = AppButtonType.Elevated,
    this.variant = AppColorVariant.Primary,
    this.size = AppSizeVariant.Md,
    this.processing = false,
    this.icon,
    this.iconTrails = false,
  }) : super(key: key);

  ButtonStyle _styleElevated(BuildContext context) {
    switch (variant) {
      case AppColorVariant.Primary:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.primaryButtonBg,
          onPrimary: Theme.of(context).colorScheme.primaryButtonFg,
        );

      case AppColorVariant.Secondary:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondaryButtonBg,
          onPrimary: Theme.of(context).colorScheme.secondaryButtonFg,
        );
      case AppColorVariant.Info:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.infoButtonBg,
          onPrimary: Theme.of(context).colorScheme.infoButtonFg,
        );
      case AppColorVariant.Danger:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.dangerButtonBg,
          onPrimary: Theme.of(context).colorScheme.dangerButtonFg,
        );
      case AppColorVariant.Success:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.successButtonBg,
          onPrimary: Theme.of(context).colorScheme.successButtonFg,
        );
      case AppColorVariant.Warning:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.warningButtonBg,
          onPrimary: Theme.of(context).colorScheme.warningButtonFg,
        );
      case AppColorVariant.Light:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.lightButtonBg,
          onPrimary: Theme.of(context).colorScheme.lightButtonFg,
        );
      case AppColorVariant.Dark:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.lightButtonBg,
          onPrimary: Theme.of(context).colorScheme.lightButtonFg,
        );
    }
  }

  ButtonStyle _styleOutlined(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;

    switch (variant) {
      case AppColorVariant.Primary:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.primaryButtonBg,
        );
      case AppColorVariant.Secondary:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.secondaryButtonBg,
        );
      case AppColorVariant.Info:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.infoButtonBg,
        );
      case AppColorVariant.Danger:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.dangerButtonBg,
        );
      case AppColorVariant.Success:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.successButtonBg,
        );
      case AppColorVariant.Warning:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.warningButtonBg,
        );
      case AppColorVariant.Light:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.lightButtonBg,
        );
      case AppColorVariant.Dark:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.darkButtonBg,
        );
    }
  }

  ButtonStyle _styleText(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    switch (variant) {
      case AppColorVariant.Primary:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.primaryButtonBg,
        );
      case AppColorVariant.Secondary:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.secondaryButtonBg,
        );
      case AppColorVariant.Info:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.infoButtonBg,
        );
      case AppColorVariant.Danger:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.dangerButtonBg,
        );
      case AppColorVariant.Success:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.successButtonBg,
        );
      case AppColorVariant.Warning:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.warningButtonBg,
        );
      case AppColorVariant.Light:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.lightButtonBg,
        );
      case AppColorVariant.Dark:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.darkButtonBg,
        );
    }
  }

  Color _iconColor(context) {
    final _colorScheme = Theme.of(context).colorScheme;

    if (onPressed == null) {
      return Theme.of(context).disabledColor;
    }

    switch (type) {
      case AppButtonType.Elevated:
        switch (variant) {
          case AppColorVariant.Primary:
            return _colorScheme.primaryButtonFg;
          case AppColorVariant.Secondary:
            return _colorScheme.secondaryButtonFg;
          case AppColorVariant.Info:
            return _colorScheme.infoButtonFg;
          case AppColorVariant.Danger:
            return _colorScheme.dangerButtonFg;
          case AppColorVariant.Success:
            return _colorScheme.successButtonFg;
          case AppColorVariant.Warning:
            return _colorScheme.warningButtonFg;
          case AppColorVariant.Light:
            return _colorScheme.lightButtonFg;
          case AppColorVariant.Dark:
            return _colorScheme.darkButtonFg;
        }
      case AppButtonType.Text:
      case AppButtonType.Outlined:
        switch (variant) {
          case AppColorVariant.Primary:
            return _colorScheme.primaryButtonBg;
          case AppColorVariant.Secondary:
            return _colorScheme.secondaryButtonBg;
          case AppColorVariant.Info:
            return _colorScheme.infoButtonBg;
          case AppColorVariant.Danger:
            return _colorScheme.dangerButtonBg;
          case AppColorVariant.Success:
            return _colorScheme.successButtonBg;
          case AppColorVariant.Warning:
            return _colorScheme.warningButtonBg;
          case AppColorVariant.Light:
            return _colorScheme.lightButtonBg;
          case AppColorVariant.Dark:
            return _colorScheme.darkButtonBg;
        }
    }
  }

  Widget _child(BuildContext context) {
    if (icon != null || processing) {
      return Wrap(
        textDirection: iconTrails ? TextDirection.rtl : TextDirection.ltr,
        children: [
          processing
              ? SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    color: _iconColor(context),
                    strokeWidth: 2.0,
                  ),
                )
              : Icon(
                  icon,
                  size: 16,
                  color: _iconColor(context),
                ),
          const SizedBox(
            width: 6,
          ),
          Text(label),
        ],
      );
    }

    return Text(label);
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppButtonType.Elevated:
        return ElevatedButton(
          onPressed: processing ? () {} : onPressed,
          child: _child(context),
          style: _styleElevated(context),
        );
      case AppButtonType.Outlined:
        return OutlinedButton(
          onPressed: processing ? () {} : onPressed,
          child: _child(context),
          style: _styleOutlined(context),
        );
      case AppButtonType.Text:
        return TextButton(
          onPressed: processing ? () {} : onPressed,
          child: _child(context),
          style: _styleText(context),
        );
    }
  }
}
