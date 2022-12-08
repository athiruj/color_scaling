import 'package:flutter/material.dart';

// Color Shader tools
class ColorShader {
  /// Normaly Color Construct is from the lower 32 bits
  /// but [ColorShade] not support alpha value in hex or opcity
  /// so [ColorShade] Construct is from the lower 24 bits
  ///
  /// The bits are interpreted as follows:
  ///
  /// * X Bits 24-31 are the alpha value.
  /// * / Bits 16-23 are the red value.
  /// * / Bits 8-15 are the green value.
  /// * / Bits 0-7 are the blue value.
  ///
  /// In other words, if 'RR' the red value in hex, 'GG' the green value in hex,
  /// and 'BB' the blue value in hex, a color can be
  /// expressed as `const ColorShade(0xRRGGBB)`.
  ///
  /// int 32bits, int 24bits
  const ColorShader(int value) : value = value & 0x00ffffff;

  /// Construct a color from the lower 8 bits of four integers.
  ///
  /// * `r` is [red], from 0 to 255.
  /// * `g` is [green], from 0 to 255.
  /// * `b` is [blue], from 0 to 255.
  ///
  /// Out of range values are brought into range using modulo 255.
  ///
  /// See also [fromRGB], which takes the alpha value as a floating point
  /// value.
  ///
  /// For example, ColorShade(255, 56, 211).
  /// 255 is the Red value in hex, 56 is the Green value in hex,
  /// and 211 is the Blue value in hex.
  const ColorShader.fromRGB(
    int r,
    int g,
    int b,
  ) : value = (0xff000000 | (r << 16) | (g << 8) | (b << 0)) & 0xffffffff;

  final int value;

  /// The red channel of this color in an 8 bit value.
  int get red => (0x00ff0000 & value) >> 16;

  /// The red channel of this color in an 8 bit value.
  int get green => (0x0000ff00 & value) >> 8;

  /// The red channel of this color in an 8 bit value.
  int get blue => (0x000000ff & value) >> 0;

  List<Color> shader({int? lightLv, int? darkLv, double? scale}) {
    return lightShader(level: lightLv ?? 4, scale: scale).reversed.toList() +
        darkShader(level: darkLv ?? 5, scale: scale).sublist(1);
  }

  List<Color> lightShader({required int level, double? scale}) {
    return List.generate(level + 1,
        (int idx) => lightShading(level: level, pos: idx, scale: scale));
  }

  List<Color> darkShader({required int level, double? scale}) {
    return List.generate(level + 1,
        (int idx) => darkShading(level: level, pos: idx, scale: scale));
  }

  /// Return new Color with lighter shade
  Color darkShading(
      {

      /// [level] is 'dark level scales'
      required int level,

      /// [pos] is position of Color in 'dark level scales'
      required int pos,

      /// [scale]
      double? scale}) {
    assert(level != 0, 'dark shade level was zero.');
    assert(level >= pos && pos < 0, 'position was over dark shade level');
    assert(scale! >= 0.0, 'scale was less 0.0');
    assert(scale! <= 1.0, 'scale was over 1.0');
    scale = scale ?? 1.0;
    return Color(0xff000000 |
        ((red - (red ~/ (level + 1) * scale * pos)).toInt() << 16) |
        ((green - (green ~/ (level + 1) * scale * pos)).toInt() << 8) |
        ((blue - (blue ~/ (level + 1) * scale * pos)).toInt() << 0) &
            0xffffffff);
  }

  /// Return new Color with lighter shade
  Color lightShading(
      {

      /// [level] is 'light level scales'
      required int level,

      /// [pos] is position of Color in 'light level scales'
      required int pos,

      /// [scale]
      double? scale}) {
    assert(level != 0, 'light shade level was zero.');
    assert(level >= pos && pos < 0, 'position was over light shade level');
    assert(scale! >= 0.0, 'scale was less 0.0');
    assert(scale! <= 1.0, 'scale was over 1.0');
    scale = scale ?? 1.0;
    return Color(0xff000000 |
        ((red + ((0xff - red) ~/ (level + 1) * scale * pos)).toInt() << 16) |
        ((green + ((0xff - green) ~/ (level + 1) * scale * pos)).toInt() << 8) |
        ((blue + ((0xff - blue) ~/ (level + 1) * scale * pos)).toInt() << 0) &
            0xffffffff);
  }
}
