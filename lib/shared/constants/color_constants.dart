import 'package:flutter/material.dart';

class ColorConstants {
  static Color lightBackgroundColor = hexToColor('#FBF8F0');
  static Color primaryColor = hexToColor("#00A8E8");
  static Color storyHighlightColor = hexToColor("#F8C371");
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
