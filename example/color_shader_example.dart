import '../lib/color_shader.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/binding.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ColorShader',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> color = ColorShader(0xff0000).shaderGen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColorShader'),
      ),
      body: Center(child: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: List.generate(color.length, (index) => Container(height: 50,width: 50,color: Color(color[index]))),
        ),
      )),
    );
  }
}
