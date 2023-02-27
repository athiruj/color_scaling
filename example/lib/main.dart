import 'package:color_hue_n_tint/color_hue_n_tint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Hue N Tint',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Color Hue N Tint'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color pickerColor = const Color(0xffff0000);
  late List<Color> palettes;
  late List<Color> hues;
  late List<Color> tints;

  void palette() => palettes =
      HueNTint(pickerColor.value, shades: 10, index: 5, fullScale: false)
          .palette();
  void hue() =>
      hues = HueNTint(pickerColor.value, shades: 10, index: 5, fullScale: false)
          .hues();
  void tint() => tints =
      HueNTint(pickerColor.value, shades: 10, index: 5, fullScale: false)
          .tints();

  @override
  void initState() {
    palette();
    hue();
    tint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              elevation: 8,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.all(0),
                      contentPadding: const EdgeInsets.all(0),
                      content: SingleChildScrollView(
                          child: HueRingPicker(
                        pickerColor: pickerColor,
                        onColorChanged: (value) => setState(() {
                          pickerColor = value;
                          palette();
                          hue();
                          tint();
                          // print('hello');
                        }),
                      )),
                    );
                  },
                );
              },
              child: const Icon(Icons.color_lens_outlined)),
          appBar: AppBar(
            title: Text(widget.title),
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Palette',
              ),
              Tab(
                text: 'Hues',
              ),
              Tab(
                text: 'Tints',
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              Row(
                children: [
                  for (var i in palettes)
                    Expanded(
                      child: thisContainer(
                        color: i,
                      ),
                    )
                ],
              ),
              Row(
                children: [
                  for (var i in hues)
                    Expanded(
                      child: thisContainer(
                        color: i,
                      ),
                    )
                ],
              ),
              Row(
                children: [
                  for (var i in tints)
                    Expanded(
                      child: thisContainer(
                        color: i,
                      ),
                    )
                ],
              ),
            ],
          )),
    );
  }

  Widget thisContainer({required Color color}) {
    return Container(
      color: color,
      child: Center(
        child: RotatedBox(
            quarterTurns: -1,
            child: Container(
                height: 30,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                alignment: Alignment.center,
                child: Text(color.value.toRadixString(16),style: const TextStyle(fontWeight: FontWeight.bold),))),
      ),
    );
  }
}
