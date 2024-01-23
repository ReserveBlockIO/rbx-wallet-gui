// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';

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
  final HelpType? helpType;
  final bool disabled;
  final bool underlined;

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
    this.helpType,
    this.disabled = false,
    this.underlined = false,
  }) : super(key: key);

  ButtonStyle _styleElevated(BuildContext context) {
    final isMobile = BreakPoints.useMobileLayout(context);
    switch (variant) {
      case AppColorVariant.Primary:
        return ElevatedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.primaryButtonBg,
          onPrimary: Theme.of(context).colorScheme.primaryButtonFg,
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
          ),
        );

      case AppColorVariant.Secondary:
        return ElevatedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.secondaryButtonBg,
          onPrimary: Theme.of(context).colorScheme.secondaryButtonFg,
        );
      case AppColorVariant.Info:
        return ElevatedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.infoButtonBg,
          onPrimary: Theme.of(context).colorScheme.infoButtonFg,
        );
      case AppColorVariant.Danger:
        return ElevatedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.dangerButtonBg,
          onPrimary: Theme.of(context).colorScheme.dangerButtonFg,
        );
      case AppColorVariant.Success:
        return ElevatedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.successButtonBg,
          onPrimary: Theme.of(context).colorScheme.successButtonFg,
        );
      case AppColorVariant.Warning:
        return ElevatedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.warningButtonBg,
          onPrimary: Theme.of(context).colorScheme.warningButtonFg,
        );
      case AppColorVariant.Light:
        return ElevatedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.lightButtonBg,
          onPrimary: Theme.of(context).colorScheme.lightButtonFg,
        );
      case AppColorVariant.Dark:
        return ElevatedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.lightButtonBg,
          onPrimary: Theme.of(context).colorScheme.lightButtonFg,
        );
      case AppColorVariant.Btc:
        return ElevatedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.btcOrange,
          onPrimary: Theme.of(context).colorScheme.darkButtonFg,
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
      case AppColorVariant.Btc:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.btcOrange,
        );
    }
  }

  ButtonStyle _styleText(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    switch (variant) {
      case AppColorVariant.Primary:
        return OutlinedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : _colorScheme.primaryButtonBg,
        );
      case AppColorVariant.Secondary:
        return OutlinedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : _colorScheme.secondaryButtonBg,
        );
      case AppColorVariant.Info:
        return OutlinedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : _colorScheme.infoButtonBg,
        );
      case AppColorVariant.Danger:
        return OutlinedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : _colorScheme.dangerButtonBg,
        );
      case AppColorVariant.Success:
        return OutlinedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : _colorScheme.successButtonBg,
        );
      case AppColorVariant.Warning:
        return OutlinedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : _colorScheme.warningButtonBg,
        );
      case AppColorVariant.Light:
        return OutlinedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : _colorScheme.lightButtonBg,
        );
      case AppColorVariant.Dark:
        return OutlinedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : _colorScheme.darkButtonBg,
        );
      case AppColorVariant.Btc:
        return OutlinedButton.styleFrom(
          primary: disabled ? Theme.of(context).disabledColor : _colorScheme.btcOrange,
        );
    }
  }

  Color _iconColor(context) {
    final _colorScheme = Theme.of(context).colorScheme;

    if (onPressed == null || disabled) {
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
          case AppColorVariant.Btc:
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
          case AppColorVariant.Btc:
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
          Text(
            label,
            style: TextStyle(
              decoration: underlined ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ],
      );
    }

    return Text(
      label,
      style: TextStyle(
        decoration: underlined ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final key = "$variant:$type:$size:$processing:$icon:$iconTrails:$disabled";

    return IgnorePointer(
      ignoring: disabled,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(
            builder: (context) {
              switch (type) {
                case AppButtonType.Elevated:
                  return ElevatedButton(
                    key: Key('elevated:$key'),
                    onPressed: processing || disabled ? () {} : onPressed,
                    style: _styleElevated(context),
                    child: _child(context),
                  );
                case AppButtonType.Outlined:
                  return OutlinedButton(
                    key: Key('outlined:$key'),
                    onPressed: processing || disabled ? () {} : onPressed,
                    style: _styleOutlined(context),
                    child: _child(context),
                  );
                case AppButtonType.Text:
                  return TextButton(
                    key: Key('text:$key'),
                    onPressed: processing || disabled ? () {} : onPressed,
                    style: _styleText(context),
                    child: _child(context),
                  );
              }
            },
          ),
          if (helpType != null)
            HelpButton(
              helpType!,
              subtle: true,
              color: Theme.of(context).colorScheme.secondary,
            ),
        ],
      ),
    );
  }
}
