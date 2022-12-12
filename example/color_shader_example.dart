import 'package:flutter/material.dart';
// import 'package:color_shader/color_shader.dart';
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
  // List<int> color = ColorShader(0xff0000).shader();
  // Color red = Col;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColorShader'),
      ),
      body: Center(child: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(Color(0xffff00).toString())
          ],
        ),
      )),
    );
  }
}
