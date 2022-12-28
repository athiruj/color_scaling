import 'package:flutter/material.dart';
import 'package:color_shader_ex/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:color_shader/color_shader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: initialRoute,
      title: 'Color Shader',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScreenTypeLayout(
        breakpoints:
            const ScreenBreakpoints(tablet: 757, desktop: 1193, watch: 0),
        desktop: const Desktop(),
        tablet: const Tablet(),
        mobile: const Mobile(),
      ),
    );
  }
}

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 1080,
        height: double.maxFinite,
        color: Colors.red,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Hello',
              style: GoogleFonts.openSans(
                  fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 38,
            ),
            Container(
              height: 53,
              width: 200,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 56,
            ),
            Container(
              height: 108,
              width: double.maxFinite,
              color: Colors.green,
            ),
          ]),
        ),
      )
    ]);
  }
}

class Tablet extends StatefulWidget {
  const Tablet({super.key});

  @override
  State<Tablet> createState() => _TabletState();
}

class _TabletState extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber);
  }
}

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.brown);
  }
}
