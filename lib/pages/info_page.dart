import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scout_app_v0/model.dart';

import '../utils/logger.dart' show logger;
import '../widgets/field_widgets.dart' show InkwellContainer, TriangleWidget;
import '../constants.dart';
import '../providers/scouting_data_provider.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // 用於表單的全局鍵
  // 用於保存 Scouter name、match number 和 team number 的控制器
  final TextEditingController _scouterNameController = TextEditingController();
  final TextEditingController _matchNumberController = TextEditingController();
  final TextEditingController _teamNumberController = TextEditingController();
  MatchLevel matchLevel = MatchLevel.unset;

  // 用於存儲當前選擇的 Alliance
  Alliance _selectedAlliance = Alliance.unset;

  void _toAutoPage() {
    if (_formKey.currentState?.validate() ?? false) {
      // 驗證 MatchLevel 和 Alliance
      if (matchLevel == MatchLevel.unset) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a match level.')),
        );
        return; // 如果 MatchLevel 未選擇，則停止執行
      }

      if (_selectedAlliance == Alliance.unset) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select an alliance.')),
        );
        return; // 如果 Alliance 未選擇，則停止執行
      }

      // 如果一切驗證通過，更新 ScoutingDataProvider
      Provider.of<ScoutingDataProvider>(context, listen: false)
          .updateMatchInfo(
          scout: _scouterNameController.text,
          matchNumber: int.parse(_matchNumberController.text),
          teamNumber: int.parse(_teamNumberController.text),
          matchLevel: matchLevel,
          alliance: _selectedAlliance,
          eventKey: 'NTWC'
      );

      // 跳轉至自動駕駛頁面或其他頁面
      Navigator.pushNamed(context, '/auto');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please correct the errors in the form.')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0), // 增加內邊距，確保內容不會緊貼螢幕邊緣
        child: Form(
          key: _formKey, // 設定表單的鍵
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 2),
              Text(
                '2025 Taiwan Regional Scouting Match Info.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.reefBorderColor,
                ),
              ),
              Spacer(flex: 3),
              Text(
                'Scouter Name:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Spacer(flex: 2),
              TextFormField(
                controller: _scouterNameController,
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value) &&
                      !RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                    return "Name isn't valid";
                  }
                  return null;
                },
              ),
              Spacer(flex: 2),
              Text(
                'Match Info:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Spacer(flex: 2), // 左邊間距
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: matchLevel == MatchLevel.practice
                            ? Color(0xFFFFB954) // 設定選中時字體顏色
                            : Colors.white, // 未選中時字體顏色
                        backgroundColor: Color(0xFF0051FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          matchLevel = MatchLevel.practice;
                        });
                        logger.d("Practice");
                      },
                      child: Text("Practice", style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  Spacer(flex: 1), // 增加適當的間距
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: matchLevel == MatchLevel.qualification
                            ? Color(0xFFFFB954) // 設定選中時字體顏色
                            : Colors.white, // 未選中時字體顏色
                        backgroundColor: Color(0xFF0051FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          matchLevel = MatchLevel.qualification;
                        });
                        logger.d("Qualification");
                      },
                      child: Text("Qualification", style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  Spacer(flex: 1), // 增加適當的間距
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: matchLevel == MatchLevel.playoff
                            ? Color(0xFFFFB954) // 設定選中時字體顏色
                            : Colors.white, // 未選中時字體顏色
                        backgroundColor: Color(0xFF0051FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          matchLevel = MatchLevel.playoff;
                        });
                        logger.d("Playoff");
                      },
                      child: Text("Playoff", style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  Spacer(flex: 2), // 右邊間距
                ],
              ),
              Spacer(flex: 3),
              Text(
                'Match Number:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),


              Spacer(flex: 2),
              TextFormField(
                controller: _matchNumberController,
                keyboardType: TextInputType.numberWithOptions(signed:true,decimal: false),
                decoration: InputDecoration(
                  labelText: "Enter match number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid integer';
                  }
                  return null;
                },
              ),
              Spacer(flex: 4),
              Text(
                'Team Number:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Spacer(flex: 2),
              TextFormField(
                controller: _teamNumberController,
                keyboardType: TextInputType.numberWithOptions(signed:true,decimal: false),
                decoration: InputDecoration(
                  labelText: "Enter team number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter team number";
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Team number isn't valid";
                  }
                  return null;
                },
              ),
              Spacer(flex: 4),
              Text(
                'Alliance:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Spacer(flex: 2),
                  Expanded(
                    flex: 9,
                    child: InkwellContainer(
                      onTap: () {
                        setState(() {
                          _selectedAlliance = Alliance.blue;
                        });
                      },
                      height: 100,
                      color: Colors.blue,
                      borderColor: (_selectedAlliance == Alliance.blue)
                          ?Colors.black
                          :Colors.lightBlueAccent,
                      borderWidth: 3,
                      borderRadius: 10,
                      child: Center(
                        child: Text(
                          'Blue Alliance',
                          style: TextStyle(
                            fontSize: 30,
                            color: (_selectedAlliance == Alliance.blue)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 9,
                    child: InkwellContainer(
                      onTap: () {
                        setState(() {
                          _selectedAlliance = Alliance.red;
                        });
                      },
                      height: 100,
                      color: Colors.red,
                      borderColor: (_selectedAlliance == Alliance.red)
                          ?Colors.black
                          :Color(0xFFFF8989),
                      borderWidth: 3,
                      borderRadius: 10,
                      child: Center(
                        child: Text(
                          'Red Alliance',
                          style: TextStyle(
                            fontSize: 30,
                            color: (_selectedAlliance == Alliance.red)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
              Spacer(flex: 4),
              Row(
                children: [
                  Spacer(flex: 10),
                  ElevatedButton(
                    onPressed: _toAutoPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0051FF), // 設定按鈕顏色
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Game Start",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
