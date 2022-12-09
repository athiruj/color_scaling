
/// `ColorShader`
class ColorShader {
  final int value;
  static const opcity = 0xff000000;

  /// Normaly Color Construct is from the lower 32 bits
  /// but [ColorShader] not support `opcity` or `alpha value` in hex 
  /// so [ColorShader] Construct is from the lower 24 bits
  ///
  /// The bits are interpreted as follows:
  ///
  /// * ❌ Bits 24-31 are the alpha/opcity value.
  /// * ✅ `Bits 16-23 are the red value.`
  /// * ✅ `Bits 8-15 are the green value.`
  /// * ✅ `Bits 0-7 are the blue value.`
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
  /// For example, `const ColorShade(255, 56, 211)`.
  /// `255` is the Red value in hex,
  ///  `56` is the Green value in hex,
  /// and `211` is the Blue value in hex.
  const ColorShader.fromRGB(
    int r,
    int g,
    int b,
  ) : value = (0xff000000 | (r << 16) | (g << 8) | (b << 0)) & 0xffffffff;


  /// The red channel of this color in an 8 bit value.
  int get r => (0x00ff0000 & value) >> 16;

  /// The red channel of this color in an 8 bit value.
  int get g => (0x0000ff00 & value) >> 8;

  /// The red channel of this color in an 8 bit value.
  int get b => (0x000000ff & value) >> 0;

  List<int> shaderGen({int lightLv = 4, int darkLv = 5, double scale = 1}) {
    return lightShader(lightLv: lightLv, scale: scale).reversed.toList() +
        darkShader(darkLv: darkLv, scale: scale).sublist(1);
  }

  List<int> lightShader({required int lightLv, double scale = 1}) {
    return List.generate(lightLv + 1,
        (int idx) => lightShading(lightLv: lightLv, pos: idx, scale: scale));
  }

  List<int> darkShader({required int darkLv, double scale = 1}) {
    return List.generate(darkLv + 1,
        (int idx) => darkShading(darkLv: darkLv, pos: idx, scale: scale));
  }

/// Return new Color with lighter shade
int lightShading({

      /// [lightLv] is `Light Level`
      required int lightLv,

      /// [pos] is position of Color in `Light level`
      required int pos,

      /// [scale]
      double scale = 1}) {

    assert(lightLv != 0, 'light shade level was zero.');
    assert(lightLv >= pos && pos < 0, 'position was over light shade level');
    assert(scale >= 0.0, 'scale was less 0.0');
    assert(scale <= 1.0, 'scale was over 1.0');    
    return (0xff000000                                              |
           ((r + (r ~/ (lightLv + 1) * scale * pos)).toInt() << 16) |
           ((g + (g ~/ (lightLv + 1) * scale * pos)).toInt() << 08) |
           ((b + (b ~/ (lightLv + 1) * scale * pos)).toInt() << 00) & 0xffffffff);
  }

  /// Return new Color with lighter shade
  int darkShading({

      /// [darkLv] is `Dark Level`
      required int darkLv,

      /// [pos] is position of Color in `Dark Level`
      required int pos,

      /// [scale]
      double scale = 1}) {

    assert(darkLv != 0, 'dark shade level was zero.');
    assert(darkLv >= pos && pos < 0, 'position was over dark shade level');
    assert(scale >= 0.0, 'scale was less 0.0');
    assert(scale <= 1.0, 'scale was over 1.0');
    return (0xff000000                                             |
           ((r - (r ~/ (darkLv + 1) * scale * pos)).toInt() << 16) |
           ((g - (g ~/ (darkLv + 1) * scale * pos)).toInt() << 08) |
           ((b - (b ~/ (darkLv + 1) * scale * pos)).toInt() << 00) & 0xffffffff);
  }

//  @override
//   int get hashCode => value.hashCode;

  // @override
  // String toString() => '0x${value.toRadixString(16).padLeft(8, '0')}';
}
