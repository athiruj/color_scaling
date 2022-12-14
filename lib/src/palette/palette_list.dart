part of color_shader;

extension PaletteList on List<Color> {
  List<int> toListInt() {
    return List.generate(length, (i) => this[i].value);
  }

  List<String> toListString() {
    return List.generate(length, (i) => '0x${this[i].value.toRadixString(16)}');
  }
}
