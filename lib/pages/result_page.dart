import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scout_app_v0/utils/qrcode_process.dart';
import 'package:scout_app_v0/widgets/commit_confirm_dialog.dart';
import '../providers/scouting_data_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 獲取 ScoutingDataProvider 資料
    ScoutingData scoutingData =
        Provider.of<ScoutingData>(context, listen: false);

    // 一次性將所有資料轉換為 JSON 字串
    // scoutingData.toJSON();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page', style: TextStyle(fontSize: 30)),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              children: [
                FutureBuilder(
                    future: QRStringProcessor.init(
                        'assets/schema/objective_data_QRcode_schema.yaml'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        final qrStringProcessor =
                            snapshot.data as QRStringProcessor;
                        return QrImageView(
                          data: 'objective_data|${qrStringProcessor.encodeQRObject(
                              scoutingData.toJSON())}', // QR Code 的資料
                          version: QrVersions.auto, // 自動設定版本
                          size: min(constraints.maxHeight,
                              constraints.maxWidth), // QR Code 的大小
                          backgroundColor: Colors.white, // 背景顏色
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                // Spacer(),
                Expanded(
                    child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          // Text(
                          //     'Hang Type: ${scoutingData.teleopData.bargeResult.name}',
                          //     style: TextStyle(fontSize: 25)),
                        ],
                      ),
                    ),
                    // Spacer(),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          showAlertDialog(
                            context,
                            title: 'New Match Confirm',
                            content: 'Are you sure want to start a new match?\nAll data will be reset.',
                            confirmText: 'Start New Match',
                            cancelText: 'Cancel',
                            onConfirm: () {
                              scoutingData.reset();
                              Navigator.pushNamed(context, '/info');
                            },
                            onCancel: () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        child:
                            Text("New Match", style: TextStyle(fontSize: 30)),
                      ),
                    ),
                    Spacer(),
                  ],
                ))
              ],
            );
          })),
    );
  }
}
