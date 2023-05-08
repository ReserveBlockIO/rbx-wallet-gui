import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/html_helpers.dart';

const _primaryColor = Color(0xFF031745);
const _secondaryColor = Color(0xFF82e4fb);
const _successColor = Color(0xFF43ae52);
const _infoColor = Color(0xFFc4c4c4);
const _warningColor = Color(0xFFd7bc23);
const _dangerColor = Color(0xFFBA2121);
const _dangerBright = Color(0xFFFF0000);
const _light = Color(0xFFFFFFFF);
const _dark = Color(0xFF000000);

const _textColorDark = Color(0xFF121212);
const _textColorLight = Color(0xFFf6f6f6);

enum AppColorVariant {
  Primary,
  Secondary,
  Info,
  Success,
  Warning,
  Danger,
  Light,
  Dark,
}

enum AppSizeVariant {
  Xs,
  Sm,
  Md,
  Lg,
  Xl,
}

extension CustomColorScheme on ColorScheme {
  Color get primary => _primaryColor;
  Color get secondary => _secondaryColor;
  Color get success => _successColor;
  Color get info => _infoColor;
  Color get warning => _warningColor;
  Color get danger => _dangerColor;
  Color get dangerBright => _dangerBright;
  Color get light => _light;
  Color get dark => _dark;

  Color get text => brightness == Brightness.light ? _textColorDark : _textColorLight;

  // buttons
  Color get primaryButtonBg => primary;
  Color get primaryButtonFg => const Color(0xFFFFFFFF);

  Color get secondaryButtonBg => secondary;
  Color get secondaryButtonFg => const Color(0xFFFFFFFF);

  Color get infoButtonBg => info;
  Color get infoButtonFg => const Color(0xFFFFFFFF);

  Color get dangerButtonBg => danger;
  Color get dangerButtonFg => const Color(0xFFFFFFFF);

  Color get successButtonBg => success;
  Color get successButtonFg => const Color(0xFFFFFFFF);

  Color get warningButtonBg => warning;
  Color get warningButtonFg => const Color(0xFFFFFFFF);

  Color get lightButtonBg => light;
  Color get lightButtonFg => const Color(0xFF000000);

  Color get darkButtonBg => dark;
  Color get darkButtonFg => const Color(0xFFFFFFFF);
}

class AppTheme {
  final ThemeData themeData;

  const AppTheme({
    required this.themeData,
  });

  factory AppTheme.light() {
    final _themeData = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: createMaterialColor(_primaryColor),
        accentColor: _secondaryColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: _secondaryColor),
        floatingLabelStyle: TextStyle(
          color: _secondaryColor,
        ),
      ),
      textTheme: _textTheme(),
      fontFamily: kIsWeb && HtmlHelpers().getUserAgent().contains('OS 15_') ? '-apple-system' : null,
    );

    return AppTheme(themeData: _themeData);
  }

  factory AppTheme.dark() {
    final _themeData = ThemeData(
      textSelectionTheme: TextSelectionThemeData(cursorColor: _secondaryColor, selectionColor: _secondaryColor.withOpacity(0.3)),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.green,
        labelStyle: TextStyle(color: _secondaryColor),
        floatingLabelStyle: TextStyle(
          color: _secondaryColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _secondaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _infoColor),
        ),
      ),
      scaffoldBackgroundColor: Colors.black,
      dialogTheme: DialogTheme(
          backgroundColor: Color(0xff070707),
          shadowColor: _secondaryColor.withOpacity(0.3),
          elevation: 4,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )),
      textTheme: _textTheme(true),
      fontFamily: kIsWeb && HtmlHelpers().getUserAgent().contains('OS 15_') ? '-apple-system' : null,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: createMaterialColor(_primaryColor),
        accentColor: _secondaryColor,
      ).copyWith(background: Colors.black87),
    );

    return AppTheme(themeData: _themeData);
  }

  static TextTheme _textTheme([bool isDark = false]) {
    return TextTheme(
      headline1: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: isDark ? _textColorLight : _textColorDark,
      ),
      headline2: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: isDark ? _textColorLight : _textColorDark,
      ),
      headline3: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: isDark ? _textColorLight : _textColorDark,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: (isDark ? _textColorLight : _textColorDark).withOpacity(0.8),
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: (isDark ? _textColorLight : _textColorDark).withOpacity(0.7),
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: (isDark ? _textColorLight : _textColorDark).withOpacity(0.6),
      ),
    );
  }

  static appVariantToColor(BuildContext context, AppColorVariant variant) {
    final _colors = Theme.of(context).colorScheme;
    switch (variant) {
      case AppColorVariant.Primary:
        return _colors.primary;
      case AppColorVariant.Secondary:
        return _colors.secondary;
      case AppColorVariant.Info:
        return _colors.info;
      case AppColorVariant.Success:
        return _colors.success;
      case AppColorVariant.Warning:
        return _colors.warning;
      case AppColorVariant.Danger:
        return _colors.danger;
      case AppColorVariant.Light:
        return _colors.light;
      case AppColorVariant.Dark:
        return _colors.dark;
    }
  }
}

List<BoxShadow> get glowingBox {
  return [
    BoxShadow(
      color: Color(0xFF82e4fb).withOpacity(0.15),
      spreadRadius: 3,
      blurRadius: 3,
    ),
  ];
}
