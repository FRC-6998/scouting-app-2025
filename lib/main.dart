import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'widgets/fieldWidgets.dart' show InkwellContainer, TriangleWidget;
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // TRY THIS: Try changing the color here to a specific color (to
      //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      //   // change color while the other colors stay the same.
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double aspectRatio = 852 / 962;
          double fieldWidth;
          if (constraints.maxWidth - constraints.maxHeight * aspectRatio >
              constraints.maxWidth / 2) {
            fieldWidth = constraints.maxHeight * aspectRatio;
          } else {
            fieldWidth = constraints.maxWidth * 1 / 2;
          }
          double fieldHeight = fieldWidth / aspectRatio;
          double fieldFactor = fieldWidth / 852;
          return Row(
            children: [
              SizedBox(
                width: fieldWidth,
                height: fieldHeight,
                child: Container(
                  child: Stack(
                    children: [
                      Image.asset('assets/images/2025field.png'),
                      InkwellContainer(
                        left: 95,
                        top: 40,
                        width: 140,
                        height: 165,
                        factor: fieldFactor,
                        color: AppColors.sourceAreaColor,
                        borderColor: AppColors.sourceBorderColor,
                        borderWidth: 3,
                        borderRadius: AppRadius.fieldAreaRadius,
                        onTap: () {
                          print(fieldFactor);
                        },
                      ),
                      InkwellContainer(
                        right: 5,
                        top: 40,
                        width: 140,
                        height: 165,
                        factor: fieldFactor,
                        color: AppColors.sourceAreaColor,
                        borderColor: AppColors.sourceBorderColor,
                        borderWidth: 3,
                        borderRadius: AppRadius.fieldAreaRadius,
                        onTap: () {
                          print(fieldFactor);
                        },
                      ),
                      InkwellContainer(
                        left: 5,
                        top: 531,
                        width: 140,
                        height: 220,
                        factor: fieldFactor,
                        color: AppColors.scoreAreaColor,
                        borderColor: AppColors.scoreBorderColor,
                        borderWidth: 3,
                        borderRadius: AppRadius.fieldAreaRadius,
                        onTap: () {
                          print(fieldFactor);
                        },
                      ),
                      InkwellContainer(
                        left: 110,
                        top: 755,
                        width: 725,
                        height: 130,
                        factor: fieldFactor,
                        color: AppColors.scoreAreaColor,
                        borderColor: AppColors.scoreBorderColor,
                        borderWidth: 3,
                        borderRadius: AppRadius.fieldAreaRadius,
                        onTap: () {
                          print(fieldFactor);
                        },
                      ),
                      Positioned(
                        left: 165 * fieldFactor,
                        top: 630 * fieldFactor,
                        child: Container(
                            width: 630 * fieldFactor,
                            height: 110 * fieldFactor,
                            child: Row(
                              children: [
                                InkwellContainer(
                                  width: 180,
                                  factor: fieldFactor,
                                  color: AppColors.prematchBtnColor,
                                  borderColor: AppColors.prematchBtnBorderColor,
                                  borderWidth: 3,
                                  borderRadius: AppRadius.fieldAreaRadius,
                                ),
                                Spacer(),
                                InkwellContainer(
                                  width: 180,
                                  factor: fieldFactor,
                                  color: AppColors.prematchBtnColor,
                                  borderColor: AppColors.prematchBtnBorderColor,
                                  borderWidth: 3,
                                  borderRadius: AppRadius.fieldAreaRadius,
                                ),
                                Spacer(),
                                InkwellContainer(
                                  width: 180,
                                  factor: fieldFactor,
                                  color: AppColors.prematchBtnColor,
                                  borderColor: AppColors.prematchBtnBorderColor,
                                  borderWidth: 3,
                                  borderRadius: AppRadius.fieldAreaRadius,
                                ),
                              ],
                            )),
                      ),
                      TriangleWidget(
                        sideLength: 200,
                        top: 350,
                        left: 310,
                        factor: fieldFactor,
                        color: AppColors.sourceAreaColor,
                        borderColor: AppColors.scoreBorderColor,
                        borderWidth: 30,
                        rotate: 3 * math.pi / 6,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
