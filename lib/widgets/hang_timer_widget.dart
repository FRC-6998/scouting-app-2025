import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../utils/logger.dart' show logger;
import '../widgets/tap_widgets.dart' show TapBox;
import '../widgets/text_widgets.dart';
import '../model.dart';

class HangTimer extends StatefulWidget {
  final Function(BargeAction bargeAction, bool success, int hangTime)? onEnd;
  final Function(BargeAction bargeAction)? onStart;
  final VoidCallback? onReset;

  const HangTimer({this.onEnd, this.onStart, this.onReset, super.key});

  @override
  State<HangTimer> createState() => _HangTimerState();
}

class _HangTimerState extends State<HangTimer>
    with SingleTickerProviderStateMixin {
  Ticker? _ticker;
  int _milliseconds = 0;
  bool _isRunning = false;
  BargeAction _bargeAction = BargeAction.unset; // "Shallow" or "Deep"

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {
        _milliseconds = elapsed.inMilliseconds;
      });
    });
  }

  void _startTimer(BargeAction bargeAction) {
    logger.d("startTimer, $_isRunning");
    if (_isRunning) return;

    setState(() {
      _bargeAction = bargeAction;
      _isRunning = true;
      _milliseconds = 0; // Reset the timer
    });

    _ticker?.start();
    widget.onStart?.call(_bargeAction);
  }

  void _stopTimer(bool success) {
    _ticker?.stop();
    setState(() {
      _isRunning = false;
    });

    widget.onEnd
        ?.call(_bargeAction, success, _milliseconds); // Call timeEnd callback
  }

  void _resetTimer() {
    _ticker?.stop();
    setState(() {
      _milliseconds = 0;
      _isRunning = false;
      _bargeAction = BargeAction.unset;
    });
    widget.onReset?.call();
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Shallow / Deep Buttons
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TapBox(
                        color: Color(0x66303E9B),
                        borderColor: Color(0xFF303E9B),
                        onTap: _milliseconds == 0
                            ? () => _startTimer(BargeAction.shallow)
                            : null,
                        child: const TeleopWidgetText('Shallow'),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 8,
                      child: TapBox(
                        color: Color(0x66303E9B),
                        borderColor: Color(0xFF303E9B),
                        onTap: _milliseconds == 0
                            ? () => _startTimer(BargeAction.deep)
                            : null,
                        child: const TeleopWidgetText('Deep'),
                      ),
                    ),
                  ],
                ),
              ),
              // Timer Display and Reset Button
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (_milliseconds / 1000).toStringAsFixed(2),
                      style: TextStyle(fontSize: 60),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFFFFFFFF),
                        backgroundColor: Color(0xFFFF0000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: _resetTimer,
                      child: Text(
                        "Reset",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              // Success / Fail Buttons
              Expanded(
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
                              onTap: _isRunning ? () => _stopTimer(true) : null,
                              child: const TeleopWidgetText('Success')),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 7,
                        child: FractionallySizedBox(
                          heightFactor: 0.7,
                          widthFactor: 0.8,
                          child: TapBox(
                            onTap: _isRunning ? () => _stopTimer(false) : null,
                            child: const TeleopWidgetText('Fail'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//
// class _HangTimerState extends State<HangTimer> {
//   int _seconds = 0;
//   Timer? _timer;
//   bool _isRunning = false;
//   BargeAction _bargeAction = BargeAction.none; // "Shallow" or "Deep"
//   DateTime _startTime = DateTime.now();
//
//   void _startTimer(BargeAction bargeAction) {
//     if (_isRunning) return;
//
//     setState(() {
//       _bargeAction = bargeAction;
//       _isRunning = true;
//       _seconds = 0; // Reset the timer
//       _startTime = DateTime.now();
//     });
//
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         _seconds++;
//       });
//     });
//   }
//
//   void _stopTimer(bool success) {
//     _timer?.cancel();
//     setState(() {
//       _isRunning = false;
//     });
//
//     widget.timeEnd(_bargeAction, success, DateTime.now().difference(_startTime).inMilliseconds); // Call timeEnd callback
//   }
//
//   void _resetTimer() {
//     _timer?.cancel();
//     setState(() {
//       _seconds = 0;
//       _isRunning = false;
//       _bargeAction = BargeAction.none;
//       _startTime = DateTime.now();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Shallow / Deep Buttons
//         Expanded(
//           flex: 4,
//           child: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     Expanded(
//                       flex: 8,
//                       child: TapBox(
//                         color: Color(0x66303E9B),
//                         borderColor: Color(0xFF303E9B),
//                         child: GestureDetector(
//                           onTap: _isRunning ? null : () => _startTimer(BargeAction.shallow),
//                           child: const TeleopWidgetText('Shallow'),
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Expanded(
//                       flex: 8,
//                       child: TapBox(
//                         color: Color(0x66303E9B),
//                         borderColor: Color(0xFF303E9B),
//                         child: GestureDetector(
//                           onTap: _isRunning ? null : () => _startTimer(BargeAction.deep),
//                           child: const TeleopWidgetText('Deep'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Timer Display and Reset Button
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       '$_seconds',
//                       style: TextStyle(fontSize: 60),
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Color(0xFFFFFFFF),
//                         backgroundColor: Color(0xFFFF0000),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                       onPressed: _resetTimer,
//                       child: Text(
//                         "Reset",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Success / Fail Buttons
//               Expanded(
//                 child: FractionallySizedBox(
//                   widthFactor: 0.9,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Expanded(
//                         flex: 7,
//                         child: FractionallySizedBox(
//                           heightFactor: 0.7,
//                           widthFactor: 0.8,
//                           child: TapBox(
//                             child: GestureDetector(
//                               onTap: _isRunning ? () => _stopTimer(true) : null,
//                               child: const TeleopWidgetText('Success'),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Spacer(),
//                       Expanded(
//                         flex: 7,
//                         child: FractionallySizedBox(
//                           heightFactor: 0.7,
//                           widthFactor: 0.8,
//                           child: TapBox(
//                             child: GestureDetector(
//                               onTap: _isRunning ? () => _stopTimer(false) : null,
//                               child: const TeleopWidgetText('Fail'),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
