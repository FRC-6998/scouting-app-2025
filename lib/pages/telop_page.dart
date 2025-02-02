import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scout_app_v0/constants.dart';
import 'package:scout_app_v0/model.dart';

import 'package:scout_app_v0/widgets/field_widgets.dart';
import '../providers/scouting_data_provider.dart';
import '../utils/logger.dart';
import '../widgets/text_widgets.dart';

class TeleopPage extends StatefulWidget {
  const TeleopPage({super.key});

  @override
  _TeleopPageState createState() => _TeleopPageState();
}
class _TeleopPageState extends State<TeleopPage> {
  Color _buttonColor = Colors.red;


  @override
  Widget build(BuildContext context) {
    ScoutingDataProvider scoutingData = Provider.of<ScoutingDataProvider>(context);

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('telop Page'),
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
                              child: ColorChangeInkwell(
                                initialColor: AppColors.sourceAreaColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                borderColor: AppColors.sourceBorderColor,// 點擊時顏色
                                textString: 'Left Coral Station',
                                onTap: () {
                                  scoutingData.addTelopPathPoint(TelopPathPoint.leftCoralStation);
                                },
                              )),
                            Spacer(),
                            Expanded(
                              flex: 14,
                              child: ColorChangeInkwell(
                                initialColor: AppColors.sourceAreaColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                borderColor: AppColors.sourceBorderColor,// 點擊時顏色
                                textString: 'Right Coral Station',
                                onTap: () {
                                  scoutingData.addTelopPathPoint(TelopPathPoint.rightCoralStation);
                                },
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
                              child: ColorChangeInkwell(
                                initialColor: AppColors.sourceAreaColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                borderColor: AppColors.sourceBorderColor,// 點擊時顏色
                                textString: 'Ground Algae',
                                onTap: () {
                                  scoutingData.addTelopPathPoint(TelopPathPoint.groundAlgae);
                                },
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 14,
                              child: ColorChangeInkwell(
                                initialColor: AppColors.sourceAreaColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                borderColor: AppColors.sourceBorderColor,// 點擊時顏色
                                textString: 'Ground Coral',
                                onTap: () {
                                  scoutingData.addTelopPathPoint(TelopPathPoint.groundCoral);
                                },
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
                              child: ColorChangeInkwell(
                                initialColor: AppColors.scoreAreaColor,
                                pressedColor: AppColors.boolBtnTrueColor, // 點擊時顏色
                                textString: 'Processor',
                                borderColor: AppColors.scoreBorderColor,
                                onTap: () {
                                  scoutingData.addTelopPathPoint(TelopPathPoint.processor);
                                },
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 14,
                              child: ColorChangeInkwell(
                                initialColor: AppColors.scoreAreaColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                borderColor: AppColors.scoreBorderColor,// 點擊時顏色
                                textString: 'Net',
                                onTap: () {
                                  scoutingData.addTelopPathPoint(TelopPathPoint.net);
                                },
                              )),
                          ],
                        )),
                    Spacer(),
                    Expanded(
                        flex: 17,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 14,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: ColorChangeInkwell(
                                      initialColor: AppColors.reefBtnColor,
                                      pressedColor: AppColors.boolBtnTrueColor,
                                      textString: 'L4',
                                      borderColor: AppColors.reefBtnBorderColor,
                                      onTap: () {
                                        scoutingData.addTelopPathPoint(TelopPathPoint.l4LeftReef);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 5,
                                    child: ColorChangeInkwell(
                                      initialColor: AppColors.reefBtnColor,
                                      pressedColor: AppColors.boolBtnTrueColor,
                                      textString: 'L3',
                                      borderColor: AppColors.reefBtnBorderColor,
                                      onTap: () {
                                        scoutingData.addTelopPathPoint(TelopPathPoint.l3LeftReef);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 5,
                                    child: ColorChangeInkwell(
                                      initialColor: AppColors.reefBtnColor,
                                      pressedColor: AppColors.boolBtnTrueColor,
                                      textString: 'L2',
                                      borderColor: AppColors.reefBtnBorderColor,
                                      onTap: () {
                                        scoutingData.addTelopPathPoint(TelopPathPoint.l2LeftReef);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 14,
                              child: ColorChangeInkwell(
                                initialColor: AppColors.reefBtnColor,
                                pressedColor: AppColors.boolBtnTrueColor,
                                textString: 'L1',
                                borderColor: AppColors.reefBtnBorderColor,
                                onTap: () {
                                  scoutingData.addTelopPathPoint(TelopPathPoint.l1Reef);
                                },
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 14,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: ColorChangeInkwell(
                                      initialColor: AppColors.reefBtnColor,
                                      pressedColor: AppColors.boolBtnTrueColor,
                                      textString: 'L4',
                                      borderColor: AppColors.reefBtnBorderColor,
                                      onTap: () {
                                        scoutingData.addTelopPathPoint(TelopPathPoint.l4RightReef);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 5,
                                    child: ColorChangeInkwell(
                                      initialColor: AppColors.reefBtnColor,
                                      pressedColor: AppColors.boolBtnTrueColor,
                                      textString: 'L3',
                                      borderColor: AppColors.reefBtnBorderColor,
                                      onTap: () {
                                        scoutingData.addTelopPathPoint(TelopPathPoint.l3RightReef);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 5,
                                    child: ColorChangeInkwell(
                                      initialColor: AppColors.reefBtnColor,
                                      pressedColor: AppColors.boolBtnTrueColor,
                                      textString: 'L2',
                                      borderColor: AppColors.reefBtnBorderColor,
                                      onTap: () {
                                        scoutingData.addTelopPathPoint(TelopPathPoint.l2RightReef);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ])),
              Spacer(),
              Expanded(
                flex: 15,
                child: Column(children: [
                  Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          Expanded(
                              flex:4,
                              child: InkwellContainer(

                              ))
                        ],
                      )

                  ),
                  Spacer(),
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Selector<ScoutingDataProvider, BargePosition>(
                              selector: (context, scoutingData) => scoutingData.telopData.bargePosition,
                              builder: (context, bargePosition, child) {
                                return InkwellContainer(
                                  borderWidth: bargePosition == BargePosition.left ? 4 : 0,
                                  child: const TeleopWidgetText('Left'),
                                  color: AppColors.reefAreaColor,
                                  onTap: () {
                                    scoutingData.updateTelopData(bargePosition: BargePosition.left);
                                  },
                                );
                              },
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 4,
                            child: Selector<ScoutingDataProvider, BargePosition>(
                              selector: (context, scoutingData) => scoutingData.telopData.bargePosition,
                              builder: (context, bargePosition, child) {
                                return InkwellContainer(
                                  borderWidth: bargePosition == BargePosition.center ? 4 : 0,
                                  child: const TeleopWidgetText('Center'),
                                  color: AppColors.reefAreaColor,
                                  onTap: () {
                                    scoutingData.updateTelopData(bargePosition: BargePosition.center);
                                  },
                                );
                              },
                            ),
                          ),
                          Spacer(),
                          Expanded(
                              flex: 4,
                              child: Selector<ScoutingDataProvider, BargePosition>(
                                selector: (context, scoutingData) => scoutingData.telopData.bargePosition,
                                builder: (context, bargePosition, child) {
                                  return InkwellContainer(
                                        borderWidth: bargePosition == BargePosition.right ? 4 : 0,
                                        child: const TeleopWidgetText('Right'),
                                        color: AppColors.reefAreaColor,
                                        onTap: () {
                                          scoutingData.updateTelopData(bargePosition: BargePosition.right);
                                        },
                                      );
                                },
                              ),
                          ),
                        ],
                      )),
                  Spacer(),
                  Expanded(
                      flex: 4,
                      child: InkwellContainer(
                        borderWidth: scoutingData.telopData.bargeAction == BargeAction.park ? 4 : 0,
                        child: const TeleopWidgetText('Park'),
                        color: AppColors.reefAreaColor,
                        onTap: () {
                          scoutingData.updateTelopData(bargeAction: BargeAction.park);
                          // scoutingData.addScore('telop', 'highGoal', 1);
                        },
                      )),
                  Spacer(),
                  Expanded(
                      flex: 4,
                      child: InkwellContainer(
                        borderWidth: scoutingData.telopData.bargeAction == BargeAction.none ? 4 : 0,
                        child: const TeleopWidgetText('None'),
                        color: AppColors.reefAreaColor,
                        onTap: () {
                          scoutingData.updateTelopData(bargeAction: BargeAction.none);
                        },
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
                                child: Text("QRcode",
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
