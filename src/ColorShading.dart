// import 'package:flutter/material.dart';
// Color Shading

void main() {
  var red = const ColorShader(0xffff0000);
  print(red.darkShading(darkLv: 4,pos: 4).toRadixString(16));
  print(red.darkShading(darkLv: 4,pos: 3).toRadixString(16));
  print(red.darkShading(darkLv: 4,pos: 2).toRadixString(16));
  print(red.darkShading(darkLv: 4,pos: 1).toRadixString(16));
  print(red.lightShading(lightLv: 4,pos: 1).toRadixString(16));
  print(red.lightShading(lightLv: 4,pos: 2).toRadixString(16));
  print(red.lightShading(lightLv: 4,pos: 3).toRadixString(16));
  print(red.lightShading(lightLv: 4,pos: 4).toRadixString(16));
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
  // List<int> get shade => List.empty();
  // late Color color;
  // int? lightLv;
  // int? darkShade;

  /// The red channel of this color in an 8 bit value.
  int get red => (0x00ff0000 & value) >> 16;

  /// The red channel of this color in an 8 bit value.
  int get green => (0x0000ff00 & value) >> 8;

  /// The red channel of this color in an 8 bit value.
  int get blue => (0x000000ff & value) >> 0;

  List<int> shader({int? lightLv, int? darkLv, double? scale}) {
    return shader();
  }

  List<int> lightShader({int? lightLv, double? scale}){
    return lightShader();
  }
  
  List<int> darkShader({int? lightLv, double? scale}){
    return darkShader();
  }

  /// Return new Color with lighter shade
  int darkShading({

    /// [darkLv] is 'dark level scales'
    required int darkLv, 

    /// [pos] is position of Color in 'dark level scales'
    required int pos, 

    /// [scale]
    double? scale})
    {
    assert(darkLv != 0, 'dark shade level was zero.');
    assert(darkLv >= pos && pos < 0, 'position was over dark shade level');
    assert(scale! >= 0.0, 'scale was less 0.0');
    assert(scale! <= 1.0, 'scale was over 1.0');
    scale = scale ?? 1.0;
    return ( 0xff000000                                                                  |
                ((red - (red ~/ (darkLv + 1) * scale * pos)).toInt() << 16)    |
                ((green - (green ~/ (darkLv + 1) * scale * pos)).toInt() << 8) |
                ((blue - (blue ~/ (darkLv + 1) * scale * pos)).toInt() << 0 ) & 0xffffffff 
    );
  }

  /// Return new Color with lighter shade
  int lightShading({
    /// [lightLv] is 'light level scales'
    required int lightLv, 

    /// [pos] is position of Color in 'light level scales'
    required int pos, 

    /// [scale]
    double? scale})
    {
    assert(lightLv != 0, 'light shade level was zero.');
    assert(lightLv >= pos && pos < 0, 'position was over light shade level');
    assert(scale! >= 0.0, 'scale was less 0.0');
    assert(scale! <= 1.0, 'scale was over 1.0');
    scale = scale ?? 1.0;
    return ( 0xff000000                                                                  |
                ((red + ((0xff - red) ~/ (lightLv + 1) * scale * pos)).toInt() << 16)    |
                ((green + ((0xff - green) ~/ (lightLv + 1) * scale * pos)).toInt() << 8) |
                ((blue + ((0xff - blue) ~/ (lightLv + 1) * scale * pos)).toInt() << 0 ) & 0xffffffff 
    );
  }


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
