import 'package:flutter/material.dart';

// Color Shading

void main() {
  // var th = test.fromARGB(255,255,255,255);
  // print(th.ptest());
  // var th1 = test.fromA(255);
  // print(th1.ptest());

  // var a_and = (a & 0xff);
  // var a_left = (a_and << 24);
  // var r_and = (r & 0xff);
  // var r_left = (r_and << 16);
  // var g_and = (g & 0xff);
  // var g_left = (g_and << 8);
  // var b_and = (b & 0xff);
  // var b_left = (b_and << 0);
  // var argb_or = (a_left|r_left|g_left|b_left);
  // var argb_and = argb_or & 0xffffffff;
  // print(a_and);
  // print(a_left.toRadixString(2));
  // print(r_and);
  // print(r_left.toRadixString(2));
  // print(g_and);
  // print(g_left.toRadixString(2));
  // print(b_and);
  // print(b_left.toRadixString(2));
  // print(argb_or);
  // print(argb_or.toRadixString(2));
  // print(argb_and);
  // print(argb_and.toRadixString(2));
  // print(0xffffffff);

  // var value = 0xf1f2f3;
  // print(value);
  // print(value.toRadixString(2));
  // if (value > 0xffffff) value = (value - ((value >> 24)<<24)) ;
  // print(value);
  // print(value.toRadixString(2));
  // var a = value >> 24;
  // var r = (value-(a << 24)) >> 16;
  // var g = (value-(a << 24)|(r << 16)) >> 8;
  // var b = (value-(a << 24)|(r << 16)|(g << 8))) >> 0;
  // var a = value >> 24;
  // var r = (value >> 16);
  // var g = (value-(r << 16)) >> 8;
  // var b = (value-((r << 16)|(g << 8))) >> 0;
  // print(w);
  // print(w.toRadixString(2));
  // print(a);
  // print(a.toRadixString(2));
  // print(r);
  // print(r.toRadixString(2));
  // print(g);
  // print(g.toRadixString(2));
  // print(b);
  // print(b.toRadixString(2));
  var a = 0xff000000;
  var r = 254;
  var g = 0;
  var b = 0;
  var lSteps = 4;
  // var dSteps = 5;
  var idx = 1;
  final rScale = (((0xff - r) / (lSteps + 1)) * idx).toInt();
  final gScale = (((0xff - g) / (lSteps + 1)) * idx).toInt();
  final bScale = (((0xff - b) / (lSteps + 1)) * idx).toInt();
  var val =
      (a | ((r + rScale) << 16) | ((g + gScale) << 8) | ((b + bScale) << 0)) &
          0xffffffff;
  // print(val.toRadixString(2));
  // print(a.toRadixString(2));
  print('${r + rScale} ,${g + gScale} ,${b + bScale}');
  // print(((r+rScale) << 16).toRadixString(2));
  // print(((g + gScale) << 8).toRadixString(2));
  // print(((b + bScale) << 0).toRadixString(2));
}

class ColorShade {
  /// alpha or opcity value in hex
  /// default fully transparent white (invisible)
  final int a = 0xff000000;

  late int r;
  late int g;
  late int b;

  // int? lightSteps = 4;
  // int? darkSteps = 5;

  late List csList;

  /// Construct a color from the lower 8 bits of four integers.
  ///
  /// * `r` is [red], from 0 to 255.
  /// * `g` is [green], from 0 to 255.
  /// * `b` is [blue], from 0 to 255.
  ///
  /// Out of range values are brought into range using modulo 255.
  ///
  /// See also [fromRGBO], which takes the alpha value as a floating point
  /// value.
  ///
  /// For example, ColorShade(255, 56, 211).
  /// 255 is the Red value in hex, 56 is the Green value in hex,
  /// and 211 is the Blue value in hex.
  ColorShade(int r, int g, int b, {int? lightSteps, int? darkSteps}) {
    this.r = r & 0xff;
    this.g = g & 0xff;
    this.b = b & 0xff;
  }

  /// Normaly Color Construct is from the lower 32 bits
  /// but [ColorShade] not support alpha value in hex or opcity
  /// so [ColorShade] Construct is from the lower 24 bits
  ///
  /// The bits are interpreted as follows:
  ///
  /// ! X Bits 24-31 are the alpha value.
  /// * / Bits 16-23 are the red value.
  /// * / Bits 8-15 are the green value.
  /// * / Bits 0-7 are the blue value.
  ///
  /// In other words, if RR the red value in hex,GG the green value in hex,
  /// and BB the blue value in hex, a color can be
  /// expressed as `const ColorShade(0xRRGGBB)`.
  ///
  ColorShade.from24bits(int value, {int? lightSteps, int? darkSteps}) {
    if (value > 0xffffff) value = (value - ((value >> 24) << 24)) & 0xffffff;
    r = (value >> 16) & 0xff;
    g = (value - (r << 16)) >> 8 & 0xff;
    b = (value - ((r << 16) | (g << 8))) >> 0 & 0xff;
    lightSteps = lightSteps;
    darkSteps = darkSteps;
  }

  Color _lightShade(int r, int g, int b, int idx, int? lSteps) {
    lSteps = lSteps ?? 4;
    final rScale = (((0xff - r) / (lSteps + 1)) * idx).toInt();
    final gScale = (((0xff - g) / (lSteps + 1)) * idx).toInt();
    final bScale = (((0xff - b) / (lSteps + 1)) * idx).toInt();
    return Color(
        (a | ((r + rScale) << 16) | ((g + gScale) << 8) | ((b + bScale) << 0)) &
            0xffffffff);
  }

  int shade(int idx) {
    return (0xffffffff);
  }
}
