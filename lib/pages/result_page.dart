import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../providers/scouting_data_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 獲取 ScoutingDataProvider 資料
    ScoutingDataProvider scoutingData =
        Provider.of<ScoutingDataProvider>(context);

    // 一次性將所有資料轉換為 JSON 字串
    // scoutingData.toJSON();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 使用 qr_flutter 生成 QR Code，傳遞 JSON 字串
              QrImageView(
                data: jsonEncode(scoutingData.toJSON()), // QR Code 的資料
                version: QrVersions.auto, // 自動設定版本
                size: 200.0, // QR Code 的大小
                backgroundColor: Colors.white, // 背景顏色
              ),
              Text(
                'Scan this QR Code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // 顯示 JSON 內容（方便測試）
              SelectableText(
                JsonEncoder.withIndent('  ').convert(scoutingData.toJSON()),
                style: TextStyle(fontSize: 24, color: Colors.black),
                // textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
