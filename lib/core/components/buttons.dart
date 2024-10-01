// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';

import '../theme/colors.dart';

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
  final Color? bgOverride;
  final Color? fgOverride;
  final bool useDisabledColor;

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
    this.bgOverride,
    this.fgOverride,
    this.useDisabledColor = false,
  }) : super(key: key);

  ButtonStyle _styleElevated(BuildContext context) {
    final isMobile = BreakPoints.useMobileLayout(context);

    switch (variant) {
      case AppColorVariant.Primary:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.primaryButtonFg, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.primaryButtonBg,
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        );

      case AppColorVariant.Secondary:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.secondaryButtonFg, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.secondaryButtonBg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Info:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.infoButtonFg, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.infoButtonBg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
        );
      case AppColorVariant.Danger:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.dangerButtonFg, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.dangerButtonBg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
        );
      case AppColorVariant.Success:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.successButtonFg, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : AppColors.getSpringGreen(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
        );
      case AppColorVariant.Warning:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.warningButtonFg, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.warningButtonBg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
        );
      case AppColorVariant.Light:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.lightButtonFg, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.lightButtonBg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
        );
      case AppColorVariant.Dark:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.lightButtonFg, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.lightButtonBg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
        );
      case AppColorVariant.Btc:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onBtcOrange, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.btcOrange,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
        );
      case AppColorVariant.Reserve:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onReserve, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.reserve,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
        );
      case AppColorVariant.Vbtc:
        return ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onVbtc, backgroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.vbtc,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.Lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.Lg && !isMobile ? FontWeight.w500 : null,
            height: 1,
          ),
        );
    }
  }

  ButtonStyle _styleOutlined(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;

    switch (variant) {
      case AppColorVariant.Primary:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.primaryButtonBg, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Secondary:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.secondaryButtonBg, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Info:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.infoButtonBg, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Danger:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.dangerButtonBg, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Success:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.successButtonBg, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Warning:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.warningButtonBg, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Light:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.lightButtonBg, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Dark:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.darkButtonBg, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Btc:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.btcOrange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Reserve:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.reserve, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Vbtc:
        return OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.vbtc, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashFactory: NoSplash.splashFactory,
        );
    }
  }

  ButtonStyle _styleText(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    switch (variant) {
      case AppColorVariant.Primary:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.primaryButtonBg, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Secondary:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.secondaryButtonBg, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Info:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.infoButtonBg, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Danger:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.dangerButtonBg, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Success:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.successButtonBg, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Warning:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.warningButtonBg, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Light:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.lightButtonBg, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Dark:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.darkButtonBg, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Btc:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.btcOrange, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Reserve:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.reserve, splashFactory: NoSplash.splashFactory,
        );
      case AppColorVariant.Vbtc:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || useDisabledColor ? Theme.of(context).disabledColor : _colorScheme.vbtc, splashFactory: NoSplash.splashFactory,
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
            return _colorScheme.onBtcOrange;
          case AppColorVariant.Reserve:
            return _colorScheme.onReserve;
          case AppColorVariant.Vbtc:
            return _colorScheme.onVbtc;
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
            return _colorScheme.btcOrange;
          case AppColorVariant.Reserve:
            return _colorScheme.reserve;
          case AppColorVariant.Vbtc:
            return _colorScheme.vbtc;
        }
    }
  }

  Widget _child(BuildContext context) {
    if (icon != null || processing) {
      return Wrap(
        textDirection: iconTrails ? TextDirection.rtl : TextDirection.ltr,
        children: [
          processing
              ? Transform.translate(
                  offset: Offset(0, 3),
                  child: SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(
                      color: _iconColor(context),
                      strokeWidth: 2.0,
                    ),
                  ),
                )
              : Transform.translate(
                  offset:
                      type == AppButtonType.Text ? Offset(0, 4) : Offset(0, (icon?.fontPackage).toString().contains("font_awesome_flutter") ? 3 : 0),
                  child: Icon(
                    icon,
                    size: 14,
                    color: _iconColor(context),
                  ),
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
