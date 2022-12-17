import 'package:flutter/material.dart';
import 'package:color_shader/color_shader.dart';
import 'package:test/test.dart';

void main() {
  group('Shader Class (Default 32bits) ', () {
    Shader shader = Shader(0xffff0000);

    test('.paletteList()', () {
      expect(
          shader.palette(),
          equals([
            Color(0xffffd4d4),
            Color(0xffffaaaa),
            Color(0xffff7f7f),
            Color(0xffff5555),
            Color(0xffff2a2a),
            Color(0xffff0000),
            Color(0xffcc0000),
            Color(0xff990000),
            Color(0xff660000),
            Color(0xff330000)
          ]));
    });

    test('.lightPalette()', () {
      expect(
          shader.lightPalette(),
          equals([
            Color(0xffff2a2a),
            Color(0xffff5555),
            Color(0xffff7f7f),
            Color(0xffffaaaa),
            Color(0xffffd4d4)
          ]));
    });

    test('.darkPalette()', () {
      expect(
          shader.darkPalette(),
          equals([
            Color(0xffcc0000),
            Color(0xff990000),
            Color(0xff660000),
            Color(0xff330000)
          ]));
    });

    test('Default Properties Test', () {
      // print('All shades number of palette (default)');
      expect(shader.shades, equals(10));

      // print('Position of default (default)');
      expect(shader.pos, equals(5));

      // print('Percent difference values ​​per scale (default)');

      // print('All shades number of light side palette (default)');
      expect(shader.lightShades, equals(5));

      // print('All shades number of dark side palette (default)');
      expect(shader.darkShades, equals(4));

      // print('List of difference values ​​per darkness scale in palette');
      expect(shader.darkScale, equals([51.0, 0.0, 0.0]));

      // print('List of difference values ​​per lightness scale in palette');
      expect(shader.lightScale, equals([0.0, 42.5, 42.5]));
    });
  });
  group('Shader Class (Default RGB) ', () {
    Shader shader = Shader.fromRGB(00, 255, 169);

    test('.paletteList()', () {
      expect(
          shader.palette(),
          equals([
            Color(0xffd4fff0),
            Color(0xffaaffe2),
            Color(0xff7fffd3),
            Color(0xff55ffc5),
            Color(0xff2affb7),
            Color(0xff00ffa9),
            Color(0xff00cc87),
            Color(0xff009965),
            Color(0xff006643),
            Color(0xff003321)
          ]));
    });

    test('.lightPalette()', () {
      expect(
          shader.lightPalette(),
          equals([
            Color(0xff2affb7),
            Color(0xff55ffc5),
            Color(0xff7fffd3),
            Color(0xffaaffe2),
            Color(0xffd4fff0),
          ]));
    });

    test('.darkPalette()', () {
      expect(
          shader.darkPalette(),
          equals([
            Color(0xff00cc87),
            Color(0xff009965),
            Color(0xff006643),
            Color(0xff003321)
          ]));
    });
  });

  group('Shader Class (Full Scale Test)', (() {
    Shader shader = Shader(0xffff0000, fullScale: true);
    test('.paletteList()', () {
      expect(
          shader.palette(),
          equals([
            Color(0xffffffff),
            Color(0xffffcccc),
            Color(0xffff9999),
            Color(0xffff6666),
            Color(0xffff3333),
            Color(0xffff0000),
            Color(0xffbf0000),
            Color(0xff7f0000),
            Color(0xff3f0000),
            Color(0xff000000)
          ]));
    });
    test('.lightPalette()', () {
      expect(
          shader.lightPalette(),
          equals([
            Color(0xffff3333),
            Color(0xffff6666),
            Color(0xffff9999),
            Color(0xffffcccc),
            Color(0xffffffff)
          ]));
    });
    test('.darkPalette()', () {
      expect(
          shader.darkPalette(),
          equals([
            Color(0xffbf0000),
            Color(0xff7f0000),
            Color(0xff3f0000),
            Color(0xff000000)
          ]));
    });
    test('Full scale Properties Test', () {
      // print('All shades number of palette (default)');
      print(shader.shades);
      expect(shader.shades, equals(10));

      // print('Position of default (default)');
      print(shader.pos);
      expect(shader.pos, equals(5));

      // print('All shades number of light side palette (default)');
      print(shader.lightShades);
      expect(shader.lightShades, equals(5));

      // print('All shades number of dark side palette (default)');
      print(shader.darkShades);
      expect(shader.darkShades, equals(4));

      // print('List of difference values ​​per darkness scale in palette');
      print(shader.darkScale);
      expect(shader.darkScale, equals([63.75, 0.0, 0.0]));

      // print('List of difference values ​​per lightness scale in palette');
      print(shader.lightScale);
      expect(shader.lightScale, equals([0.0, 51.0, 51.0]));
    });
  }));

  group('Shader Class (Scale value Test)', (() {
    Shader shader = Shader(0xffff0000);
    test('.paletteList(scale: 0.5)', () {
      expect(
          shader.palette(scale: 0.5),
          equals([
            Color(0xffff3535),
            Color(0xffff2a2a),
            Color(0xffff1f1f),
            Color(0xffff1515),
            Color(0xffff0a0a),
            Color(0xffff0000),
            Color(0xfff20000),
            Color(0xffe50000),
            Color(0xffd80000),
            Color(0xffcc0000)
          ]));
    });
    test('.lightPalette(scale: 0.5)', () {
      expect(
          shader.lightPalette(scale: 0.5),
          equals([
            Color(0xffff0a0a),
            Color(0xffff1515),
            Color(0xffff1f1f),
            Color(0xffff2a2a),
            Color(0xffff3535)
          ]));
    });
    test('.darkPalette(scale: 0.5)', () {
      expect(
          shader.darkPalette(scale: 0.5),
          equals([
            Color(0xfff20000),
            Color(0xffe50000),
            Color(0xffd80000),
            Color(0xffcc0000)
          ]));
    });
  }));

  group('Shader Class (Custom)', () {
    Shader shader = Shader(0xfff2f0d9, shades: 7, pos: 4);
    test('.paletteList()', () {
      expect(
          shader.palette(scale: 0.9),
          equals([
            Color(0xfffaf9f1),
            Color(0xfff8f7eb),
            Color(0xfff6f4e5),
            Color(0xfff4f2df),
            Color(0xfff2f0d9),
            Color(0xffb0af9e),
            Color(0xff6f6e63)
          ]));
    });
    test('.lightPalette()', () {
      expect(
          shader.lightPalette(scale: 0.9),
          equals([
            Color(0xfff4f2df),
            Color(0xfff6f4e5),
            Color(0xfff8f7eb),
            Color(0xfffaf9f1)
          ]));
    });
    test('.darkPalette()', () {
      expect(shader.darkPalette(scale: 0.9),
          equals([Color(0xffb0af9e), Color(0xff6f6e63)]));
    });

    test('Custom Properties Test', () {
      // print('All shades number of palette (default)');
      expect(shader.shades, equals(7));

      // print('Position of default (default)');
      expect(shader.pos, equals(4));

      // print('All shades number of light side palette (default)');
      expect(shader.lightShades, equals(4));

      // print('All shades number of dark side palette (default)');
      expect(shader.darkShades, equals(2));

      // print('List of difference values ​​per default darkness scale in palette');
      expect(shader.darkScale, equals([72.6, 72.0, 65.1]));

      // print('List of difference values ​​per default lightness scale in palette');
      expect(shader.lightScale, equals([2.34, 2.7, 6.84]));
    });
  });

  group('List Color Extension', () {
    List<Color> palette = Shader(0xff00ff00).palette();
    test('.toListString()', () {
      expect(
          palette.toListString(),
          equals([
            '0xffd4ffd4',
            '0xffaaffaa',
            '0xff7fff7f',
            '0xff55ff55',
            '0xff2aff2a',
            '0xff00ff00',
            '0xff00cc00',
            '0xff009900',
            '0xff006600',
            '0xff003300'
          ]));
    });
    test('.toListInt()', () {
      expect(
          palette.toListInt(),
          equals([
            0xffd4ffd4,
            0xffaaffaa,
            0xff7fff7f,
            0xff55ff55,
            0xff2aff2a,
            0xff00ff00,
            0xff00cc00,
            0xff009900,
            0xff006600,
            0xff003300
          ]));
    });
  });
}
