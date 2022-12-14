import 'package:flutter/material.dart';
import 'package:color_shader/color_shader.dart';
import 'package:test/test.dart';

void main() {
  group('Palette Propertie Test', () {
    var palette = Shader(0xffff0000).palette();
    test('palette', () {
      print(palette.value);
      expect(palette.shade500.value, equals(4294901760));
    });
    test('palette[]', () {
      print(palette[500]!.value);
      expect(palette[500]!.value, equals(4294901760));
    });


  });

  group('Palette List Propertie Test', () {
    List<Color> palette = Shader(0xffff0000).paletteList();
    test('palette lenght', () {
      print(palette.length);
      expect(palette.length, equals(1));
    });

    test('palette value', () {
      print(palette[0].value);
      expect(palette[0].value, equals(4294901760));
    });

    test('palette to List<int>', () {
      print(palette.toListInt());
      expect(palette.toListInt(), equals([4294901760]));
    });
    
    test('palette to List<String>', () {
      print(palette.toListString());
      expect(palette.toListString(), equals(["0xffff0000"]));
    });


  });
}
