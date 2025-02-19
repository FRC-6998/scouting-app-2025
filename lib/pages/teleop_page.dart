import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scout_app_v0/constants.dart';
import 'package:scout_app_v0/model.dart';

import 'package:scout_app_v0/widgets/tap_widgets.dart';
import '../providers/scouting_data_provider.dart';
import '../utils/logger.dart';
import '../widgets/text_widgets.dart';
import '../widgets/hang_timer_widget.dart';
import '../widgets/image_widgets.dart';

class TeleopPage extends StatefulWidget {
  const TeleopPage({super.key});

  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  @override
  Widget build(BuildContext context) {
    ScoutingData scoutingDataSetter =
        Provider.of<ScoutingData>(context, listen: false);

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('teleop Page'),
        // ),
        body: Column(
      children: [
        Spacer(flex: 1),
        Expanded(
            flex: 20,
            child: Row(children: [
              Spacer(),
              Expanded(
                  flex: 15,
                  child: Column(children: [
                    Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 14,
                                child: TapEffectBox(
                                  color: AppColors.sourceAreaColor,
                                  pressedColor: AppColors.boolBtnTrueColor,
                                  borderColor: AppColors.sourceBorderColor,
                                  onTap: () {
                                    scoutingDataSetter.addTeleopPathPoint(
                                        TeleopPathPoint.reefAlgae);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AlgaeImage(
                                        sideLength: 60,
                                      ),
                                      Text(
                                        ' Reef Algae',
                                        style: TextStyle(
                                          fontSize: 27,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Spacer(),
                            Expanded(
                                flex: 14,
                                child: TapEffectBox(
                                  color: AppColors.sourceAreaColor,
                                  pressedColor: AppColors.boolBtnTrueColor,
                                  borderColor: AppColors.sourceBorderColor,
                                  onTap: () {
                                    scoutingDataSetter.addTeleopPathPoint(
                                        TeleopPathPoint.coralStation);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CoralImage(
                                        sideLength: 60,
                                      ),
                                      TeleopWidgetText(' Coral Station'),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                    Spacer(),
                    Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 14,
                                child: TapEffectBox(
                                  color: AppColors.sourceAreaColor,
                                  pressedColor: AppColors.boolBtnTrueColor,
                                  borderColor: AppColors.sourceBorderColor,
                                  onTap: () {
                                    scoutingDataSetter.addTeleopPathPoint(
                                        TeleopPathPoint.groundAlgae);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AlgaeImage(
                                        sideLength: 60,
                                      ),
                                      Text(
                                        ' Ground Algae',
                                        style: TextStyle(
                                          fontSize: 27,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Spacer(),
                            Expanded(
                                flex: 14,
                                child: TapEffectBox(
                                  color: AppColors.sourceAreaColor,
                                  pressedColor: AppColors.boolBtnTrueColor,
                                  borderColor: AppColors.sourceBorderColor,
                                  onTap: () {
                                    scoutingDataSetter.addTeleopPathPoint(
                                        TeleopPathPoint.groundCoral);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CoralImage(
                                        sideLength: 60,
                                      ),
                                      TeleopWidgetText(' Ground Coral'),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                    Spacer(),
                    Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 14,
                              child: TapEffectBox(
                                color: AppColors.scoreAreaColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                borderColor: AppColors.scoreBorderColor,
                                onTap: () {
                                  scoutingDataSetter.addTeleopPathPoint(
                                      TeleopPathPoint.processor);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AlgaeImage(
                                      sideLength: 60,
                                    ),
                                    TeleopWidgetText(' Processor'),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                                flex: 14,
                                child: TapEffectBox(
                                  color: AppColors.scoreAreaColor,
                                  pressedColor: AppColors.boolBtnTrueColor,
                                  borderColor: AppColors.scoreBorderColor,
                                  onTap: () {
                                    scoutingDataSetter.addTeleopPathPoint(
                                        TeleopPathPoint.net);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AlgaeImage(
                                        sideLength: 60,
                                      ),
                                      TeleopWidgetText(' Net'),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                    Spacer(),
                    Expanded(
                      flex: 10,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 14,
                              child: TapEffectBox(
                                color: AppColors.reefBtnColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                borderColor: AppColors.reefBtnBorderColor,
                                onTap: () {
                                  scoutingDataSetter.addTeleopPathPoint(
                                      TeleopPathPoint.l2Reef);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(context.select((ScoutingData scoutingData) => scoutingData.teleopData.pathCount[TeleopPathPoint.l2Reef] ?? 0).toString(),
                                      style: TextStyle(
                                        fontSize: 40,
                                      ),
                                    ),
                                    TeleopWidgetText(' L2'),
                                  ],
                                ),
                              )),
                          Spacer(),
                          Expanded(
                              flex: 14,
                              child: TapEffectBox(
                                color: AppColors.reefBtnColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                borderColor: AppColors.reefBtnBorderColor,
                                onTap: () {
                                  scoutingDataSetter.addTeleopPathPoint(
                                      TeleopPathPoint.l3Reef);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(context.select((ScoutingData scoutingData) => scoutingData.teleopData.pathCount[TeleopPathPoint.l3Reef] ?? 0).toString(),
                                      style: TextStyle(
                                        fontSize: 40,
                                      ),
                                    ),
                                    TeleopWidgetText(' L3'),
                                  ],
                                ),
                              )),
                          Spacer(),
                          Expanded(
                              flex: 14,
                              child: TapEffectBox(
                                color: AppColors.reefBtnColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                borderColor: AppColors.reefBtnBorderColor,
                                onTap: () {
                                  scoutingDataSetter.addTeleopPathPoint(
                                      TeleopPathPoint.l4Reef);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(context.select((ScoutingData scoutingData) => scoutingData.teleopData.pathCount[TeleopPathPoint.l4Reef] ?? 0).toString(),
                                      style: TextStyle(
                                        fontSize: 40,
                                      ),
                                    ),
                                    TeleopWidgetText(' L4'),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        flex: 6,
                        child: TapEffectBox(
                          color: AppColors.reefBtnColor,
                          pressedColor: AppColors.boolBtnTrueColor,
                          borderColor: AppColors.reefBtnBorderColor,
                          onTap: () {
                            scoutingDataSetter
                                .addTeleopPathPoint(TeleopPathPoint.l1Reef);
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Spacer(),
                              Expanded(
                                child: Center(
                                  child: Text(context.select((ScoutingData scoutingData) => scoutingData.teleopData.pathCount[TeleopPathPoint.l1Reef] ?? 0).toString(),
                                    style: TextStyle(
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Center(child: TeleopWidgetText(' L1'))),
                              Spacer(),
                            ],
                          ),
                        )),
                  ])),
              Spacer(),
              Expanded(
                flex: 15,
                child: Column(children: [
                  Expanded(
                      flex: 8,
                      child: HangTimer(
                        onStart: (bargeAction) {
                          scoutingDataSetter.updateTeleopData(
                              bargeResult: bargeAction,
                              bargeTried: bargeAction);
                        },
                        onEnd: (bargeTried, success, hangTime) {
                          scoutingDataSetter.updateTeleopData(
                              hangTime: hangTime);
                          if (!success) {
                            scoutingDataSetter.updateTeleopData(
                                bargeResult: BargeAction.unset);
                          }
                        },
                        onReset: () {
                          scoutingDataSetter.updateTeleopData(
                              bargeResult: BargeAction.unset);
                        },
                      )),
                  Spacer(),
                  Expanded(
                    flex: 4,
                    child: Selector<ScoutingData, BargeAction>(
                      selector: (_, scoutingData) =>
                          scoutingData.teleopData.bargeResult,
                      builder: (context, bargeResult, child) {
                        final isSelected = bargeResult == BargeAction.park;

                        return TapBox(
                          borderWidth: isSelected ? 4 : 2,
                          color: isSelected
                              ? AppColors.selectedBtnColor
                              : AppColors.unselectedBtnColor,
                          borderColor: isSelected
                              ? AppColors.selectedBtnBorderColor
                              : AppColors.unselectedBtnBorderColor,
                          onTap: () {
                            if (bargeResult != BargeAction.shallow &&
                                bargeResult != BargeAction.deep) {
                              scoutingDataSetter.updateTeleopData(
                                  bargeResult: BargeAction.park);
                            }
                          },
                          child: const TeleopWidgetText('PARK'),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Selector<ScoutingData, BargePosition>(
                                selector: (_, scoutingData) =>
                                scoutingData.teleopData.bargePosition,
                                builder: (context, bargePosition, child) {
                                  final isSelected =
                                      bargePosition == BargePosition.left;
                                      // bargePosition == BargePosition.left && context.select((ScoutingData scoutingData) => scoutingData.teleopData.bargeResult) != BargeAction.none;

                                  return TapBox(
                                    borderWidth: isSelected ? 4 : 2,
                                    color: isSelected
                                        ? AppColors.reefAreaColor
                                        : AppColors.unselectedBtnColor,
                                    borderColor: isSelected
                                        ? AppColors.selectedBtnBorderColor
                                        : AppColors.unselectedBtnBorderColor,
                                    onTap: () {
                                      scoutingDataSetter.updateTeleopData(
                                          bargePosition: isSelected
                                              ? BargePosition.none
                                              : BargePosition.left);
                                    },
                                    child: const TeleopWidgetText('Left'),
                                  );
                                },
                              )),
                          Spacer(),
                          Expanded(
                              flex: 4,
                              child: Selector<ScoutingData, BargePosition>(
                                  selector: (_, scoutingData) =>
                                  scoutingData.teleopData.bargePosition,
                                  builder: (context, bargePosition, child) {
                                    final isSelected =
                                        bargePosition == BargePosition.center;
                                        // bargePosition == BargePosition.center && context.select((ScoutingData scoutingData) => scoutingData.teleopData.bargeResult) != BargeAction.none;

                                    return TapBox(
                                      borderWidth: isSelected ? 4 : 2,
                                      color: isSelected
                                          ? AppColors.reefAreaColor
                                          : AppColors.unselectedBtnColor,
                                      borderColor: isSelected
                                          ? AppColors.selectedBtnBorderColor
                                          : AppColors.unselectedBtnBorderColor,
                                      onTap: () {
                                        scoutingDataSetter.updateTeleopData(
                                            bargePosition: isSelected
                                                ? BargePosition.none
                                                : BargePosition.center);
                                      },
                                      child: const TeleopWidgetText('Center'),
                                    );
                                  })),
                          Spacer(),
                          Expanded(
                              flex: 4,
                              child: Selector<ScoutingData, BargePosition>(
                                  selector: (_, scoutingData) =>
                                  scoutingData.teleopData.bargePosition,
                                  builder: (context, bargePosition, child) {
                                    final isSelected =
                                        bargePosition == BargePosition.right;
                                        // bargePosition == BargePosition.right && context.select((ScoutingData scoutingData) => scoutingData.teleopData.bargeResult) != BargeAction.none;

                                    return TapBox(
                                      borderWidth: isSelected ? 4 : 2,
                                      color: isSelected
                                          ? AppColors.reefAreaColor
                                          : AppColors.unselectedBtnColor,
                                      borderColor: isSelected
                                          ? AppColors.selectedBtnBorderColor
                                          : AppColors.unselectedBtnBorderColor,
                                      onTap: () {
                                        scoutingDataSetter.updateTeleopData(
                                            bargePosition: isSelected
                                                ? BargePosition.none
                                                : BargePosition.right);
                                      },
                                      child: const TeleopWidgetText('Right'),
                                    );
                                  })),
                        ],
                      )),
                  Spacer(),
                  Expanded(
                    flex: 4,
                    child: Selector<ScoutingData, BargeAction>(
                      selector: (_, scoutingData) =>
                          scoutingData.teleopData.bargeResult,
                      builder: (context, bargeResult, child) {
                        final isSelected = bargeResult == BargeAction.none;

                        return TapBox(
                          borderWidth: isSelected ? 4 : 2,
                          color: isSelected
                              ? AppColors.selectedBtnColor
                              : AppColors.unselectedBtnColor,
                          borderColor: isSelected
                              ? AppColors.selectedBtnBorderColor
                              : AppColors.unselectedBtnBorderColor,
                          onTap: () {
                            if (bargeResult != BargeAction.shallow &&
                                bargeResult != BargeAction.deep) {
                              scoutingDataSetter.updateTeleopData(
                                  bargeResult: BargeAction.none);
                            }
                          },
                          child: const TeleopWidgetText('NONE'),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Color(0xFFFFFFFF),
                                  backgroundColor: Color(0xFF303E9B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  logger.d("Back");
                                  Navigator.pushNamed(context, '/auto');
                                },
                                child: Text("Auto",
                                    style: TextStyle(fontSize: 30))),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 6,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Color(0xFFFFFFFF)),
                                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                                      (states) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return Color(0xFFFF7A28);
                                    }
                                    return Color(0xFFEF7373);
                                  },
                                ),
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                                onPressed: () {
                                  logger.d("Undo");
                                  scoutingDataSetter.undoTeleopPathPoint();
                                },
                                child: Text("Undo",
                                    style: TextStyle(fontSize: 30))),
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
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  logger.d("comment");
                                  Navigator.pushNamed(context, '/comment');
                                },
                                child: Text("End",
                                    style: TextStyle(fontSize: 30))),
                          ),
                        ],
                      )),
                ]),
              ),
              Spacer(),
            ])),
        Spacer(flex: 1),
      ],
    ));
  }
}
