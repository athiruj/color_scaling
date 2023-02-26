# Color_Hue_N_Tint
> This is package to generate color shading palette with hue and tint value from [HSL](https://color.lukas-stratmann.com/color-systems/hsl.html) cylinder.

![HSL](https://github.com/athiruj/color_hue_n_tint/blob/master/tutorials_img/HSL.png?raw=true)

## Constructor
### HueNTint(int value)
 Color Construct is from the lower 32 bits

```dart
HueNTint color = HueNTint(0xff0000) // Red
```

### HueNTint(int r, int g, int b)
 Construct a color from the lower 8 bits of four integers.
   * `r` is red, from 0 to 255.
   * `g` is green, from 0 to 255.
   * `b` is blue, from 0 to 255.

```dart
HueNTint color = HueNTint(00, 255, 00) // Green
```

## Features
 - #### [.palette()]() - function to create a palette with shading in form of a `List<Color>`.
 - #### [.tints()]() - function to create a light palette in form of a `List<Color>`.
 - #### [.hues()]() - function to create a dark palette in form of a `List<Color>`.
 
### .palette({double? scale})
function to create a palette with shading in form of a `List<Color>`.
 
> ![](https://github.com/athiruj/color_hue_n_tint/blob/master/tutorials_img/Shader_default.png?raw=true) 

```dart
// HueNTint(int value, shades: 10, index: 5, fullScale: false)
HueNTint color = HueNTint(0xff0000);
List<Color> colorList = color.palette(); 
//  output:[
//          Color(0xffffd4d4),
//          Color(0xffffaaaa),
//          Color(0xffff7f7f),
//          Color(0xffff5555),
//          Color(0xffff2a2a),
//          Color(0xffff0000),
//          Color(0xffcc0000),
//          Color(0xff990000),
//          Color(0xff660000),
//          Color(0xff330000)
//         ]

```

### `.tints({double? scale})`
function to create a light part of the palette.
 
> ![](https://github.com/athiruj/color_hue_n_tint/blob/master/tutorials_img/lightPalette_default.png?raw=true) 

```dart
// HueNTint(int value, shades: 10, index: 5, fullScale: false)
HueNTint color = HueNTint(0xff0000);
List<Color> colorList = color.lightPalette(); 
//  output:[
//          Color(0xffffd4d4),
//          Color(0xffffaaaa),
//          Color(0xffff7f7f),
//          Color(0xffff5555),
//          Color(0xffff2a2a),
//         ]

```

### `.hues({double? scale})`
function to create a dark part of the palette.

 > ![](https://github.com/athiruj/color_hue_n_tint/blob/master/tutorials_img/darkPalette_default.png?raw=true) 

 ```dart
// HueNTint(int value, shades: 10, index: 5, fullScale: false)
HueNTint color = HueNTint(0xff0000);
List<Color> colorList = color.tints(); 
//  output:[
//          Color(0xffcc0000),
//          Color(0xff990000),
//          Color(0xff660000),
//          Color(0xff330000)
//         ]

```

## Source
 - [The Three Components of Color](https://www.virtualartacademy.com/three-components-of-color/)
 - [HSL](https://color.lukas-stratmann.com/color-systems/hsl.html)
 - [HSL cylinder](https://en.wikipedia.org/wiki/HSL_and_HSV)
