import 'package:flutter/material.dart';
import 'package:color_shader/color_shader.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Color(0xffff0000);

    setUp(() {
      // Additional setup goes here.
    });

    test('toInt test', () {
      expect(awesome.toInt(), equals(4294901760));
    });
  });
}
