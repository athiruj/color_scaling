// import 'package:flutter/material.dart';
// Color Shading

void main() {
  var red = const ColorShader(0xffffff00).palatte[1];
  print(red);
}

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

  // ///Propertie
  final int value;
  // late Color color;
  // int lightScales;
  // int darkScales;

  // /// The red channel of this color in an 8 bit value.
  // int get red => (0x00ff0000 & value) >> 16;

  // /// The red channel of this color in an 8 bit value.
  // int get green => (0x0000ff00 & value) >> 8;

  // /// The red channel of this color in an 8 bit value.
  // int get blue => (0x000000ff & value) >> 0;

  // ColorShader get palatte => _palatte();
  // @override
  List<int> get palatte {
    return [1, 2, 3];
  }

  // List<Color> _palatte()=> [Color(0xffffffff)];

  // int lightShading(int index) {
  //   return to32bits(
  //       red + ((0xff - red) ~/ (lightScales + 1) * index),
  //       green + ((0xff - green) ~/ (lightScales + 1) * index),
  //       blue + ((0xff - blue) ~/ (lightScales + 1) * index));
  //   // assert(idx <= lightSteps+darkSteps+1, 'index is Shade Scale value about 1 to ${lightSteps+darkSteps+1}');
  //   // log.log('$idx out of Shade Scale ${lightSteps+darkSteps+1}',name: 'Error');
  //   // print('index is Shade Scale value about 1 to ${lightSteps+darkSteps+1}');
  //   // return -1;
  // }

  // int darkShading(int index) {
  //   return to32bits(
  //       red + (red ~/ (lightScales + 1) * index),
  //       green + (green ~/ (lightScales + 1) * index),
  //       blue + (blue ~/ (lightScales + 1) * index));
  // }

  // int to32bits(
  //   int r,
  //   int g,
  //   int b,
  // ) {
  //   return (0xff000000 | (r << 16) | (g << 8) | (b << 0)) & 0xffffffff;
  // }
}

// // The Light Red Step value scale calculate
// int get rLScale => (0xff - red) ~/ (lightSteps + 1);
// // The Light Red Step value scale calculate
// int get rDScale => red ~/ (darkSteps + 1);
// // The Light Green Step value scale calculate
// int get gLScale => (0xff - green) ~/ (lightSteps + 1);
// // The Dark Green Step value scale calculate
// int get gDScale => green ~/ (darkSteps + 1);
// // The Light Blue Step value scale calculate
// int get bLScale => (0xff - blue) ~/ (lightSteps + 1);
// // The Dark Blue Step value scale calculate
// int get bDScale => blue ~/ (darkSteps + 1);
