import 'package:flutter/material.dart';
import '../widgets/tap_widgets.dart';
import '../widgets/text_widgets.dart';
import '../utils/logger.dart' show logger;

class StatelessHangTimer extends StatelessWidget {
  const StatelessHangTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
// flex: 5,
                    child: Column(
                  children: [
                    Expanded(
                        flex: 8,
                        child: TapBox(
                          color: Color(0x66303E9B),
                          borderColor: Color(0xFF303E9B),
                          child: const TeleopWidgetText('Shallow'),
                        )),
                    Spacer(),
                    Expanded(
                        flex: 8,
                        child: TapBox(
                          color: Color(0x66303E9B),
                          borderColor: Color(0xFF303E9B),
                          child: const TeleopWidgetText('Deep'),
                        )),
                  ],
                )),
                Expanded(
// flex: 5,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '00:00',
                      style: TextStyle(
                        fontSize: 60,
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFFFFFFFF),
                          backgroundColor: Color(0xFFFF0000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          logger.d("Reset Timer");
                        },
                        child: Text("Reset", style: TextStyle(fontSize: 30))),
                  ],
                )),
                Expanded(
// flex: 5,
                    child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          flex: 7,
                          child: FractionallySizedBox(
                            heightFactor: 0.7,
                            widthFactor: 0.8,
                            child: TapBox(
                              child: const TeleopWidgetText('Success'),
                            ),
                          )),
                      Spacer(),
                      Expanded(
                          flex: 7,
                          child: FractionallySizedBox(
                            heightFactor: 0.7,
                            widthFactor: 0.8,
                            child: TapBox(
                              child: const TeleopWidgetText('Fail'),
                            ),
                          )),
                    ],
                  ),
                )),
              ],
            )),
      ],
    );
  }
}
