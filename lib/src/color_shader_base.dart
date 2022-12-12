part of color_shader;

void main() {
  print(Color(0xffff0000).palette().toString());
}

extension Listo on List<Color> {
  String toInt() {
    return '';
  }
}

extension Shader on Color {
  List<Color> palette() {
    return [Color(0xff)];
  }

  List<Color> tints() {
    return [Color(0xff)];
  }

  List<Color> shades() {
    return [Color(0xff)];
  }

  Color withLightness() {
    return Color(0xff);
  }

  Color withDarkness() {
    return Color(0xff);
  }

  int toInt() {
    return value;
  }
}

/// `ColorShader`?