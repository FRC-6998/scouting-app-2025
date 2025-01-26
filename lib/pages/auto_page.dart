import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../utils/logger.dart' show logger;
import '../widgets/field_widgets.dart' show InkwellContainer, TriangleWidget;
import '../constants.dart';

class AutoPage extends StatelessWidget {
  const AutoPage({super.key});

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
              constraints.maxWidth * 2 / 5) {
            fieldWidth = constraints.maxHeight * aspectRatio;
          } else {
            fieldWidth = constraints.maxWidth * 3 / 5;
          }
          double fieldHeight = fieldWidth / aspectRatio;
          // double fieldFactor = 1;
          // double fieldFactor = fieldWidth / 852;//*0.7511737089201878
          double fieldFactor = fieldWidth / 640;
          return Row(
            children: [
              SizedBox(
                width: fieldWidth,
                height: fieldHeight,
                child: Stack(
                  children: [
                    Image.asset('assets/images/2025field.png'),
                    InkwellContainer(
                      left: 71,
                      top: 30,
                      width: 105,
                      height: 124,
                      factor: fieldFactor,
                      color: AppColors.sourceAreaColor,
                      borderColor: AppColors.sourceBorderColor,
                      borderWidth: 3,
                      borderRadius: AppRadius.fieldAreaRadius,
                      onTap: () {
                        logger.d(fieldFactor);
                      },
                    ),
                    InkwellContainer(
                      right: 3.7558685446,
                      top: 30,
                      width: 105,
                      height: 124,
                      factor: fieldFactor,
                      color: AppColors.sourceAreaColor,
                      borderColor: AppColors.sourceBorderColor,
                      borderWidth: 3,
                      borderRadius: AppRadius.fieldAreaRadius,
                      onTap: () {
                        logger.d(fieldFactor);
                      },
                    ),
                    Positioned(
                        left: 193.5 * fieldFactor,
                        top: 62 * fieldFactor,
                        child: SizedBox(
                          width: 320 * fieldFactor,
                          height: 45 * fieldFactor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                3,
                                (index) => InkwellContainer(
                                      width: 80,
                                      factor: fieldFactor,
                                      color: AppColors.sourceAreaColor,
                                      borderColor: AppColors.sourceBorderColor,
                                      borderWidth: 3,
                                      borderRadius: AppRadius.fieldAreaRadius,
                                    )),
                          ),
                        )),
                    Positioned(
                        left: 193.5 * fieldFactor,
                        top: 143 * fieldFactor,
                        child: SizedBox(
                          width: 320 * fieldFactor,
                          height: 45 * fieldFactor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                3,
                                (index) => InkwellContainer(
                                      width: 80,
                                      factor: fieldFactor,
                                      color: AppColors.sourceAreaColor,
                                      borderColor: AppColors.sourceBorderColor,
                                      borderWidth: 3,
                                      borderRadius: AppRadius.fieldAreaRadius,
                                    )),
                          ),
                        )),
                    InkwellContainer(
                      left: 3.7558685446,
                      top: 399,
                      width: 105,
                      height: 165,
                      factor: fieldFactor,
                      color: AppColors.scoreAreaColor,
                      borderColor: AppColors.scoreBorderColor,
                      borderWidth: 3,
                      borderRadius: AppRadius.fieldAreaRadius,
                      onTap: () {
                        logger.d(fieldFactor);
                      },
                    ),
                    InkwellContainer(
                      left: 82.6291079812,
                      top: 567,
                      width: 545,
                      height: 98,
                      factor: fieldFactor,
                      color: AppColors.scoreAreaColor,
                      borderColor: AppColors.scoreBorderColor,
                      borderWidth: 3,
                      borderRadius: AppRadius.fieldAreaRadius,
                      onTap: () {
                        logger.d(fieldFactor);
                      },
                    ),
                    Positioned(
                      left: 127.7 * fieldFactor,
                      top: 480 * fieldFactor,
                      child: SizedBox(
                          width: 450 * fieldFactor,
                          height: 75 * fieldFactor,
                          child: Row(
                            children: [
                              InkwellContainer(
                                width: 135,
                                factor: fieldFactor,
                                color: AppColors.prematchBtnColor,
                                borderColor: AppColors.prematchBtnBorderColor,
                                borderWidth: 3,
                                borderRadius: AppRadius.fieldAreaRadius,
                              ),
                              Spacer(),
                              InkwellContainer(
                                width: 135,
                                factor: fieldFactor,
                                color: AppColors.prematchBtnColor,
                                borderColor: AppColors.prematchBtnBorderColor,
                                borderWidth: 3,
                                borderRadius: AppRadius.fieldAreaRadius,
                              ),
                              Spacer(),
                              InkwellContainer(
                                width: 135,
                                factor: fieldFactor,
                                color: AppColors.prematchBtnColor,
                                borderColor: AppColors.prematchBtnBorderColor,
                                borderWidth: 3,
                                borderRadius: AppRadius.fieldAreaRadius,
                              ),
                            ],
                          )),
                    ),
                    ...List.generate(
                      6,
                      (index) => TriangleWidget(
                        sideLength: 150,
                        left: 353 +
                            math.cos(math.pi / 2 + index * math.pi / 3) * 8,
                        top: 335.7746478873 -
                            math.sin(math.pi / 2 + index * math.pi / 3) * 8,
                        factor: fieldFactor,
                        color: AppColors.reefAreaColor,
                        borderColor: AppColors.reefBorderColor,
                        borderWidth: 3,
                        rotate: math.pi - index * math.pi / 3,
                        onTapDown: (details) {
                          logger.e('Triangle $index tapped');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 18,
                        child: Column(
                          children: [
                            Spacer(
                              flex: 2,
                            ),
                            Expanded(
                                flex: 22,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 19,
                                      child: Stack(
                                        children: [
                                          // 靠左上角的 Text
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Team Number:',
                                              style: TextStyle(
                                                  fontSize: 24 * fieldFactor),
                                            ),
                                          ),

                                          // 水平與垂直都置中的 Text
                                          Center(
                                            child: Text(
                                              '3499',
                                              style: TextStyle(
                                                  fontSize: 48 * fieldFactor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                        flex: 19,
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: InkwellContainer(
                                                  factor: fieldFactor,
                                                  color: AppColors.reefBtnColor,
                                                  borderColor: AppColors
                                                      .reefBtnBorderColor,
                                                  borderWidth: 3,
                                                  borderRadius:
                                                      AppRadius.fieldAreaRadius,
                                                )),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child: InkwellContainer(
                                                  factor: fieldFactor,
                                                  color: AppColors.reefBtnColor,
                                                  borderColor: AppColors
                                                      .reefBtnBorderColor,
                                                  borderWidth: 3,
                                                  borderRadius:
                                                      AppRadius.fieldAreaRadius,
                                                )),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child: InkwellContainer(
                                                  factor: fieldFactor,
                                                  color: AppColors.reefBtnColor,
                                                  borderColor: AppColors
                                                      .reefBtnBorderColor,
                                                  borderWidth: 3,
                                                  borderRadius:
                                                      AppRadius.fieldAreaRadius,
                                                )),
                                          ],
                                        )),
                                  ],
                                )),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 6,
                              child: InkwellContainer(
                                height: 100,
                                factor: fieldFactor,
                                color: AppColors.boolBtnFalseColor,
                                borderColor: AppColors.boolBtnFalseBorderColor,
                                borderWidth: 3,
                                borderRadius: AppRadius.fieldAreaRadius * 2,
                                child: Center(
                                  child: Text(
                                    'AUTO LEAVE',
                                    style: TextStyle(
                                      // color: AppColors.prematchBtnTextColor,
                                      fontSize: 24 * fieldFactor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 6,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 19,
                                    child: InkwellContainer(
                                      factor: fieldFactor,
                                      color: AppColors.sourceAreaColor,
                                      borderColor: AppColors.sourceBorderColor,
                                      borderWidth: 3,
                                      borderRadius: AppRadius.fieldAreaRadius,
                                      child: Center(
                                        child: Text(
                                          'Reef Algae',
                                          style: TextStyle(
                                            fontSize: 24 * fieldFactor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 19,
                                    child: InkwellContainer(
                                      factor: fieldFactor,
                                      color: AppColors.prematchBtnColor,
                                      borderColor:
                                          AppColors.prematchBtnBorderColor,
                                      borderWidth: 3,
                                      borderRadius: AppRadius.fieldAreaRadius,
                                      child: Center(
                                        child: Text(
                                          'Failed',
                                          style: TextStyle(
                                            fontSize: 24 * fieldFactor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 9,
                                        child: InkwellContainer(
                                          factor: fieldFactor,
                                          color: AppColors.reefBtnColor,
                                          borderColor:
                                              AppColors.reefBtnBorderColor,
                                          borderWidth: 3,
                                          borderRadius:
                                              AppRadius.fieldAreaRadius,
                                          child: Center(
                                            child: Text(
                                              'L1',
                                              style: TextStyle(
                                                fontSize: 24 * fieldFactor,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                        flex: 9,
                                        child: InkwellContainer(
                                          factor: fieldFactor,
                                          color: AppColors.reefBtnColor,
                                          borderColor:
                                              AppColors.reefBtnBorderColor,
                                          borderWidth: 3,
                                          borderRadius:
                                              AppRadius.fieldAreaRadius,
                                          child: Center(
                                            child: Text(
                                              'L2',
                                              style: TextStyle(
                                                fontSize: 24 * fieldFactor,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                        flex: 9,
                                        child: InkwellContainer(
                                          factor: fieldFactor,
                                          color: AppColors.reefBtnColor,
                                          borderColor:
                                              AppColors.reefBtnBorderColor,
                                          borderWidth: 3,
                                          borderRadius:
                                              AppRadius.fieldAreaRadius,
                                          child: Center(
                                            child: Text(
                                              'L3',
                                              style: TextStyle(
                                                fontSize: 24 * fieldFactor,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                        flex: 9,
                                        child: InkwellContainer(
                                          factor: fieldFactor,
                                          color: AppColors.reefBtnColor,
                                          borderColor:
                                              AppColors.reefBtnBorderColor,
                                          borderWidth: 3,
                                          borderRadius:
                                              AppRadius.fieldAreaRadius,
                                          child: Center(
                                            child: Text(
                                              'L4',
                                              style: TextStyle(
                                                fontSize: 24 * fieldFactor,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                )),
                            Spacer(
                              flex: 2,
                            ),
                            Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Color(0xFFFFFFFF),
                                            backgroundColor: Color(0xFF303E9B),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5 * fieldFactor),
                                            ),
                                          ),
                                          onPressed: () {
                                            logger.d("Back");
                                          },
                                          child: Text("Back",
                                              style: TextStyle(
                                                  fontSize: 30 * fieldFactor))),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Color(0xFFFFFFFF),
                                            backgroundColor: Color(0xFF000000),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5 * fieldFactor),
                                            ),
                                          ),
                                          onPressed: () {
                                            logger.d("Undo");
                                          },
                                          child: Text("Undo",
                                              style: TextStyle(
                                                  fontSize: 30 * fieldFactor))),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Color(0xFFFFFFFF),
                                            backgroundColor: Color(0xFF303E9B),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5 * fieldFactor),
                                            ),
                                          ),
                                          onPressed: () {
                                            logger.d("Tele-op");
                                          },
                                          child: Text("Tele-op",
                                              style: TextStyle(
                                                  fontSize: 30 * fieldFactor))),
                                    ),
                                  ],
                                )),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        )),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
