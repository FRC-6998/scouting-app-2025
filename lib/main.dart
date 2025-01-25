import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'widgets/fieldWidgets.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class TrianglePainter extends CustomPainter {
  final double height;
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  TrianglePainter(
      {required this.height,
      this.fillColor = const Color.fromARGB(40, 48, 62, 155),
      this.borderColor = const Color.fromARGB(90, 48, 62, 155),
      this.borderWidth = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill; // 填充樣式

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke // 邊框樣式
      ..strokeWidth = borderWidth; // 邊框寬度

    final double adjustedheight = height - borderWidth;
    // 繪製正三角形的頂點
    final fillPath = Path()
      ..moveTo(size.width / 2, 0) // 頂點
      ..lineTo(size.width, size.height) // 右下角
      ..lineTo(0, size.height) // 左下角
      ..close();

    // 繪製正三角形的頂點
    final borderPath = Path()
      ..moveTo(size.width / 2, 0 + borderWidth) // 頂點
      ..lineTo(size.width - (3 / math.sqrt(12)) * borderWidth,
          size.height - 0.5 * borderWidth) // 右下角
      ..lineTo(0 + (3 / math.sqrt(12)) * borderWidth,
          size.height - 0.5 * borderWidth) // 左下角
      ..close();

    // 繪製填充
    canvas.drawPath(fillPath, fillPaint);

    // 繪製邊框
    canvas.drawPath(borderPath, borderPaint);

    // 調試：繪製三角形的邊框

    // 調試：標記三角形的左上角
    final Paint debugPaint = Paint()..color = Colors.red;
    canvas.drawCircle(Offset(0, 0), 5, debugPaint); // 左上角
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // 靜態繪圖時可以設置為 false
  }
}

class TriangleWidget extends StatelessWidget {
  final double height;
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;
  final GestureTapDownCallback?
      onTapDown; // Changed from VoidCallback to GestureTapDownCallback

  const TriangleWidget({
    required this.height,
    this.fillColor = const Color.fromARGB(40, 48, 62, 155),
    this.borderColor = const Color.fromARGB(90, 48, 62, 155),
    this.borderWidth = 1.0,
    this.onTapDown, // Updated to use onTapDown instead of onTap
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown, // Set onTapDown callback
      child: CustomPaint(
        size: Size(height, height),
        painter: TrianglePainter(
          height: height,
          fillColor: fillColor,
          borderColor: borderColor,
          borderWidth: borderWidth,
        ),
      ),
    );
  }
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
          double areaRadius = 5 * fieldFactor;
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
                      Positioned(
                        left: 310 * fieldFactor,
                        top: 350 * fieldFactor,
                        child: Transform.rotate(
                          angle: 6 / 2 * math.pi,
                          alignment: Alignment.topCenter,
                          child: TriangleWidget(
                            height: 200,
                            fillColor: Color(0x66303E9B),
                            borderColor: Color(0xFF3D4AA1),
                            borderWidth: 3.0,
                            onTapDown: (details) {
                              // print(fieldFactor);

                              final RenderBox box =
                                  context.findRenderObject() as RenderBox;
                              print("details.localPosition");
                              print(details.localPosition.dx);
                              print(details.localPosition.dy);
                              print("details");
                              // 判斷是否在三角形內
                              bool isInsideTriangle = _isPointInsideTriangle(
                                details.localPosition,
                                Offset(100, 0), // 三角形頂點
                                Offset(0, 200), // 左下角
                                Offset(200, 200), // 右下角
                              );
                              print(isInsideTriangle);
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        left: 310 * fieldFactor,
                        top: 350 * fieldFactor,
                        child: Transform.rotate(
                          angle: 0 / 2 * math.pi,
                          alignment: Alignment.topCenter,
                          child: TriangleWidget(
                            height: 200,
                            fillColor: Color(0x66303E9B),
                            borderColor: Color(0xFF3D4AA1),
                            borderWidth: 3.0,
                            onTapDown: (details) {
                              // print(fieldFactor);

                              final RenderBox box =
                                  context.findRenderObject() as RenderBox;
                              print("details.localPosition");
                              print(details.localPosition.dx);
                              print(details.localPosition.dy);
                              print("details");
                              // 判斷是否在三角形內
                              bool isInsideTriangle = _isPointInsideTriangle(
                                details.localPosition,
                                Offset(100, 0), // 三角形頂點
                                Offset(0, 200), // 左下角
                                Offset(200, 200), // 右下角
                              );
                              print(isInsideTriangle);
                            },
                          ),
                        ),
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

  bool _isPointInsideTriangle(Offset p, Offset a, Offset b, Offset c) {
    double sign(Offset p1, Offset p2, Offset p3) {
      return (p1.dx - p3.dx) * (p2.dy - p3.dy) -
          (p2.dx - p3.dx) * (p1.dy - p3.dy);
    }

    bool b1 = sign(p, a, b) < 0.0;
    bool b2 = sign(p, b, c) < 0.0;
    bool b3 = sign(p, c, a) < 0.0;

    return (b1 == b2) && (b2 == b3);
  }
}
