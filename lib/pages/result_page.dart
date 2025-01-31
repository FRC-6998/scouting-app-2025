import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/scouting_data_provider.dart';


class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScoutingDataProvider scoutingData = Provider.of<ScoutingDataProvider>(context);
    context.watch<ScoutingDataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                // scoutingData.toJSON().toString(),
                JsonEncoder.withIndent('  ').convert(scoutingData.toJSON()),
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}