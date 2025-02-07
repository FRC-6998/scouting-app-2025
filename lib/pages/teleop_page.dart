import 'dart:convert';
import 'dart:math' as math;
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
// import '../widgets/stateless_hang_timer.dart';

class TeleopPage extends StatefulWidget {
  const TeleopPage({super.key});

  @override
  _TeleopPageState createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  Color _buttonColor = Colors.red;

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
                      // child: ColorChangeInkwell(
                      //   initialColor: AppColors.sourceAreaColor,
                      //   pressedColor: AppColors.boolBtnTrueColor,
                      //   borderColor: AppColors.sourceBorderColor,
                      //   textString: 'Coral Station',
                      //   onTap: () {
                      //     scoutingDataSetter.addTeleopPathPoint(
                      //         TeleopPathPoint.coralStation);
                      //   },
                      // )
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
                                sideLength: 80,
                              ),
                              Text(
                                ' Coral Station',
                                style: TextStyle(
                                  fontSize: 27,
                                ),
                              ),
                            ],
                          )),
                      // child: Row(
                      //   children: [
                      //     Expanded(
                      //         flex: 14,
                      //         child: ColorChangeInkwell(
                      //           initialColor: AppColors.sourceAreaColor,
                      //           pressedColor: AppColors.boolBtnTrueColor,
                      //           borderColor: AppColors.sourceBorderColor,
                      //           // 點擊時顏色
                      //           textString: 'Left Coral Station',
                      //           onTap: () {
                      //             scoutingDataSetter.addTeleopPathPoint(
                      //                 TeleopPathPoint.leftCoralStation);
                      //           },
                      //         )),
                      //     Spacer(),
                      //     Expanded(
                      //         flex: 14,
                      //         child: ColorChangeInkwell(
                      //           initialColor: AppColors.sourceAreaColor,
                      //           pressedColor: AppColors.boolBtnTrueColor,
                      //           borderColor: AppColors.sourceBorderColor,
                      //           // 點擊時顏色
                      //           textString: 'Right Coral Station',
                      //           onTap: () {
                      //             scoutingDataSetter.addTeleopPathPoint(
                      //                 TeleopPathPoint.rightCoralStation);
                      //           },
                      //         )),
                      //   ],
                      // )
                    ),
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
                                child: TeleopWidgetText('L2'),
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
                                child: TeleopWidgetText('L3'),
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
                                child: TeleopWidgetText('L4'),
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
                          child: TeleopWidgetText('L1'),
                        )),

                    // Expanded(
                    //     flex: 17,
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //           flex: 14,
                    //           child: Column(
                    //             children: [
                    //               Expanded(
                    //                 flex: 5,
                    //                 child: ColorChangeInkwell(
                    //                   initialColor: AppColors.reefBtnColor,
                    //                   pressedColor: AppColors.boolBtnTrueColor,
                    //                   textString: 'L4',
                    //                   borderColor: AppColors.reefBtnBorderColor,
                    //                   onTap: () {
                    //                     scoutingDataSetter.addTeleopPathPoint(
                    //                         TeleopPathPoint.l4LeftReef);
                    //                   },
                    //                 ),
                    //               ),
                    //               Spacer(),
                    //               Expanded(
                    //                 flex: 5,
                    //                 child: ColorChangeInkwell(
                    //                   initialColor: AppColors.reefBtnColor,
                    //                   pressedColor: AppColors.boolBtnTrueColor,
                    //                   textString: 'L3',
                    //                   borderColor: AppColors.reefBtnBorderColor,
                    //                   onTap: () {
                    //                     scoutingDataSetter.addTeleopPathPoint(
                    //                         TeleopPathPoint.l3LeftReef);
                    //                   },
                    //                 ),
                    //               ),
                    //               Spacer(),
                    //               Expanded(
                    //                 flex: 5,
                    //                 child: ColorChangeInkwell(
                    //                   initialColor: AppColors.reefBtnColor,
                    //                   pressedColor: AppColors.boolBtnTrueColor,
                    //                   textString: 'L2',
                    //                   borderColor: AppColors.reefBtnBorderColor,
                    //                   onTap: () {
                    //                     scoutingDataSetter.addTeleopPathPoint(
                    //                         TeleopPathPoint.l2LeftReef);
                    //                   },
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Spacer(),
                    //         Expanded(
                    //           flex: 14,
                    //           child: ColorChangeInkwell(
                    //             initialColor: AppColors.reefBtnColor,
                    //             pressedColor: AppColors.boolBtnTrueColor,
                    //             textString: 'L1',
                    //             borderColor: AppColors.reefBtnBorderColor,
                    //             onTap: () {
                    //               scoutingDataSetter
                    //                   .addTeleopPathPoint(TeleopPathPoint.l1Reef);
                    //             },
                    //           ),
                    //         ),
                    //         Spacer(),
                    //         Expanded(
                    //           flex: 14,
                    //           child: Column(
                    //             children: [
                    //               Expanded(
                    //                 flex: 5,
                    //                 child: ColorChangeInkwell(
                    //                   initialColor: AppColors.reefBtnColor,
                    //                   pressedColor: AppColors.boolBtnTrueColor,
                    //                   textString: 'L4',
                    //                   borderColor: AppColors.reefBtnBorderColor,
                    //                   onTap: () {
                    //                     scoutingDataSetter.addTeleopPathPoint(
                    //                         TeleopPathPoint.l4RightReef);
                    //                   },
                    //                 ),
                    //               ),
                    //               Spacer(),
                    //               Expanded(
                    //                 flex: 5,
                    //                 child: ColorChangeInkwell(
                    //                   initialColor: AppColors.reefBtnColor,
                    //                   pressedColor: AppColors.boolBtnTrueColor,
                    //                   textString: 'L3',
                    //                   borderColor: AppColors.reefBtnBorderColor,
                    //                   onTap: () {
                    //                     scoutingDataSetter.addTeleopPathPoint(
                    //                         TeleopPathPoint.l3RightReef);
                    //                   },
                    //                 ),
                    //               ),
                    //               Spacer(),
                    //               Expanded(
                    //                 flex: 5,
                    //                 child: ColorChangeInkwell(
                    //                   initialColor: AppColors.reefBtnColor,
                    //                   pressedColor: AppColors.boolBtnTrueColor,
                    //                   textString: 'L2',
                    //                   borderColor: AppColors.reefBtnBorderColor,
                    //                   onTap: () {
                    //                     scoutingDataSetter.addTeleopPathPoint(
                    //                         TeleopPathPoint.l2RightReef);
                    //                   },
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     )),
                  ])),
              Spacer(),
              Expanded(
                flex: 15,
                child: Column(children: [
                  Expanded(
                      flex: 8,
                      // child: StatelessHangTimer(),
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
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: TapBox(
                                borderWidth:
                                    context.select<ScoutingData, BargePosition>(
                                                (value) => value.teleopData
                                                    .bargePosition) ==
                                            BargePosition.left
                                        ? 4
                                        : 2,
                                color: AppColors.reefAreaColor,
                                onTap: () {
                                  scoutingDataSetter.updateTeleopData(
                                      bargePosition: BargePosition.left);
                                },
                                child: const TeleopWidgetText('Left'),
                              )),
                          Spacer(),
                          Expanded(
                            flex: 4,
                            child: TapBox(
                              borderWidth:
                                  context.select<ScoutingData, BargePosition>(
                                              (value) => value
                                                  .teleopData.bargePosition) ==
                                          BargePosition.center
                                      ? 4
                                      : 2,
                              color: AppColors.reefAreaColor,
                              onTap: () {
                                scoutingDataSetter.updateTeleopData(
                                    bargePosition: BargePosition.center);
                              },
                              child: const TeleopWidgetText('Center'),
                            ),
                          ),
                          Spacer(),
                          Expanded(
                              flex: 4,
                              child: TapBox(
                                borderWidth:
                                    context.select<ScoutingData, BargePosition>(
                                                (value) => value.teleopData
                                                    .bargePosition) ==
                                            BargePosition.right
                                        ? 4
                                        : 2,
                                color: AppColors.reefAreaColor,
                                onTap: () {
                                  scoutingDataSetter.updateTeleopData(
                                      bargePosition: BargePosition.right);
                                },
                                child: const TeleopWidgetText('Right'),
                              )),
                        ],
                      )),
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
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Color(0xFFFFFFFF),
                                  backgroundColor: Color(0xFF000000),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  logger.d("Undo");
                                  scoutingDataSetter.teleopData.undoPathPoint();
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
                                  logger.d("result");
                                  Navigator.pushNamed(context, '/result');
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
