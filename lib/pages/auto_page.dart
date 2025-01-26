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
              constraints.maxWidth / 2) {
            fieldWidth = constraints.maxHeight * aspectRatio;
          } else {
            fieldWidth = constraints.maxWidth * 1 / 2;
          }
          double fieldHeight = fieldWidth / aspectRatio;
          // double fieldFactor = 1;
          double fieldFactor = fieldWidth / 852;
          return Row(
            children: [
              SizedBox(
                width: fieldWidth,
                height: fieldHeight,
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
                        logger.d(fieldFactor);
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
                        logger.d(fieldFactor);
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
                        logger.d(fieldFactor);
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
                        logger.d(fieldFactor);
                      },
                    ),
                    Positioned(
                      left: 170 * fieldFactor,
                      top: 640 * fieldFactor,
                      child: SizedBox(
                          width: 600 * fieldFactor,
                          height: 100 * fieldFactor,
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
                    // TriangleWidget(
                    //   sideLength: 200,
                    //   top: 350,
                    //   left: 310,
                    //   factor: fieldFactor,
                    //   color: AppColors.reefAreaColor,
                    //   borderColor: AppColors.reefBorderColor,
                    //   borderWidth: 3,
                    //   rotate: 3 * math.pi / 6,
                    // ),

                    ...List.generate(
                      6,
                      (index) => TriangleWidget(
                        sideLength: 200,
                        left: 470 +
                            math.cos(math.pi / 2 + index * math.pi / 3) * 8,
                        top: 447 -
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
