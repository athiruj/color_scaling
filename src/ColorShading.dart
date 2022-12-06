/// A comment.
import 'dart:developer' as log;

// Color Shading

void main() {
  // var value = 0xff00fdfc;
  // var r = (0x00ff0000 & value) >> 16;
  // var g = (0x0000ff00 & value) >> 8;
  // var b = (0x000000ff & value) >> 0;
  // if (value > 0xffffff) value = (0x00ffffff & value);
  // print(value.toRadixString(2));
  // print('$r ,$g ,$b');

  // print((0xff - r) ~/ (4 + 1));
  // print(((0xff - r) / (4 + 1)).toInt());
  // var lSteps = 4;
  // // var dSteps = 5;
  print(lightShade(11));
  log.log('index out of Shade Scale ${10}',name: 'Hello');
  // var idx = 1;
  // final rScale = (((0xff - r) / (lSteps + 1)) * idx).toInt();
  // final gScale = (((0xff - g) / (lSteps + 1)) * idx).toInt();
  // final bScale = (((0xff - b) / (lSteps + 1)) * idx).toInt();
  // var val =
  //     (a | ((r + rScale) << 16) | ((g + gScale) << 8) | ((b + bScale) << 0)) &
  //         0xffffffff;
  // print('${r + rScale} ,${g + gScale} ,${b + bScale}');
}

int lightShade(int idx){ 
    if(idx <= 10) return 1;
    assert(idx <= 10, 'index is Shade Scale value about 1 to ${9+1}') ;
    // debugPrint('index out of Shade Scale ${10}');
    print('$idx is out of Shade Scale 1 to ${10}');
    return -1;
    }
class ColorShade {
  /// alpha or opcity value in hex
  /// default fully transparent white (invisible)
  // final int value;
  final int a = 0xff000000;

  late int r;
  late int g;
  late int b;

  late int lightSteps = 4;
  late int darkSteps = 5;

  late List csList;

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
  /// In other words, if RR the red value in hex,GG the green value in hex,
  /// and BB the blue value in hex, a color can be
  /// expressed as `const ColorShade(0xRRGGBB)`.
  ///
  /// int 32bits, int 24bits
  ColorShade(int value, {int? lSteps, int? dSteps}) {
    /// Tranfrom 32bits to 24bits
    if (value > 0xffffff) value = (0x00ffffff & value);
    /// The red channel of this color in an 8 bit value.
    this.r = (0x00ff0000 & value) >> 16;
    /// The red channel of this color in an 8 bit value.
    this.g = (0x0000ff00 & value) >> 8;
    /// The red channel of this color in an 8 bit value.
    this.b = (0x000000ff & value) >> 0;
    this.lightSteps = lSteps ?? this.lightSteps;
    this.darkSteps = dSteps ?? this.darkSteps;
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
  /// For example, ColorShade(255, 56, 211).
  /// 255 is the Red value in hex, 56 is the Green value in hex,
  /// and 211 is the Blue value in hex.
  ColorShade.fromRGB(int r, int g, int b, {int? lightSteps, int? darkSteps}) {
    this.r = r & 0xff;
    this.g = g & 0xff;
    this.b = b & 0xff;
  }

  // The Light Red Step value scale calculate 
  int get rLScale => (0xff - r) ~/ (lightSteps + 1);
  // The Light Red Step value scale calculate 
  int get rDScale => r ~/ (darkSteps + 1);
  // The Light Green Step value scale calculate 
  int get gLScale => (0xff - g) ~/ (lightSteps + 1);
  // The Dark Green Step value scale calculate 
  int get gDScale => g ~/ (darkSteps + 1);
  // The Light Blue Step value scale calculate 
  int get bLScale => (0xff - b) ~/ (lightSteps + 1);
  // The Dark Blue Step value scale calculate 
  int get bDScale => b ~/ (darkSteps + 1);

  int lightShade(int idx){ 
    if(idx <= lightSteps+darkSteps+1) return to32bits(r + (rLScale*idx),g + (gLScale*idx),b + (bLScale*idx));
    assert(idx <= lightSteps+darkSteps+1, 'index is Shade Scale value about 1 to ${lightSteps+darkSteps+1}');
    log.log('$idx out of Shade Scale ${lightSteps+darkSteps+1}',name: 'Error');
    print('index is Shade Scale value about 1 to ${lightSteps+darkSteps+1}');
    return -1;
    }
  
  int darkShade(int idx){
    if(idx <= lightSteps+darkSteps+1) return to32bits(r - (rDScale*idx),g - (gDScale*idx),b - (bDScale*idx));
    assert(idx <= lightSteps+darkSteps+1, 'index is Shade Scale value about 1 to ${lightSteps+darkSteps+1}');
    log.log('$idx out of Shade Scale ${lightSteps+darkSteps+1}',name: 'Error');
    print('index is Shade Scale value about 1 to ${lightSteps+darkSteps+1}');
    return -1;
    }
  
  int to32bits(int r, int g, int b,){
    return (this.a |
            (r << 16) |
            (g << 8 ) |
            (b << 0 ))& 0xffffffff;
  }

  int shading(int idx) {
    return (0xffffffff);
  }
}
