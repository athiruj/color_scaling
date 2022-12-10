


void main() {
  // Shader(0xff24dd)
  //     .shader()
  //     .forEach((element) => print('color ${element.toString()}'));
  Shader color = Shader(0xffffffff);
  print(color);
}

/// `Shader`
class Shader {
  final int value;
  static const opcity = 0xff000000;

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
  /// int 32bits, int 24bits
  const Shader(int value) : value = value & 0x00ffffff;

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
  const Shader.fromRGB(
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


  /// [shader] is Function to generate List of Color with shaded
  ///
  /// **required:**
  ///
  /// * int `lightLv` is number of Light Levels, Default is `4`
  /// * int `darkLv` is number of Light Levels, Default is `5`
  /// * double `scale` is `0.0(0%)` to `1.0(100%)` of value per level , Default is `1.0(100%)`
  ///
  /// **Example:**
  /// * `Color(0xff0000).shader(lightLv: 4, darkLv: 5, scale: 1.0)`
  ///
  ///   **output:**
  ///   []
  ///
  /// ![Shader](https://raw.githubusercontent.com/athiruj/color_shader/master/tutorials_img/Shader.png)
  ///
  // List<int> shader({int lightLv = 4, int darkLv = 5, double scale = 1}) {
  //   return lightShader(level: lightLv, scale: scale).reversed.toList() +
  //       darkShader(level: darkLv, scale: scale).sublist(1);
  // }

  // List<int> lightShader({required int level, double scale = 1}) {
  //   return List.generate(level + 1,
  //       (int idx) => lightShading(level: level, pos: idx, scale: scale));
  // }

  // List<int> darkShader({required int level, double scale = 1}) {
  //   return List.generate(level + 1,
  //       (int idx) => darkShading(level: level, pos: idx, scale: scale));
  // }

  /// Return new Color with lighter shade
  // int lightShading({required int level, required int pos,double scale =1}) => LightShader(value).shading(level: level,pos: pos,scale: scale);


  /// Return new Color with lighter shade
  int darkShading(
      {

      /// [darkLv] is `Dark Level`
      required int level,

      /// [pos] is position of Color in `Dark Level`
      required int pos,

      /// [scale]
      double scale = 1}) {
    assert(level != 0, 'dark shade level was zero.');
    assert(level >= pos && pos < 0, 'position was over dark shade level');
    assert(scale >= 0.0, 'scale was less 0.0');
    assert(scale <= 1.0, 'scale was over 1.0');
    return (0xff000000 |
        ((r - (r ~/ (level + 1) * scale * pos)).toInt() << 16) |
        ((g - (g ~/ (level + 1) * scale * pos)).toInt() << 08) |
        ((b - (b ~/ (level + 1) * scale * pos)).toInt() << 00) & 0xffffffff);
  }
}

class LightShader{

  final int value;
  final int level;
  double scale = 1;

  LightShader(int value,{required this.level, double scale =1}) :
  value = value & 0x00ffffff;

  // const LightShader.fromRGB(int r,int g,int b,): super.fromRGB(r, g, b);
    /// The red channel of this color in an 8 bit value.
  int get r => (0x00ff0000 & value) >> 16;

  /// The red channel of this color in an 8 bit value.
  int get g => (0x0000ff00 & value) >> 8;

  /// The red channel of this color in an 8 bit value.
  int get b => (0x000000ff & value) >> 0;

  /// Return new Color with lighter shade
  int shading(
      {

      /// [level] is `Light Level`
      required int level,

      /// [pos] is position of Color in `Light level`
      required int pos,

      /// [scale]
      double scale = 1
      }) {

    assert(level != 0, 'light shade level was zero.');
    assert(level >= pos && pos < 0, 'position was over light shade level');
    assert(scale >= 0.0, 'scale was less 0.0');
    assert(scale <= 1.0, 'scale was over 1.0');
    return (0xff000000 |
        ((r + (r ~/ (level + 1) * scale * pos)).toInt() << 16) |
        ((g + (g ~/ (level + 1) * scale * pos)).toInt() << 08) |
        ((b + (b ~/ (level + 1) * scale * pos)).toInt() << 00) & 0xffffffff);
  }

  
  // List<int> generate({required int level, double scale = 1}) {
  //   return List.generate(level + 1,
  //       (int idx) => lightShading(level: level, pos: idx, scale: scale));
  // }

}