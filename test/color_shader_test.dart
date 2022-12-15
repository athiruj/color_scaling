import 'package:flutter/material.dart';
import 'package:color_shader/color_shader.dart';
import 'package:test/test.dart';

void main() {

  group('Shader Class (Default)',(){
    Shader shader = Shader(0xffff0000);

    test('.palette()', (){
      expect(shader.palette(), equals({
            0:Color(0xffffffff),
           50:Color(0xffffd4d4),
          100:Color(0xffffaaaa),
          200:Color(0xffff7f7f),
          300:Color(0xffff5555),
          400:Color(0xffff2a2a),
          500:Color(0xffff0000),
          600:Color(0xffcc0000),
          700:Color(0xff990000),
          800:Color(0xff660000),
          900:Color(0xff330000),
         1000:Color(0xff000000)
          }));
    });
    test('.paletteMap()', (){
      expect(shader.paletteMap(), equals({
            1:Color(0xffffd4d4),
            2:Color(0xffffaaaa),
            3:Color(0xffff7f7f),
            4:Color(0xffff5555),
            5:Color(0xffff2a2a),
            6:Color(0xffff0000),
            7:Color(0xffcc0000),
            8:Color(0xff990000),
            9:Color(0xff660000),
           10:Color(0xff330000)
          }));
    });
    test('.paletteList()', (){
      expect(shader.paletteList(), equals([
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
    test('.lightPalette()', (){
      expect(shader.lightPalette(), equals([
            Color(0xffff2a2a),
            Color(0xffff5555),
            Color(0xffff7f7f),
            Color(0xffffaaaa),
            Color(0xffffd4d4)
          ]));
    });
    test('.darkPalette()', (){
      expect(shader.darkPalette(), equals([
            Color(0xffcc0000),
            Color(0xff990000),
            Color(0xff660000),
            Color(0xff330000)
          ]));
    });
    test('Default Properties Test',() {

      // print('All shades number of palette (default)');
      print(shader.shades);
      expect(shader.shades, equals(10));
   
      // print('Position of default (default)');
      print(shader.pos);
      expect(shader.pos, equals(6));

      // print('Percent difference values ​​per scale (default)');
      print(shader.scale);
      expect(shader.scale, equals(1.0));

      // print('All shades number of dark side palette (default)');
      print(shader.darkShades);
      expect(shader.darkShades, equals(4));
     
      // print('All shades number of light side palette (default)');
      prints(shader.lightShades);
      expect(shader.lightShades, equals(5));

      // print('List of difference values ​​per darkness scale in palette');
      print(shader.darkScale);
      expect(shader.darkScale, equals([51.0, 0.0, 0.0]));
     
      // print('List of difference values ​​per lightness scale in palette');
      print(shader.lightScale);
      expect(shader.lightScale, equals([0.0, 42.5, 42.5]));
   });    
  });

  group('Palette Propertie Test', () {
    Palette palette = Shader(0xffff0000).palette();

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
