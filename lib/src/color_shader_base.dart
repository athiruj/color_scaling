part of color_shader;

class Shader {
  final int value;

  /// number of color shades
  int _shades = 10;

  /// position of main color in palette
  int _index = 5;

  /// Black White safety
  bool _fullScale = false;

  double _scale = 1.0;

  /// Normaly Color Construct is from the lower 32 bits
  /// but [Shader] not support `opcity` or `alpha value` in hex
  /// so [Shader] Construct is from the lower 24 bits
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
  /// **parameter:**
  /// * **int shades**
  ///   number of Color in palette.
  ///
  /// * **int index**
  ///   position of main Color in palette.
  ///
  /// * **bool fullScale**
  ///   full minimum & maximum value of scale 0 -> 255
  ///   * `fullScale: false`
  ///   Black White Safety
  /// ![Shader_default](https://github.com/athiruj/color_shader/blob/master/tutorials_img/Shader_default.png?raw=true)
  ///   * `fullScale: true`
  ///   Full scale with Black White
  /// ![Shader_full](https://github.com/athiruj/color_shader/blob/master/tutorials_img/Shader_full.png?raw=true)
  ///
  Shader(int value, {int? shades, int? index, bool fullScale = false})
      : value = value & 0xffffffff {
    assert(_shades >= _index, 's');
    assert(_shades >= 0, 's');
    _shades = shades ?? _shades;
    _index = index ?? _index;
    _fullScale = fullScale;
  }

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
  Shader.fromRGB(int r, int g, int b,
      {int? shades, int? index, bool fullScale = false})
      : value = (0xff000000 | (r << 16) | (g << 8) | (b << 0)) & 0xffffffff {
    assert(_shades >= _index, 's');
    assert(_shades >= 0, 's');
    _shades = shades ?? _shades;
    _index = index ?? _index;
    _fullScale = fullScale;
  }

  /// `[r]` The red channel of this color in an 8 bit value.
  int get r => (0x00ff0000 & value) >> 16;

  /// `[g]` The red channel of this color in an 8 bit value.
  int get g => (0x0000ff00 & value) >> 8;

  /// `[b]` The red channel of this color in an 8 bit value.
  int get b => (0x000000ff & value) >> 0;

  int get shades => _shades;

  bool get fullScale => _fullScale;

  int get index => _index;

  int get lightShades => _index;

  int get darkShades => _shades - (_index + 1);

  List<double> lightScale() {
    int s = fullScale ? 0 : 1;
    return [
      double.parse(((255 - r) / (lightShades + s) * _scale).toStringAsFixed(2)),
      double.parse(((255 - g) / (lightShades + s) * _scale).toStringAsFixed(2)),
      double.parse(((255 - b) / (lightShades + s) * _scale).toStringAsFixed(2))
    ];
  }

  List<double> darkScale() {
    int s = fullScale ? 0 : 1;
    return [
      double.parse((r / (darkShades + s) * _scale).toStringAsFixed(2)),
      double.parse((g / (darkShades + s) * _scale).toStringAsFixed(2)),
      double.parse((b / (darkShades + s) * _scale).toStringAsFixed(2))
    ];
  }

  /// [palette] is function to create a palette with shading in the form of a `List<Color>`.
  ///
  /// **parameter:**
  ///
  /// * double `scale` is `0.0(0%)` to `1.0(100%)` of value per Color , Default is `1.0(100%)`
  ///
  /// **Example:**
  /// * `Color(0xff0000, fullScale: false).palate()`
  ///
  ///   **output:**
  /// ```
  ///   [
  ///       Color(0xffffd4d4),
  ///       Color(0xffffaaaa),
  ///       Color(0xffff7f7f),
  ///       Color(0xffff5555),
  ///       Color(0xffff2a2a),
  ///       Color(0xffff0000),
  ///       Color(0xffcc0000),
  ///       Color(0xff990000),
  ///       Color(0xff660000),
  ///       Color(0xff330000)
  ///    ]
  ///```
  /// ![Shader_defualt](https://github.com/athiruj/color_shader/blob/master/tutorials_img/Shader_default.png?raw=true)
  ///
  List<Color> palette({double? scale}) {
    _scale = scale ?? _scale;
    List<Color> l = lightPalette(scale: _scale);
    List<Color> d = darkPalette(scale: _scale);
    return l.reversed.toList() + [Color(value)] + d;
  }

  /// [lightPalette] is function to create a light palette in the form of a `List<Color>`.
  ///
  /// **parameter:**
  ///
  /// * double `scale` is `0.0(0%)` to `1.0(100%)` of value per Color , Default is `1.0(100%)`
  ///
  /// **Example:**
  /// * `Color(0xff0000, fullScale: false).lightPalate()`
  ///
  ///   **output:**
  /// ```
  ///   [
  ///       Color(0xffffd4d4),
  ///       Color(0xffffaaaa),
  ///       Color(0xffff7f7f),
  ///       Color(0xffff5555),
  ///       Color(0xffff2a2a),
  ///    ]
  ///```
  /// ![lightPalette](https://github.com/athiruj/color_shader/blob/master/tutorials_img/lightPalette_default.png?raw=true)
  ///
  List<Color> lightPalette({double? scale}) {
    _scale = scale ?? _scale;
    assert(_scale >= 0.0 && _scale <= 1.0, '0.0 >= scale <= 1.0');
    return List.generate(
        lightShades,
        (n) => Color(0xff000000 |
            ((r + (lightScale()[0] * _scale * (n + 1))).toInt() << 16) |
            ((g + (lightScale()[1] * _scale * (n + 1))).toInt() << 08) |
            ((b + (lightScale()[2] * _scale * (n + 1))).toInt() << 00) &
                0xffffffff));
  }

  /// [darkPalette] is function to create a dark palette in the form of a `List<Color>`.
  ///
  /// **parameter:**
  ///
  /// * double `scale` is `0.0(0%)` to `1.0(100%)` of value per Color , Default is `1.0(100%)`
  ///
  /// **Example:**
  /// * `Color(0xff0000, fullScale: false).darkPalate()`
  ///
  ///   **output:**
  /// ```
  ///   [
  ///       Color(0xffcc0000),
  ///       Color(0xff990000),
  ///       Color(0xff660000),
  ///       Color(0xff330000)
  ///    ]
  ///```
  /// ![darkPalette](https://github.com/athiruj/color_shader/blob/master/tutorials_img/darkPalette_default.png?raw=true)
  ///
  List<Color> darkPalette({double? scale}) {
    _scale = scale ?? _scale;
    assert(_scale >= 0.0 && _scale <= 1.0, '0.0 >= scale <= 1.0');
    return List.generate(
        darkShades,
        (n) => Color(0xff000000 |
            ((r - (darkScale()[0] * _scale * (n + 1))).toInt() << 16) |
            ((g - (darkScale()[1] * _scale * (n + 1))).toInt() << 08) |
            ((b - (darkScale()[2] * _scale * (n + 1))).toInt() << 00) &
                0xffffffff));
  }

  /// Shading % of value to White
  Color lightness({required double? scale}) {
    _scale = scale ?? _scale;
    return Color(0xff000000 |
        ((r + ((255 - r) * _scale)).toInt() << 16) |
        ((g + ((255 - g) * _scale)).toInt() << 08) |
        ((b + ((255 - b) * _scale)).toInt() << 00) & 0xffffffff);
  }

  /// Shading % of value to Black
  Color darkness({required double? scale}) {
    _scale = scale ?? _scale;
    return Color(0xff000000 |
        ((r - (r * _scale)).toInt() << 16) |
        ((g - (g * _scale)).toInt() << 08) |
        ((b - (b * _scale)).toInt() << 00) & 0xffffffff);
  }
}
