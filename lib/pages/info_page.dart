import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scout_app_v0/model.dart';
import 'package:scout_app_v0/widgets/commit_confirm_dialog.dart';

import '../utils/logger.dart' show logger;
import '../widgets/tap_widgets.dart' show TapBox;
import '../constants.dart' show AppColors;
import '../widgets/text_widgets.dart';
import '../providers/scouting_data_provider.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // 用於表單的全局鍵
  // 用於保存 Scouter name、match number 和 team number 的控制器
  late TextEditingController _scouterNameController =
      TextEditingController(text: ScoutingData().scout);
  late TextEditingController _matchNumberController = TextEditingController(
      text: ScoutingData().matchNumber.toString());
  late TextEditingController _teamNumberController =
      TextEditingController(text: ScoutingData().teamNumber.toString());
  late MatchLevel matchLevel;
  late Alliance _selectedAlliance;

  @override
  void initState() {
    super.initState();
    final scoutingData =
        Provider.of<ScoutingData>(context, listen: false);

    // 初始化 TextEditingController 並設置初始值
    _scouterNameController = TextEditingController(text: scoutingData.scout);
    _matchNumberController =
        TextEditingController(text: scoutingData.matchNumber);
    _teamNumberController =
        TextEditingController(text: scoutingData.teamNumber);

    matchLevel = scoutingData.matchLevel;
    _selectedAlliance = scoutingData.alliance;

    // 監聽 TextEditingController 變更，並同步更新 Provider
    _scouterNameController.addListener(() {
      scoutingData.updateInfoData(scout: _scouterNameController.text);
    });

    _matchNumberController.addListener(() {
      scoutingData.updateInfoData(matchNumber: _matchNumberController.text);
    });

    _teamNumberController.addListener(() {
      scoutingData.updateInfoData(teamNumber: _teamNumberController.text);
    });
  }

  @override
  void dispose() {
    _scouterNameController.dispose();
    _matchNumberController.dispose();
    _teamNumberController.dispose();
    super.dispose();
  }

  bool _infoFieldsFilled() {
    if (_formKey.currentState?.validate() ?? false) {
      if (matchLevel == MatchLevel.unset) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a match level.')),
        );
        return false;
      }

      if (_selectedAlliance == Alliance.unset) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select an alliance.')),
        );
        return false;
      }

      // 更新 Provider 數據
      Provider.of<ScoutingData>(context, listen: false).updateInfoData(
        scout: _scouterNameController.text,
        matchNumber: _matchNumberController.text,
        teamNumber: _teamNumberController.text,
        matchLevel: matchLevel,
        alliance: _selectedAlliance,
        eventKey: 'NTWC',
      );
      return true;

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form.')),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scoutingData = Provider.of<ScoutingData>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Padding(
          padding: EdgeInsets.all(24.0), // 增加內邊距，確保內容不會緊貼螢幕邊緣
          child: Form(
            key: _formKey, // 設定表單的鍵
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 1),
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
                SubTitleText('Scouter Name:'),
                Spacer(flex: 2),
                TextFormField(
                  controller: _scouterNameController,
                  decoration: InputDecoration(
                    labelText: "Enter your name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    RegExp regex = RegExp(r'[^\u4E00-\u9FFF\u3400-\u4DBF\uF900-\uFAFF\u0041-\u005A\u0061-\u007A]');
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    } else if (regex.hasMatch(value)) {
                      return "Name isn't valid";
                    }
                    return null;
                  },
                ),
                Spacer(flex: 2),
                SubTitleText('Match Level:'),
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
                        child:
                        Text("Qualification", style: TextStyle(fontSize: 24)),
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
                SubTitleText('Match Number:'),
                Spacer(flex: 2),
                TextFormField(
                  maxLength: 2,
                  controller: _matchNumberController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: false),
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
                SubTitleText('Team Number: '),
                Spacer(flex: 2),
                TextFormField(
                  controller: _teamNumberController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: false),
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
                SubTitleText('Alliance: '),
                Row(
                  children: [
                    Spacer(flex: 2),
                    Expanded(
                      flex: 9,
                      child: TapBox(
                        onTap: () {
                          setState(() {
                            _selectedAlliance = Alliance.blue;
                          });
                        },
                        height: 100,
                        color: Colors.blue,
                        borderColor: (_selectedAlliance == Alliance.blue)
                            ? Colors.black
                            : Colors.lightBlueAccent,
                        borderWidth: 3,
                        borderRadius: 10,
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
                    Spacer(flex: 1),
                    Expanded(
                      flex: 9,
                      child: TapBox(
                        onTap: () {
                          setState(() {
                            _selectedAlliance = Alliance.red;
                          });
                        },
                        height: 100,
                        color: Colors.red,
                        borderColor: (_selectedAlliance == Alliance.red)
                            ? Colors.black
                            : Color(0xFFFF8989),
                        borderWidth: 3,
                        borderRadius: 10,
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
                    Spacer(flex: 2),
                  ],
                ),
                Spacer(flex: 5),
                Row(
                  children: [
                    Spacer(flex: 14,),
                    ElevatedButton(
                      onPressed: () {
                        if (_infoFieldsFilled()) {
                          showAlertDialog(
                            context,
                            title: 'Bypass',
                            content: 'Are you sure you want to bypass this match?',
                            onConfirm: () {
                              scoutingData.updateBypass(true);
                              Navigator.pushNamedAndRemoveUntil(context, '/result', (route) => false);
                            },
                            onCancel: () {
                              Navigator.pop(context);
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCF1B1B), // 設定按鈕顏色
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Bypass",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Spacer(flex: 1),
                    ElevatedButton(
                      onPressed: () {
                        if (_infoFieldsFilled()) {
                          Navigator.pushNamed(context, '/auto');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF46B6FF), // 設定按鈕顏色
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Game Start",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Spacer(flex: 2,),
                  ],
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
