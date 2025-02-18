import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:scout_app_v0/constants.dart';
import 'package:scout_app_v0/widgets/commit_confirm_dialog.dart';
import 'package:scout_app_v0/providers/scouting_data_provider.dart';
import 'package:scout_app_v0/widgets/tap_widgets.dart';

class CommentAndConfirmPage extends StatelessWidget {
  const CommentAndConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScoutingData scoutingData =
        Provider.of<ScoutingData>(context, listen: false);

    TextEditingController commentController =
        TextEditingController(text: scoutingData.comment);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comment and Confirm Page',
              style: TextStyle(fontSize: 30)),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Expanded(
              //   flex: 1,
              //     child:
              // Spacer(),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Comment:', style: TextStyle(fontSize: 25))),
              // ),
              Spacer(),
              Expanded(
                flex: 26,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 22,
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        style: const TextStyle(fontSize: 25),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: 'Please enter your comment here',
                        ),
                        controller: commentController,
                        onChanged: (text) {
                          scoutingData.updateComment(text);
                        },
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 18,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Scout: ${scoutingData.scout}',
                              style: TextStyle(fontSize: 25)),
                          Text('Event Key: ${scoutingData.eventKey}',
                              style: TextStyle(fontSize: 25)),
                          Text('Match Level: ${scoutingData.matchLevel.name}',
                              style: TextStyle(fontSize: 25)),
                          Text('Match Number: ${scoutingData.matchNumber}',
                              style: TextStyle(fontSize: 25)),
                          Text('Alliance: ${scoutingData.alliance.name}',
                              style: TextStyle(fontSize: 25)),
                          Text('Team Number: ${scoutingData.teamNumber}',
                              style: TextStyle(fontSize: 25)),
                          Text(
                              'Hang Type: ${scoutingData.teleopData.bargeResult.name}',
                              style: TextStyle(fontSize: 25)),
                          TapBox(
                            color: context.select<ScoutingData, bool>(
                                    (scoutingData) => scoutingData.disabled)
                                ? AppColors.boolBtnFalseColor
                                : AppColors.boolBtnTrueBorderColor,
                            child:
                                Text('DISABLE', style: TextStyle(fontSize: 30)),
                            onTap: () {
                              scoutingData
                                  .updateDisabled(!scoutingData.disabled);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacer(),
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFFFFFFFF),
                              backgroundColor: Color(0xFF303E9B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              // logger.d("Back");
                              // Navigator.pop(context);
                              Navigator.pushNamed(context, '/teleop');
                            },
                            child:
                                Text("Telop", style: TextStyle(fontSize: 30))),
                      ),
                      Spacer(flex: 2),
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFFFFFFFF),
                              backgroundColor: Color(0xFF303E9B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              // logger.d("comment");
                              // Navigator.pushNamed(context, '/result');
                              showCommitConfirmDialog(context);
                            },
                            child: Text("Confirm",
                                style: TextStyle(fontSize: 30))),
                      ),
                      Spacer(),
                    ],
                  )),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ));
  }
}
