import 'package:flutter/material.dart';
import 'app_theme.dart';

enum ColorShade { s50, s100, s200, s300, s400 }

class AppColors {
  static const Map<ColorShade, int> _shadeValues = {
    ColorShade.s50: 50,
    ColorShade.s100: 100,
    ColorShade.s200: 200,
    ColorShade.s300: 300,
    ColorShade.s400: 400,
  };

  static const Map<int, Color> gray = {
    50: Color(0xFF1f2225),
    100: Color(0xFF191b1d),
    200: Color(0xFF151718),
    300: Color(0xFF0b0d0f),
    400: Color(0xFF000000),
  };

  static const Map<int, Color> white = {
    50: Color(0xFFFFFFFF),
    100: Color(0xFFdedede),
    200: Color(0xFFcacace),
    300: Color(0xFFa8a8b6),
    400: Color(0xFFaaaaaa),
  };

  static const Map<int, Color> blue = {
    50: Color(0xFFA5D5FB),
    100: Color(0xFF73c4fa),
    200: Color(0xFF497C9F),
    300: Color(0xFF31536B),
    400: Color(0xFF1A2C38),
  };

  static const Map<int, Color> indigo = {
    50: Color(0xFFD4C8FC),
    100: Color(0xFFAB92FB),
    200: Color(0xFF8163D6),
    300: Color(0xFF55418D),
    400: Color(0xFF2C2148),
  };

  static const Map<int, Color> orchid = {
    50: Color(0xFFFCBBF3),
    100: Color(0xFFF370E3),
    200: Color(0xFFB252A7),
    300: Color(0xFF76366F),
    400: Color(0xFF401E3C),
  };

  static const Map<int, Color> sanguine = {
    50: Color(0xFFFCC0C1),
    100: Color(0xFFFA7B7E),
    200: Color(0xFFBD5759),
    300: Color(0xFF7E3A3B),
    400: Color(0xFF441F20),
  };

  static const Map<int, Color> gold = {
    50: Color(0xFFE4D069),
    100: Color(0xFFB3A452),
    200: Color(0xFF83773C),
    300: Color(0xFF554E27),
    400: Color(0xFF2E2A15),
  };

  static const Map<int, Color> harlequin = {
    50: Color(0xFF8FE469),
    100: Color(0xFF70B352),
    200: Color(0xFF53843D),
    300: Color(0xFF355527),
    400: Color(0xFF1C2E15),
  };

  static const Map<int, Color> springGreen = {
    50: Color(0xFF69E5AD),
    100: Color(0xFF52B388),
    200: Color(0xFF3D8464),
    300: Color(0xFF285742),
    400: Color(0xFF163025),
  };

  static Color getGray([ColorShade shade = ColorShade.s100]) {
    return gray[_shadeValues[shade]]!;
  }

  static Color getWhite([ColorShade shade = ColorShade.s100]) {
    return white[_shadeValues[shade]]!;
  }

  static Color getBlue([ColorShade shade = ColorShade.s100]) {
    return blue[_shadeValues[shade]]!;
  }

  static Color getIndigo([ColorShade shade = ColorShade.s100]) {
    return indigo[_shadeValues[shade]]!;
  }

  static Color getOrchid([ColorShade shade = ColorShade.s100]) {
    return orchid[_shadeValues[shade]]!;
  }

  static Color getSanguine([ColorShade shade = ColorShade.s100]) {
    return sanguine[_shadeValues[shade]]!;
  }

  static Color getGold([ColorShade shade = ColorShade.s100]) {
    return gold[_shadeValues[shade]]!;
  }

  static Color getHarlequin([ColorShade shade = ColorShade.s100]) {
    return harlequin[_shadeValues[shade]]!;
  }

  static Color getSpringGreen([ColorShade shade = ColorShade.s100]) {
    return springGreen[_shadeValues[shade]]!;
  }

  static Color getBtc() {
    return Color(0xfff7931a);
  }

  static Color getBtcSubtle() {
    return Color(0xfff7931a).withOpacity(0.7);
  }

  static Color getReserve() {
    return Colors.deepPurple.shade200;
  }

  static Color getVbtc() {
    return Colors.pinkAccent.shade400;
  }

  static Color colorVariantToColor(AppColorVariant variant, [ColorShade shade = ColorShade.s100]) {
    switch (variant) {
      case AppColorVariant.Primary:
        return getGray(shade);
      case AppColorVariant.Secondary:
        return getBlue(shade);

      case AppColorVariant.Info:
        return getIndigo(shade);

      case AppColorVariant.Success:
        return getSpringGreen(shade);

      case AppColorVariant.Warning:
        return getGold(shade);

      case AppColorVariant.Danger:
        return Color(0xFFBA2121);

      case AppColorVariant.Light:
        return getWhite(shade);

      case AppColorVariant.Dark:
        return getGray(shade);

      case AppColorVariant.Btc:
        return Color(0xfff7931a).withOpacity(0.7);
      case AppColorVariant.Reserve:
        return getReserve();
      case AppColorVariant.Vbtc:
        return getVbtc();
    }
  }

  static Color colorVariantToColorFg(AppColorVariant variant, [ColorShade shade = ColorShade.s100]) {
    switch (variant) {
      case AppColorVariant.Primary:
        return Colors.white;
      case AppColorVariant.Secondary:
        return Colors.black;

      case AppColorVariant.Info:
        return Colors.white;

      case AppColorVariant.Success:
        return Colors.white;

      case AppColorVariant.Warning:
        return Colors.black;

      case AppColorVariant.Danger:
        return Colors.white;

      case AppColorVariant.Light:
        return Colors.black;

      case AppColorVariant.Dark:
        return Colors.white;

      case AppColorVariant.Btc:
        return Colors.white;

      case AppColorVariant.Reserve:
        return Colors.black;
      case AppColorVariant.Vbtc:
        return Colors.black;
    }
  }
}
