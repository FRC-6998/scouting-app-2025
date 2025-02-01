import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

import '../utils/logger.dart' show logger;
import '../widgets/field_widgets.dart' show InkwellContainer, TriangleWidget;
import '../constants.dart';
import '../providers/scouting_data_provider.dart';
import '../model.dart';

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
    ScoutingDataProvider scoutingData = Provider.of<ScoutingDataProvider>(context);
    // return Scaffold(
      // appBar: AppBar(
      //   // TRY THIS: Try changing the color here to a specific color (to
      //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      //   // change color while the other colors stay the same.
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      // body: LayoutBuilder(
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double aspectRatio = 852 / 962;
          double fieldWidth;
          if (constraints.maxWidth - constraints.maxHeight * aspectRatio >
              // constraints.maxWidth * 2 / 5) {
              constraints.maxWidth * 1/2) {
            fieldWidth = constraints.maxHeight * aspectRatio;
          } else {
            // fieldWidth = constraints.maxWidth * 3 / 5;
            fieldWidth = constraints.maxWidth * 1/2;
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
                    InkwellContainer(  // l coral station
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
                        scoutingData.addAutoPathPoint(AutoPathPoint.leftCoralStation);
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
                        scoutingData.addAutoPathPoint(AutoPathPoint.rightCoralStation);
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
                                      onTap: () {
                                        scoutingData.addAutoPathPoint(AutoPathPoint.values[AutoPathPoint.leftGroundAlgae.index + index]);
                                      },
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
                                      onTap: () {
                                        scoutingData.addAutoPathPoint(AutoPathPoint.values[AutoPathPoint.leftGroundCoral.index + index]);
                                      },
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
                        scoutingData.addAutoPathPoint(AutoPathPoint.processor);
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
                        scoutingData.addAutoPathPoint(AutoPathPoint.net);
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
                              // Selector<ScoutingDataProvider, AutoStartPosition>(
                              //   selector: (context, scoutingData) => scoutingData.autoData.startPosition,
                              //   builder: (context, startPosition, child) {
                              //     return InkwellContainer(
                              //       width: 135,
                              //       factor: fieldFactor,
                              //       color: AppColors.unselectedBtnColor,
                              //       borderColor: AppColors.unselectedBtnBorderColor,
                              //       // borderWidth: 3,
                              //       borderWidth: startPosition == AutoStartPosition.left ? 6 : 3,
                              //       borderRadius: AppRadius.fieldAreaRadius,
                              //       onTap: () {
                              //         scoutingData.updateAutoData(startPosition: AutoStartPosition.left);
                              //       },
                              //     );
                              //   },
                              // ),
                              Selector<ScoutingDataProvider, AutoStartPosition>(
                                selector: (context, scoutingData) => scoutingData.autoData.startPosition,
                                builder: (context, startPosition, child) {
                                  return InkwellContainer(
                                    width: 135,
                                    factor: fieldFactor,
                                    color: startPosition == AutoStartPosition.left ? AppColors.selectedBtnColor : AppColors.unselectedBtnColor,
                                    borderColor: startPosition == AutoStartPosition.left ? AppColors.selectedBtnBorderColor : AppColors.unselectedBtnBorderColor,
                                    // color: AppColors.unselectedBtnColor,
                                    // borderColor: AppColors.unselectedBtnBorderColor,
                                    borderWidth: 3,
                                    // borderWidth: startPosition == AutoStartPosition.left ? 6 : 3,
                                    borderRadius: AppRadius.fieldAreaRadius,
                                    onTap: () {
                                      scoutingData.updateAutoData(startPosition: AutoStartPosition.left);
                                    },
                                  );
                                },
                              ),
                              Spacer(),
                              Selector<ScoutingDataProvider, AutoStartPosition>(
                                selector: (context, scoutingData) => scoutingData.autoData.startPosition,
                                builder: (context, startPosition, child) {
                                  return InkwellContainer(
                                    width: 135,
                                    factor: fieldFactor,
                                    color: startPosition == AutoStartPosition.center ? AppColors.selectedBtnColor : AppColors.unselectedBtnColor,
                                    borderColor: startPosition == AutoStartPosition.center ? AppColors.selectedBtnBorderColor : AppColors.unselectedBtnBorderColor,
                                    // color: AppColors.unselectedBtnColor,
                                    // borderColor: AppColors.unselectedBtnBorderColor,
                                    borderWidth: 3,
                                    // borderWidth: startPosition == AutoStartPosition.center ? 6 : 3,
                                    borderRadius: AppRadius.fieldAreaRadius,
                                    onTap: () {
                                      scoutingData.updateAutoData(startPosition: AutoStartPosition.center);
                                    },
                                  );
                                },
                              ),
                              Spacer(),
                              Selector<ScoutingDataProvider, AutoStartPosition>(
                                selector: (context, scoutingData) => scoutingData.autoData.startPosition,
                                builder: (context, startPosition, child) {
                                  return InkwellContainer(
                                    width: 135,
                                    factor: fieldFactor,
                                    color: startPosition == AutoStartPosition.right ? AppColors.selectedBtnColor : AppColors.unselectedBtnColor,
                                    borderColor: startPosition == AutoStartPosition.right ? AppColors.selectedBtnBorderColor : AppColors.unselectedBtnBorderColor,
                                    // color: AppColors.unselectedBtnColor,
                                    // borderColor: AppColors.unselectedBtnBorderColor,
                                    borderWidth: 3,
                                    // borderWidth: startPosition == AutoStartPosition.right ? 6 : 3,
                                    borderRadius: AppRadius.fieldAreaRadius,
                                    onTap: () {
                                      scoutingData.updateAutoData(startPosition: AutoStartPosition.right);
                                    },
                                  );
                                },
                              ),
                            ],
                          )),
                    ),
                    ...List.generate(
                      6,
                      (index) => Selector<ScoutingDataProvider, int>(
                        selector: (context, scoutingData) => scoutingData.autoData.selectedReefSide,
                        builder: (context, selectedReefSide, child) {
                          return TriangleWidget(
                                sideLength: 150,
                                left: 353 +
                                    math.cos(math.pi / 2 + index * math.pi / 3) * 8,
                                top: 335.7746478873 -
                                    math.sin(math.pi / 2 + index * math.pi / 3) * 8,
                                factor: fieldFactor,
                                color: AppColors.reefAreaColor,
                                borderColor: AppColors.reefBorderColor,
                                borderWidth: selectedReefSide == index ? 6 : 3,
                                rotate: math.pi - index * math.pi / 3,
                                onTapDown: (details) {
                                  scoutingData.changeSelectedReefSide(index);
                                  logger.d('Triangle $index tapped');
                                },
                              );
                        },
                      ),
                      //     TriangleWidget(
                      //   sideLength: 150,
                      //   left: 353 +
                      //       math.cos(math.pi / 2 + index * math.pi / 3) * 8,
                      //   top: 335.7746478873 -
                      //       math.sin(math.pi / 2 + index * math.pi / 3) * 8,
                      //   factor: fieldFactor,
                      //   color: AppColors.reefAreaColor,
                      //   borderColor: AppColors.reefBorderColor,
                      //   borderWidth: 3,
                      //   rotate: math.pi - index * math.pi / 3,
                      //   onTapDown: (details) {
                      //     logger.e('Triangle $index tapped');
                      //   },
                      // ),
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
                                              scoutingData.teamNumber.toString(),
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
                                                child:
                                                    Selector<ScoutingDataProvider, Preload>(
                                                      selector: (context, scoutingData) => scoutingData.autoData.preload,
                                                      builder: (context, preload, child) {
                                                        return InkwellContainer(
                                                          factor: fieldFactor,
                                                          color: preload == Preload.coral ? AppColors.selectedBtnColor : AppColors.unselectedBtnColor,
                                                          borderColor: preload == Preload.coral ? AppColors.selectedBtnBorderColor : AppColors.unselectedBtnBorderColor,
                                                          borderWidth: 3,
                                                          borderRadius: AppRadius.fieldAreaRadius,
                                                          onTap: () {
                                                            scoutingData.updateAutoData(preload: Preload.coral);
                                                          },
                                                          child: Center(
                                                            child: Transform.rotate(
                                                              angle: math.pi/2,
                                                              child:
                                                            Image.asset(
                                                              'assets/images/coral.png',
                                                              width: 70 * fieldFactor,
                                                              height: 70 * fieldFactor,
                                                            ),
                                                          ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                            ),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child:
                                                    Selector<ScoutingDataProvider, Preload>(
                                                      selector: (context, scoutingData) => scoutingData.autoData.preload,
                                                      builder: (context, preload, child) {
                                                        return InkwellContainer(
                                                          factor: fieldFactor,
                                                          color: preload == Preload.algae ? AppColors.selectedBtnColor : AppColors.unselectedBtnColor,
                                                          borderColor: preload == Preload.algae ? AppColors.selectedBtnBorderColor : AppColors.unselectedBtnBorderColor,
                                                          borderWidth: 3,
                                                          borderRadius: AppRadius.fieldAreaRadius,
                                                          onTap: () {
                                                            scoutingData.updateAutoData(preload: Preload.algae);
                                                          },
                                                          child: Center(
                                                            child: Image.asset(
                                                              'assets/images/algae.png',
                                                              width: 65 * fieldFactor,
                                                              height: 65 * fieldFactor,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                            ),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child:
                                                    Selector<ScoutingDataProvider, Preload>(
                                                      selector: (context, scoutingData) => scoutingData.autoData.preload,
                                                      builder: (context, preload, child) {
                                                        return InkwellContainer(
                                                          factor: fieldFactor,
                                                          color: preload == Preload.none ? AppColors.selectedBtnColor : AppColors.unselectedBtnColor,
                                                          borderColor: preload == Preload.none ? AppColors.selectedBtnBorderColor : AppColors.unselectedBtnBorderColor,
                                                          borderWidth: 3,
                                                          borderRadius: AppRadius.fieldAreaRadius,
                                                          onTap: () {
                                                            scoutingData.updateAutoData(preload: Preload.none);
                                                          },
                                                          child: Center(
                                                            child: Image.asset(
                                                              'assets/images/none.png',
                                                              width: 100 * fieldFactor,
                                                              height: 100 * fieldFactor,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                            ),
                                          ],
                                        )),
                                  ],
                                )),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 6,
                              child:
                                  Selector<ScoutingDataProvider, bool>(
                                    selector: (context, scoutingData) => scoutingData.autoData.leave,
                                    builder: (context, leave, child) {
                                      return InkwellContainer(
                                        height: 100,
                                        factor: fieldFactor,
                                        color: leave ? AppColors.boolBtnTrueColor : AppColors.boolBtnFalseColor,
                                        borderColor: leave ? AppColors.boolBtnTrueBorderColor : AppColors.boolBtnFalseBorderColor,
                                        borderWidth: 3,
                                        borderRadius: AppRadius.fieldAreaRadius * 2,
                                        onTap: () {
                                          scoutingData.updateAutoData(leave: !leave);
                                        },
                                        child: Center(
                                          child: Text(
                                            'AUTO LEAVE',
                                            style: TextStyle(
                                              // color: AppColors.prematchBtnTextColor,
                                              fontSize: 24 * fieldFactor,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                              // InkwellContainer(
                              //   height: 100,
                              //   factor: fieldFactor,
                              //   color: AppColors.boolBtnFalseColor,
                              //   borderColor: AppColors.boolBtnFalseBorderColor,
                              //   borderWidth: 3,
                              //   borderRadius: AppRadius.fieldAreaRadius * 2,
                              //   child: Center(
                              //     child: Text(
                              //       'AUTO LEAVE',
                              //       style: TextStyle(
                              //         // color: AppColors.prematchBtnTextColor,
                              //         fontSize: 24 * fieldFactor,
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
                                      onTap: () {
                                        scoutingData.addAutoPathPoint(AutoPathPoint.reefAlgae);
                                      },
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
                                    child:Selector<ScoutingDataProvider, bool>(
                                      selector: (context, scoutingData) => scoutingData.autoData.pathPointIsSuccess,
                                      builder: (context, pathPointIsSuccess, child) {
                                        return InkwellContainer(
                                          factor: fieldFactor,
                                          color: pathPointIsSuccess ? AppColors.unselectedBtnColor : AppColors.boolBtnFalseColor,
                                          borderColor: pathPointIsSuccess ? AppColors.unselectedBtnBorderColor : AppColors.boolBtnFalseBorderColor,
                                          borderWidth: 3,
                                          borderRadius: AppRadius.fieldAreaRadius,
                                          onTap: () {
                                            scoutingData.changeAutoPathPointStatus(!pathPointIsSuccess);
                                          },
                                          child: Center(
                                            child: Text(
                                              'Failed',
                                              style: TextStyle(
                                                fontSize: 24 * fieldFactor,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    // InkwellContainer(
                                    //   factor: fieldFactor,
                                    //   color: AppColors.unselectedBtnColor,
                                    //   borderColor:
                                    //       AppColors.unselectedBtnBorderColor,
                                    //   borderWidth: 3,
                                    //   borderRadius: AppRadius.fieldAreaRadius,
                                    //   child: Center(
                                    //     child: Text(
                                    //       'Failed',
                                    //       style: TextStyle(
                                    //         fontSize: 24 * fieldFactor,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
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
                                          onTap: () {
                                            final selectedSide = context.read<ScoutingDataProvider>().autoData.selectedReefSide;
                                            final enumIndex = AutoPathPoint.l1ReefAB.index + selectedSide;
                                            scoutingData.addAutoPathPoint(AutoPathPoint.values[enumIndex]);
                                            logger.d("L1");
                                            logger.d(AutoPathPoint.l1ReefAB.index+Provider.of<ScoutingDataProvider>(context).autoData.selectedReefSide);
                                          },
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
                                          onTap: () {
                                            final selectedSide = context.read<ScoutingDataProvider>().autoData.selectedReefSide;
                                            final enumIndex = AutoPathPoint.l2ReefAB.index + selectedSide;
                                            scoutingData.addAutoPathPoint(AutoPathPoint.values[enumIndex]);
                                            logger.d("L2");
                                            logger.d(AutoPathPoint.l1ReefAB.index+Provider.of<ScoutingDataProvider>(context).autoData.selectedReefSide);
                                          },
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
                                          onTap: () {
                                            final selectedSide = context.read<ScoutingDataProvider>().autoData.selectedReefSide;
                                            final enumIndex = AutoPathPoint.l3ReefAB.index + selectedSide;
                                            scoutingData.addAutoPathPoint(AutoPathPoint.values[enumIndex]);
                                            logger.d("L3");
                                            logger.d(AutoPathPoint.l1ReefAB.index+Provider.of<ScoutingDataProvider>(context).autoData.selectedReefSide);
                                          },
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
                                          onTap: () {
                                            final selectedSide = context.read<ScoutingDataProvider>().autoData.selectedReefSide;
                                            final enumIndex = AutoPathPoint.l4ReefAB.index + selectedSide;
                                            scoutingData.addAutoPathPoint(AutoPathPoint.values[enumIndex]);
                                            logger.d("L4");
                                            logger.d(AutoPathPoint.l1ReefAB.index+Provider.of<ScoutingDataProvider>(context).autoData.selectedReefSide);
                                          },
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
                                      flex: 6,
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
                                            Navigator.pushNamed(context,'/info');
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
                                      flex: 6,
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
                                      flex: 6,
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
                                            // Navigator.pushNamed(context, '/teleop');
                                            Navigator.pushNamed(context, '/result');
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
      // ),
    );
  }
}
