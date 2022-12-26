# Color Shader
Color Shader is package to generate color shading palette with lightness value from [HSL](https://en.wikipedia.org/wiki/HSL_and_HSV) cylinder.

![HSL](https://github.com/athiruj/color_shader/blob/master/tutorials_img/HSL.png?raw=true)
source: [HSL cylinder](https://en.wikipedia.org/wiki/HSL_and_HSV)

## Constructor
##### Shader(int value)
 Color Construct is from the lower 32 bits

```dart
Shader color = Shader(0xff0000) // Red
```

##### Shader(int r, int g, int b)
 Construct a color from the lower 8 bits of four integers.
   * `r` is red, from 0 to 255.
   * `g` is green, from 0 to 255.
   * `b` is blue, from 0 to 255.

```dart
Shader color = Shader(00, 255, 00) // Green
```

## Features
 - ##### [.palette()]() - function to create a palette with shading in the form of a `List<Color>`.
 - ##### [.lightPalette()]()
 - ##### [.darkPalette()]()
 
 - ##### [.lightness()]()
 - ##### [.darkness()]()