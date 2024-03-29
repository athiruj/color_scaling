import 'package:flutter/material.dart';
import 'package:color_hue_n_tint/color_hue_n_tint.dart';
import 'package:test/test.dart';

void main() {
  group('HueNTint Class (Default 32bits) ', () {
    HueNTint shader = HueNTint(0xffff0000);

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

    test('.tints()', () {
      expect(
          shader.tints(),
          equals([
            Color(0xffff2a2a),
            Color(0xffff5555),
            Color(0xffff7f7f),
            Color(0xffffaaaa),
            Color(0xffffd4d4)
          ]));
    });

    test('.hues()', () {
      expect(
          shader.hues(),
          equals([
            Color(0xffcc0000),
            Color(0xff990000),
            Color(0xff660000),
            Color(0xff330000)
          ]));
    });

    // test('Lightness Test', () {
    //   expect(shader.lightness(scale: 0.5), equals(Color(0xffff7f7f)));
    // });

    // test('Darkness Test', () {
    //   expect(shader.darkness(scale: 0.5), equals(Color(0xff7f0000)));
    // });

    test('Default Properties Test', () {
      // print('All shades number of palette (default)');
      expect(shader.shades, equals(10));

      // print('indexition of default (default)');
      expect(shader.index, equals(5));

      // print('Percent difference values ​​per scale (default)');

      // print('All shades number of light side palette (default)');
      expect(shader.lightShades, equals(5));
    });
  });
  group('HueNTint Class (Default RGB) ', () {
    HueNTint shader = HueNTint.fromRGB(00, 255, 169);

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

    test('.tints()', () {
      expect(
          shader.tints(),
          equals([
            Color(0xff2affb7),
            Color(0xff55ffc5),
            Color(0xff7fffd3),
            Color(0xffaaffe2),
            Color(0xffd4fff0),
          ]));
    });

    test('.hues()', () {
      expect(
          shader.hues(),
          equals([
            Color(0xff00cc87),
            Color(0xff009965),
            Color(0xff006643),
            Color(0xff003321)
          ]));
    });
  });

  group('HueNTint Class (Full Scale Test)', (() {
    HueNTint shader = HueNTint(0xffff0000, fullScale: true);
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
    test('.tints()', () {
      expect(
          shader.tints(),
          equals([
            Color(0xffff3333),
            Color(0xffff6666),
            Color(0xffff9999),
            Color(0xffffcccc),
            Color(0xffffffff)
          ]));
    });
    test('.hues()', () {
      expect(
          shader.hues(),
          equals([
            Color(0xffbf0000),
            Color(0xff7f0000),
            Color(0xff3f0000),
            Color(0xff000000)
          ]));
    });
    test('Full scale Properties Test', () {
      // print('All shades number of palette (default)');
      expect(shader.shades, equals(10));

      // print('indexition of default (default)');
      expect(shader.index, equals(5));

      // print('All shades number of light side palette (default)');
      expect(shader.lightShades, equals(5));

      // print('All shades number of dark side palette (default)');
      expect(shader.darkShades, equals(4));
    });
  }));
  group('HueNTint Class (Full Scale RGB Test)', (() {
    HueNTint shader = HueNTint.fromRGB(255, 0, 0, fullScale: true);
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
    test('.tints()', () {
      expect(
          shader.tints(),
          equals([
            Color(0xffff3333),
            Color(0xffff6666),
            Color(0xffff9999),
            Color(0xffffcccc),
            Color(0xffffffff)
          ]));
    });
    test('.hues()', () {
      expect(
          shader.hues(),
          equals([
            Color(0xffbf0000),
            Color(0xff7f0000),
            Color(0xff3f0000),
            Color(0xff000000)
          ]));
    });
    test('Full scale Properties Test', () {
      // print('All shades number of palette (default)');
      expect(shader.shades, equals(10));

      // print('indexition of default (default)');
      expect(shader.index, equals(5));

      // print('All shades number of light side palette (default)');
      expect(shader.lightShades, equals(5));

      // print('All shades number of dark side palette (default)');
      expect(shader.darkShades, equals(4));
    });
  }));

  group('HueNTint Class (Scale value Test)', (() {
    HueNTint shader = HueNTint(0xffff0000);
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
    test('.tints(scale: 0.5)', () {
      expect(
          shader.tints(scale: 0.5),
          equals([
            Color(0xffff0a0a),
            Color(0xffff1515),
            Color(0xffff1f1f),
            Color(0xffff2a2a),
            Color(0xffff3535)
          ]));
    });
    test('.hues(scale: 0.5)', () {
      expect(
          shader.hues(scale: 0.5),
          equals([
            Color(0xfff20000),
            Color(0xffe50000),
            Color(0xffd80000),
            Color(0xffcc0000)
          ]));
    });
  }));

  group('HueNTint Class (Custom)', () {
    HueNTint shader = HueNTint(0xfff2f0d9, shades: 7, index: 4);
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
    test('.tints()', () {
      expect(
          shader.tints(scale: 0.9),
          equals([
            Color(0xfff4f2df),
            Color(0xfff6f4e5),
            Color(0xfff8f7eb),
            Color(0xfffaf9f1)
          ]));
    });
    test('.hues()', () {
      expect(shader.hues(scale: 0.9),
          equals([Color(0xffb0af9e), Color(0xff6f6e63)]));
    });

    test('Custom Properties Test', () {
      // print('All shades number of palette (default)');
      expect(shader.shades, equals(7));

      // print('indexition of default (default)');
      expect(shader.index, equals(4));

      // print('All shades number of light side palette (default)');
      expect(shader.lightShades, equals(4));

      // print('All shades number of dark side palette (default)');
      expect(shader.darkShades, equals(2));
    });
  });

  group('List Color Extension', () {
    List<Color> palette = HueNTint(0xff00ff00).palette();
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

  group('When Error HueNTint Class (Default 32bits) ', () {
    HueNTint shader = HueNTint(0xffff0000, shades: 3, index: 5);

    test('Scale Error .palette()', () {
      expect(() => shader.palette(scale: 1.2), throwsA(isA<AssertionError>()));
      expect(() => shader.palette(scale: -1.2), throwsA(isA<AssertionError>()));
    });

    test('Scale Error .tints()', () {
      expect(() => shader.tints(scale: 5), throwsA(isA<AssertionError>()));
      expect(() => shader.tints(scale: -6), throwsA(isA<AssertionError>()));
    });

    test('Scale Error .hues()', () {
      expect(() => shader.hues(scale: 2), throwsA(isA<AssertionError>()));
      expect(() => shader.hues(scale: -0.5), throwsA(isA<AssertionError>()));
    });
  });
  group('Non full fill (Default 32bits) ', () {
    test('1bit', () {
      HueNTint shader = HueNTint(0xf, shades: 5, index: 2);
      expect(
          shader.palette(),
          equals([
            Color(0xffaaaaaf),
            Color(0xff55555f),
            Color(0xff00000f),
            Color(0xff00000a),
            Color(0xff000005)
          ]));
    });
    test('2bit', () {
      HueNTint shader = HueNTint(0xfd, shades: 5, index: 2);
      expect(
          shader.palette(),
          equals([
            Color(0xffaaaafe),
            Color(0xff5555fd),
            Color(0xff0000fd),
            Color(0xff0000a8),
            Color(0xff000054)
          ]));
    });
    test('3bit', () {
      HueNTint shader = HueNTint(0xfda, shades: 5, index: 2);
      expect(
          shader.palette(),
          equals([
            Color(0xffaaaff2),
            Color(0xff555fe6),
            Color(0xff000fda),
            Color(0xff000a91),
            Color(0xff000548)
          ]));
    });
    test('4bit', () {
      HueNTint shader = HueNTint(0xfdaf, shades: 5, index: 2);
      expect(
          shader.palette(),
          equals([
            Color(0xffaafee4),
            Color(0xff55fdc9),
            Color(0xff00fdaf),
            Color(0xff00a874),
            Color(0xff00543a)
          ]));
    });
    test('5bit', () {
      HueNTint shader = HueNTint(0xfdafd, shades: 5, index: 2);
      expect(
          shader.palette(),
          equals([
            Color(0xffaff2fe),
            Color(0xff5fe6fd),
            Color(0xff0fdafd),
            Color(0xff0a91a8),
            Color(0xff054854)
          ]));
    });
    test('6bit', () {
      HueNTint shader = HueNTint(0xfdafdf, shades: 5, index: 2);
      expect(
          shader.palette(),
          equals([
            Color(0xfffee4f4),
            Color(0xfffdc9e9),
            Color(0xfffdafdf),
            Color(0xffa87494),
            Color(0xff543a4a)
          ]));
    });
    test('7bit', () {
      HueNTint shader = HueNTint(0xdfdafdf, shades: 5, index: 2);
      expect(
          shader.palette(),
          equals([
            Color(0xfffee4f4),
            Color(0xfffdc9e9),
            Color(0xfffdafdf),
            Color(0xffa87494),
            Color(0xff543a4a)
          ]));
    });
  });
}
