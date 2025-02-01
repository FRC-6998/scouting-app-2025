import 'package:flutter/material.dart';

import '../utils/logger.dart' show logger;
import '../widgets/field_widgets.dart' show InkwellContainer, TriangleWidget;
import '../constants.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0), // 增加內邊距，確保內容不會緊貼螢幕邊緣
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // **讓內容靠左對齊**
          children: [
            Spacer(flex:2), // **頂部間距**
            Text(
              '2025 Taiwan Regional Scouting Match Info.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.reefBorderColor,
              ),
            ),
            Spacer(flex:4), // **增加適當的間距**
            Text(
              'Scouter Name:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Spacer(flex:2), // **Text 與 TextFormField 之間的距離**
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(), // **輸入框邊框**
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your name";
                } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value) ||
                    !RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                  return "Name isn't valid";
                }
                return null;
              },
            ),
            Spacer(flex:2),
            Text(
              'Match Info:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Spacer(flex:2), // **增加適當的間距**
            Row(
              children: [
                Spacer(flex:2), // **左邊間距**
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFFFFB954),
                        backgroundColor: Color(0xFF0051FF),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              20 ),
                        ),
                      ),
                      onPressed: () {
                        logger.d("Practice");
                        // Navigator.pushNamed(context, '/teleop');
                        //Navigator.pushNamed(context, 'auto');
                      },
                      child: Text("Practice",
                          style: TextStyle(
                              fontSize: 20))),
                ),
                Spacer(flex: 1), // **增加適當的間距**
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFFFFB954),
                        backgroundColor: Color(0xFF0051FF),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              20 ),
                        ),
                      ),
                      onPressed: () {
                        logger.d("Qualification");
                        // Navigator.pushNamed(context, '/teleop');
                        //Navigator.pushNamed(context, 'auto');
                      },
                      child: Text("Qualification",
                          style: TextStyle(
                              fontSize: 20))),
                ),
                Spacer(flex: 1), // **增加適當的間距**
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFFF7FF00),
                        backgroundColor: Color(0xFF0051FF),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              20 ),
                        ),
                      ),
                      onPressed: () {
                        logger.d("Playoff");
                        // Navigator.pushNamed(context, '/teleop');
                        //Navigator.pushNamed(context, 'auto');
                      },
                      child: Text("Playoff",
                          style: TextStyle(
                              fontSize: 20))),
                ),
                Spacer(flex:2), // **右邊間距**
              ],
            ),
            Spacer(flex:2), // **增加適當的間距**
            Text(
              'Match Number:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Spacer(flex:2), // **Text 與 TextFormField 之間的距離**
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter match number",
                border: OutlineInputBorder(), // **輸入框邊框**
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter match number";
                } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return "Match number isn't valid";
                }
                return null;
              },
            ),
            Spacer(flex:2), // **增加適當的間距**
            Text(
              'Team Number:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Spacer(flex:2), // **Text 與 TextFormField 之間的距離**
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter team number",
                border: OutlineInputBorder(), // **輸入框邊框**
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter match number";
                } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return "Match number isn't valid";
                }
                return null;
              },
            ),
            Spacer(flex:4), // **增加適當的間距**
            Text(
              'Alliance:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Spacer(flex:2), // **左邊間距**
                Expanded(
                    flex: 9,
                    child: InkwellContainer(
                      height: 100,
                      color: Colors.blue,
                      borderColor:
                      Colors.lightBlueAccent,
                      borderWidth: 3,
                      borderRadius:
                      10,
                      child: Center(
                        child: Text(
                          'Blue Alliance',
                          style: TextStyle(
                            fontSize: 24 ,
                          ),
                        ),
                      ),
                    )),
                Spacer(flex: 1), // **增加適當的間距**
                Expanded(
                    flex: 9,
                    child: InkwellContainer(
                      height: 100,
                      color: Colors.red,
                      borderColor:
                      Colors.redAccent,
                      borderWidth: 3,
                      borderRadius:
                      10,
                      child: Center(
                        child: Text(
                          'Red Alliance',
                          style: TextStyle(
                            fontSize: 24 ,
                          ),
                        ),
                      ),
                    )),
                Spacer(flex: 2), // **增加適當的間距**
              ],
            ),
            Spacer(flex:90), // **增加適當的間距**
          ],
        ),
      ),
    );
  }
}
