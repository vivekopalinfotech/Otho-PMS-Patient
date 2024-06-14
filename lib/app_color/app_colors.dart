import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColor {
  static Color primarySeedColor = HexColor("#4099FF");
  static Color secondarySeedColor = HexColor("#545454");
  static Color secondaryLightColor = Colors.grey.shade300;
  static Color secondaryDarkColor = HexColor("#191919");
  static Color bgDarkColor = HexColor("#24292f");
  static Color tertiarySeedColor = HexColor("#DDE8EA");
  static Color blackColor = HexColor("#000000");
  static Color whiteColor = HexColor("#FFFFFF");
  static Color successColor = HexColor("#2ED8B6");
  static Color errorColor = HexColor("#FF5370");
  static Color successContainer = HexColor("#2ED8B6").withOpacity(.4);

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
