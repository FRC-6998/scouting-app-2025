import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

import '../utils/logger.dart' show logger;
import '../widgets/tap_widgets.dart' show TapBox, TapEffectBox;
import '../widgets/triangle_widgets.dart' show TriangleWidget;
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
    ScoutingData scoutingDataSetter =
        Provider.of<ScoutingData>(context, listen: false);
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
        // return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double aspectRatio = 852 / 962;
          double fieldWidth;
          if (constraints.maxWidth - constraints.maxHeight * aspectRatio >
              // constraints.maxWidth * 2 / 5) {
              constraints.maxWidth * 1 / 2) {
            fieldWidth = constraints.maxHeight * aspectRatio;
          } else {
            // fieldWidth = constraints.maxWidth * 3 / 5;
            fieldWidth = constraints.maxWidth * 1 / 2;
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
                    // Image.asset('assets/images/2025field.png',height: fieldHeight,width: fieldWidth,color: Colors.red,),
                    TapEffectBox(
                      // l coral station
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
                        scoutingDataSetter
                            .addAutoPathPoint(AutoPathPoint.leftCoralStation);
                      },
                      child: Transform.rotate(
                        angle: math.pi / 2,
                        child: Image.asset(
                          'assets/images/coral.png',
                          width: 80 * fieldFactor,
                          height: 80 * fieldFactor,
                        ),
                      ),
                    ),
                    TapEffectBox(
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
                        scoutingDataSetter
                            .addAutoPathPoint(AutoPathPoint.rightCoralStation);
                      },
                      child: Transform.rotate(
                        angle: math.pi / 2,
                        child: Image.asset(
                          'assets/images/coral.png',
                          width: 80 * fieldFactor,
                          height: 80 * fieldFactor,
                        ),
                      ),
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
                                (index) => TapEffectBox(
                                      width: 80,
                                      factor: fieldFactor,
                                      color: AppColors.sourceAreaColor,
                                      borderColor: AppColors.sourceBorderColor,
                                      borderWidth: 3,
                                      borderRadius: AppRadius.fieldAreaRadius,
                                      onTap: () {
                                        scoutingDataSetter.addAutoPathPoint(
                                            AutoPathPoint.values[AutoPathPoint
                                                    .leftGroundAlgae.index +
                                                index]);
                                      },
                                      child: Image.asset(
                                        'assets/images/algae.png',
                                        width: 70 * fieldFactor,
                                        height: 70 * fieldFactor,
                                      ),
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
                                (index) => TapEffectBox(
                                      width: 80,
                                      factor: fieldFactor,
                                      color: AppColors.sourceAreaColor,
                                      borderColor: AppColors.sourceBorderColor,
                                      borderWidth: 3,
                                      borderRadius: AppRadius.fieldAreaRadius,
                                      onTap: () {
                                        scoutingDataSetter.addAutoPathPoint(
                                            AutoPathPoint.values[AutoPathPoint
                                                    .leftGroundCoral.index +
                                                index]);
                                      },
                                      child: Transform.rotate(
                                        angle: math.pi / 2,
                                        child: Image.asset(
                                          'assets/images/coral.png',
                                          width: 70 * fieldFactor,
                                          height: 70 * fieldFactor,
                                        ),
                                      ),
                                    )),
                          ),
                        )),
                    TapEffectBox(
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
                        scoutingDataSetter
                            .addAutoPathPoint(AutoPathPoint.processor);
                      },
                      child: Image.asset(
                        'assets/images/algae.png',
                        width: 70 * fieldFactor,
                        height: 70 * fieldFactor,
                      ),
                    ),
                    TapEffectBox(
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
                        scoutingDataSetter.addAutoPathPoint(AutoPathPoint.net);
                      },
                      child: Image.asset(
                        'assets/images/algae.png',
                        width: 70 * fieldFactor,
                        height: 70 * fieldFactor,
                      ),
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
                              Selector<ScoutingData, AutoStartPosition>(
                                selector: (context, scoutingData) =>
                                    scoutingData.autoData.startPosition,
                                builder: (context, startPosition, child) {
                                  return TapBox(
                                    width: 135,
                                    factor: fieldFactor,
                                    color:
                                        startPosition == AutoStartPosition.left
                                            ? AppColors.selectedBtnColor
                                            : AppColors.unselectedBtnColor,
                                    borderColor: startPosition ==
                                            AutoStartPosition.left
                                        ? AppColors.selectedBtnBorderColor
                                        : AppColors.unselectedBtnBorderColor,
                                    // color: AppColors.unselectedBtnColor,
                                    // borderColor: AppColors.unselectedBtnBorderColor,
                                    borderWidth: 3,
                                    // borderWidth: startPosition == AutoStartPosition.left ? 6 : 3,
                                    borderRadius: AppRadius.fieldAreaRadius,
                                    onTap: () {
                                      scoutingDataSetter.updateAutoData(
                                          startPosition:
                                              AutoStartPosition.left);
                                    },
                                  );
                                },
                              ),
                              Spacer(),
                              Selector<ScoutingData, AutoStartPosition>(
                                selector: (context, scoutingData) =>
                                    scoutingData.autoData.startPosition,
                                builder: (context, startPosition, child) {
                                  return TapBox(
                                    width: 135,
                                    factor: fieldFactor,
                                    color: startPosition ==
                                            AutoStartPosition.center
                                        ? AppColors.selectedBtnColor
                                        : AppColors.unselectedBtnColor,
                                    borderColor: startPosition ==
                                            AutoStartPosition.center
                                        ? AppColors.selectedBtnBorderColor
                                        : AppColors.unselectedBtnBorderColor,
                                    // color: AppColors.unselectedBtnColor,
                                    // borderColor: AppColors.unselectedBtnBorderColor,
                                    borderWidth: 3,
                                    // borderWidth: startPosition == AutoStartPosition.center ? 6 : 3,
                                    borderRadius: AppRadius.fieldAreaRadius,
                                    onTap: () {
                                      scoutingDataSetter.updateAutoData(
                                          startPosition:
                                              AutoStartPosition.center);
                                    },
                                  );
                                },
                              ),
                              Spacer(),
                              Selector<ScoutingData, AutoStartPosition>(
                                selector: (context, scoutingData) =>
                                    scoutingData.autoData.startPosition,
                                builder: (context, startPosition, child) {
                                  return TapBox(
                                    width: 135,
                                    factor: fieldFactor,
                                    color:
                                        startPosition == AutoStartPosition.right
                                            ? AppColors.selectedBtnColor
                                            : AppColors.unselectedBtnColor,
                                    borderColor: startPosition ==
                                            AutoStartPosition.right
                                        ? AppColors.selectedBtnBorderColor
                                        : AppColors.unselectedBtnBorderColor,
                                    // color: AppColors.unselectedBtnColor,
                                    // borderColor: AppColors.unselectedBtnBorderColor,
                                    borderWidth: 3,
                                    // borderWidth: startPosition == AutoStartPosition.right ? 6 : 3,
                                    borderRadius: AppRadius.fieldAreaRadius,
                                    onTap: () {
                                      scoutingDataSetter.updateAutoData(
                                          startPosition:
                                              AutoStartPosition.right);
                                    },
                                  );
                                },
                              ),
                            ],
                          )),
                    ),
                    ...List.generate(
                      6,
                      (index) => Selector<ScoutingData, int>(
                        selector: (context, scoutingData) =>
                            scoutingData.autoData.selectedReefSide,
                        shouldRebuild: (previous, next) =>
                            (previous == index && next != index) ||
                            (previous != index && next == index),
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
                              scoutingDataSetter.changeSelectedReefSide(index);
                              logger.d('Triangle $index tapped');
                            },
                          );
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
                                              scoutingDataSetter.teamNumber
                                                  .toString(),
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
                                              child: Selector<ScoutingData,
                                                  Preload>(
                                                selector: (context,
                                                        scoutingData) =>
                                                    scoutingData
                                                        .autoData.preload,
                                                builder:
                                                    (context, preload, child) {
                                                  return TapBox(
                                                    factor: fieldFactor,
                                                    color: preload ==
                                                            Preload.coral
                                                        ? AppColors
                                                            .selectedBtnColor
                                                        : AppColors
                                                            .unselectedBtnColor,
                                                    borderColor: preload ==
                                                            Preload.coral
                                                        ? AppColors
                                                            .selectedBtnBorderColor
                                                        : AppColors
                                                            .unselectedBtnBorderColor,
                                                    borderWidth: 3,
                                                    borderRadius: AppRadius
                                                        .fieldAreaRadius,
                                                    onTap: () {
                                                      scoutingDataSetter
                                                          .updateAutoData(
                                                              preload: Preload
                                                                  .coral);
                                                    },
                                                    child: Center(
                                                      child: Transform.rotate(
                                                        angle: math.pi / 2,
                                                        child: Image.asset(
                                                          'assets/images/coral.png',
                                                          width:
                                                              70 * fieldFactor,
                                                          height:
                                                              70 * fieldFactor,
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
                                              child: Selector<ScoutingData,
                                                  Preload>(
                                                selector: (context,
                                                        scoutingData) =>
                                                    scoutingData
                                                        .autoData.preload,
                                                builder:
                                                    (context, preload, child) {
                                                  return TapBox(
                                                    factor: fieldFactor,
                                                    color: preload ==
                                                            Preload.algae
                                                        ? AppColors
                                                            .selectedBtnColor
                                                        : AppColors
                                                            .unselectedBtnColor,
                                                    borderColor: preload ==
                                                            Preload.algae
                                                        ? AppColors
                                                            .selectedBtnBorderColor
                                                        : AppColors
                                                            .unselectedBtnBorderColor,
                                                    borderWidth: 3,
                                                    borderRadius: AppRadius
                                                        .fieldAreaRadius,
                                                    onTap: () {
                                                      scoutingDataSetter
                                                          .updateAutoData(
                                                              preload: Preload
                                                                  .algae);
                                                    },
                                                    child: Center(
                                                      child: Image.asset(
                                                        'assets/images/algae.png',
                                                        width: 65 * fieldFactor,
                                                        height:
                                                            65 * fieldFactor,
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
                                              child: Selector<ScoutingData,
                                                  Preload>(
                                                selector: (context,
                                                        scoutingData) =>
                                                    scoutingData
                                                        .autoData.preload,
                                                builder:
                                                    (context, preload, child) {
                                                  return TapBox(
                                                    factor: fieldFactor,
                                                    color: preload ==
                                                            Preload.none
                                                        ? AppColors
                                                            .selectedBtnColor
                                                        : AppColors
                                                            .unselectedBtnColor,
                                                    borderColor: preload ==
                                                            Preload.none
                                                        ? AppColors
                                                            .selectedBtnBorderColor
                                                        : AppColors
                                                            .unselectedBtnBorderColor,
                                                    borderWidth: 3,
                                                    borderRadius: AppRadius
                                                        .fieldAreaRadius,
                                                    onTap: () {
                                                      scoutingDataSetter
                                                          .updateAutoData(
                                                              preload:
                                                                  Preload.none);
                                                    },
                                                    child: Center(
                                                      child: Image.asset(
                                                        'assets/images/none.png',
                                                        width:
                                                            100 * fieldFactor,
                                                        height:
                                                            100 * fieldFactor,
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
                              child: Selector<ScoutingData, bool>(
                                selector: (context, scoutingData) =>
                                    scoutingData.autoData.leave,
                                builder: (context, leave, child) {
                                  return TapBox(
                                    height: 100,
                                    factor: fieldFactor,
                                    color: leave
                                        ? AppColors.boolBtnTrueColor
                                        : AppColors.boolBtnFalseColor,
                                    borderColor: leave
                                        ? AppColors.boolBtnTrueBorderColor
                                        : AppColors.boolBtnFalseBorderColor,
                                    borderWidth: 3,
                                    borderRadius: AppRadius.fieldAreaRadius * 2,
                                    onTap: () {
                                      scoutingDataSetter.updateAutoData(
                                          leave: !leave);
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
                                    child: TapEffectBox(
                                      factor: fieldFactor,
                                      color: AppColors.sourceAreaColor,
                                      borderColor: AppColors.sourceBorderColor,
                                      borderWidth: 3,
                                      borderRadius: AppRadius.fieldAreaRadius,
                                      onTap: () {
                                        scoutingDataSetter.addAutoPathPoint(
                                            AutoPathPoint.reefAlgae);
                                      },
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/algae.png',
                                            width: 60 * fieldFactor,
                                            height: 60 * fieldFactor,
                                          ),
                                          Text(
                                            ' Reef Algae',
                                            style: TextStyle(
                                              fontSize: 24 * fieldFactor,
                                            ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 19,
                                    child: Selector<ScoutingData, bool>(
                                      selector: (context, scoutingData) =>
                                          scoutingData
                                              .autoData.pathPointIsSuccess,
                                      builder:
                                          (context, pathPointIsSuccess, child) {
                                        return TapBox(
                                          factor: fieldFactor,
                                          color: pathPointIsSuccess
                                              ? AppColors.unselectedBtnColor
                                              : AppColors.boolBtnFalseColor,
                                          borderColor: pathPointIsSuccess
                                              ? AppColors
                                                  .unselectedBtnBorderColor
                                              : AppColors
                                                  .boolBtnFalseBorderColor,
                                          borderWidth: 3,
                                          borderRadius:
                                              AppRadius.fieldAreaRadius,
                                          onTap: () {
                                            scoutingDataSetter
                                                .changeAutoPathPointStatus(
                                                    !pathPointIsSuccess);
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
                                        child: TapEffectBox(
                                          factor: fieldFactor,
                                          color: AppColors.reefBtnColor,
                                          borderColor:
                                              AppColors.reefBtnBorderColor,
                                          borderWidth: 3,
                                          borderRadius:
                                              AppRadius.fieldAreaRadius,
                                          onTap: () {
                                            final selectedSide = context
                                                .read<ScoutingData>()
                                                .autoData
                                                .selectedReefSide;
                                            final enumIndex =
                                                AutoPathPoint.l1ReefAB.index +
                                                    selectedSide;
                                            scoutingDataSetter.addAutoPathPoint(
                                                AutoPathPoint
                                                    .values[enumIndex]);
                                            // logger.d("L1");
                                            // logger.d(AutoPathPoint.l1ReefAB.index+context.read<ScoutingDataProvider>().autoData.selectedReefSide);
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
                                        child: TapEffectBox(
                                          factor: fieldFactor,
                                          color: AppColors.reefBtnColor,
                                          borderColor:
                                              AppColors.reefBtnBorderColor,
                                          borderWidth: 3,
                                          borderRadius:
                                              AppRadius.fieldAreaRadius,
                                          onTap: () {
                                            final selectedSide = context
                                                .read<ScoutingData>()
                                                .autoData
                                                .selectedReefSide;
                                            final enumIndex =
                                                AutoPathPoint.l2ReefAB.index +
                                                    selectedSide;
                                            scoutingDataSetter.addAutoPathPoint(
                                                AutoPathPoint
                                                    .values[enumIndex]);
                                            // logger.d("L2");
                                            // logger.d(AutoPathPoint.l1ReefAB.index+context.read<ScoutingDataProvider>().autoData.selectedReefSide);
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
                                        child: TapEffectBox(
                                          factor: fieldFactor,
                                          color: AppColors.reefBtnColor,
                                          borderColor:
                                              AppColors.reefBtnBorderColor,
                                          borderWidth: 3,
                                          borderRadius:
                                              AppRadius.fieldAreaRadius,
                                          onTap: () {
                                            final selectedSide = context
                                                .read<ScoutingData>()
                                                .autoData
                                                .selectedReefSide;
                                            final enumIndex =
                                                AutoPathPoint.l3ReefAB.index +
                                                    selectedSide;
                                            scoutingDataSetter.addAutoPathPoint(
                                                AutoPathPoint
                                                    .values[enumIndex]);
                                            // logger.d("L3");
                                            // logger.d(AutoPathPoint.l1ReefAB.index+context.read<ScoutingDataProvider>().autoData.selectedReefSide);
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
                                        child: TapEffectBox(
                                          factor: fieldFactor,
                                          color: AppColors.reefBtnColor,
                                          borderColor:
                                              AppColors.reefBtnBorderColor,
                                          borderWidth: 3,
                                          borderRadius:
                                              AppRadius.fieldAreaRadius,
                                          onTap: () {
                                            final selectedSide = context
                                                .read<ScoutingData>()
                                                .autoData
                                                .selectedReefSide;
                                            final enumIndex =
                                                AutoPathPoint.l4ReefAB.index +
                                                    selectedSide;
                                            scoutingDataSetter.addAutoPathPoint(
                                                AutoPathPoint
                                                    .values[enumIndex]);
                                            // logger.d("L4");
                                            // logger.d(AutoPathPoint.l1ReefAB.index+context.read<ScoutingDataProvider>().autoData.selectedReefSide);
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
                                            logger.d("Info");
                                            Navigator.pushNamed(
                                                context, '/info');
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
                                            scoutingDataSetter.autoData
                                                .undoPathPoint();
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
                                            Navigator.pushNamed(
                                                context, '/teleop');
                                            // Navigator.pushNamed(context, '/result');
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
