import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

class AppColor {
  static Color primarySeedColor  = HexColor("#0097B2");
  static Color secondarySeedColor  = HexColor("#545454");
  static Color tertiarySeedColor  = HexColor("#DDE8EA");
  static Color blackColor = HexColor("#000000");
  static Color whiteColor = HexColor("#FFFFFF");


  static ColorScheme schemeLight = SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    primaryKey: primarySeedColor,
    secondaryKey: secondarySeedColor,
    tertiaryKey: tertiarySeedColor,
    tones: FlexTones.vivid(Brightness.light),
  );

  static ColorScheme schemeDark = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: primarySeedColor,
    secondaryKey: secondarySeedColor,
    tertiaryKey: tertiarySeedColor,
    tones: FlexTones.vivid(Brightness.dark),
  );

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
