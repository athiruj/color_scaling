part of color_hue_n_tint;

extension Palette on List<Color> {
  /// [.toListInt] generate New List with inside is `Color type` in List convert to `Int type`
  /// * **Example**
  /// ```
  ///  [ Color(0xff0000ff),       [ 4278190335,
  ///    Color(0xff00ff00),   =>    4278255360,
  ///    Color(0xffff0000) ]        4294901760 ]
  /// ```
  List<int> toListInt() {
    return List.generate(length, (i) => this[i].value);
  }

  /// [.toListString] generate New List with inside is `Color type` in List convert to `String type`
  /// * **Example**
  /// ```
  ///  [ Color(0xff0000ff),       [ "0xff0000ff",
  ///    Color(0xff00ff00),   =>    "0xff00ff00",
  ///    Color(0xffff0000) ]        "0xffff0000" ]
  /// ```
  List<String> toListString() {
    return List.generate(length, (i) => '0x${this[i].value.toRadixString(16)}');
  }
}
