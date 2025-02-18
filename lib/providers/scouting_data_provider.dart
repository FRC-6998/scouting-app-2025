import 'package:flutter/material.dart';
import 'package:ulid/ulid.dart';
import '../utils/logger.dart' show logger;
import '../model.dart';


class AutoData {
  Preload preload;
  AutoStartPosition startPosition;
  bool leave;
  List<Map<String,Object>> path = [];
  DateTime _pathStartTime = DateTime.now();
  bool pathPointIsSuccess = true;
  int selectedReefSide = 0;

  AutoData({
    this.preload = Preload.unset,
    this.startPosition = AutoStartPosition.unset,
    this.leave = false,
    // this.path,
  });

  bool allFieldsFilled () {
    return preload != Preload.unset && startPosition != AutoStartPosition.unset && path.isNotEmpty;
  }

  void addPathPoint(AutoPathPoint point) {
    if (path.isEmpty) {
      _pathStartTime = DateTime.now();
    }
    path.add({
      "timestamp": DateTime.now().difference(_pathStartTime).inMilliseconds,
      "point": point.name,
      "success": pathPointIsSuccess,
    });
    pathPointIsSuccess = true;
  }

  void undoPathPoint() {
    if (path.isNotEmpty) {
      path.removeLast();
    }
  }

  Map<String, dynamic>toJSON() {
    return {
      'preload': preload.name,
      'start_position': startPosition.name,
      'leave': leave,
      'path': path,
    };
  }
}

class TeleopData {
  num hangTime;
  BargeAction bargeTried;
  BargeAction bargeResult;
  BargePosition bargePosition;

  List<Map<String,Object>> path = [];
  DateTime _pathStartTime = DateTime.now();

  TeleopData({
    this.hangTime = 0,
    this.bargeTried = BargeAction.unset,
    this.bargeResult = BargeAction.unset,
    this.bargePosition = BargePosition.none,
  });

  bool allFieldsFilled() {
    return bargeResult != BargeAction.unset && path.isNotEmpty;
  }

  void addPathPoint(TeleopPathPoint point) {
    if (path.isEmpty) {
      _pathStartTime = DateTime.now();
    }
    path.add({"point": point.name, "timestamp": DateTime.now().difference(_pathStartTime).inMilliseconds});
  }

  void undoPathPoint() {
    if (path.isNotEmpty) {
      path.removeLast();
    }
  }

  Map<String, dynamic>toJSON() {
    return {
      'path': path,
      'hang_time': hangTime,
      'barge_tried': bargeTried.name,
      'barge_result': bargeResult.name,
      'barge_position': bargePosition.name,
    };
  }
}


class ScoutingData extends ChangeNotifier {
  // This is the data that will be shared across the app
  // and can be accessed by any widget that listens to this provider
  String _ulid = '';
  String _scout = '';
  MatchLevel _matchLevel = MatchLevel.unset;
  String _matchNumber = '';
  String _eventKey = 'TestEvent';
  String _teamNumber = '';
  Alliance _alliance = Alliance.unset;
  bool _bypass = false;
  bool _disabled = false;
  String _comment = '';

  String get scout => _scout;
  MatchLevel get matchLevel => _matchLevel;
  String get matchNumber => _matchNumber;
  String get eventKey => _eventKey;
  String get teamNumber => _teamNumber;
  Alliance get alliance => _alliance;
  bool get bypass => _bypass;
  bool get disabled => _disabled;
  String get comment => _comment;

 final AutoData _autoData = AutoData();
 final TeleopData _teleopData = TeleopData();

  AutoData get autoData => _autoData;

  TeleopData get teleopData => _teleopData;


  void reset() {
    _ulid = '';
    _scout = '';
    _matchLevel = MatchLevel.unset;
    _matchNumber = '';
    _eventKey = '2025NNKIEMock';
    _teamNumber = '';
    _alliance = Alliance.unset;
    _bypass = false;
    _disabled = false;
    _comment = '';
    _autoData.preload = Preload.unset;
    _autoData.startPosition = AutoStartPosition.unset;
    _autoData.leave = false;
    _autoData.path = [];
    _autoData.pathPointIsSuccess = true;
    _autoData.selectedReefSide = 0;
    _teleopData.hangTime = 0;
    _teleopData.bargeTried = BargeAction.unset;
    _teleopData.bargeResult = BargeAction.unset;
    _teleopData.bargePosition = BargePosition.none;
    _teleopData.path = [];
    notifyListeners();
  }

  bool infoFieldsFilled() {
    return _scout.isNotEmpty && _matchLevel != MatchLevel.unset && _matchNumber.isNotEmpty && _eventKey.isNotEmpty && _teamNumber.isNotEmpty && _alliance != Alliance.unset;
  }

  void updateInfoData({
    String? scout,
    MatchLevel? matchLevel,
    String? matchNumber,
    String? eventKey,
    String? teamNumber,
    Alliance? alliance,
  }) {
    _scout = scout ?? _scout;
    _matchLevel = matchLevel ?? _matchLevel;
    _matchNumber = matchNumber ?? _matchNumber;
    _eventKey = eventKey ?? _eventKey;
    _teamNumber = teamNumber ?? _teamNumber;
    _alliance = alliance ?? _alliance;
    notifyListeners();
  }

  void updateBypass(bool value) {
    _bypass = value;
    notifyListeners();
  }

  void updateDisabled(bool value) {
    _disabled = value;
    notifyListeners();
  }

  void updateAutoData({Preload? preload,
      AutoStartPosition? startPosition,
      bool? leave,}) {
    _autoData.preload = preload ?? _autoData.preload;
    _autoData.startPosition = startPosition ?? _autoData.startPosition;
    _autoData.leave = leave ?? _autoData.leave;
    notifyListeners();
  }

  void changeAutoPathPointStatus(bool value) {
    _autoData.pathPointIsSuccess = value;
    notifyListeners();
  }

  void changeSelectedReefSide(int value) {
    _autoData.selectedReefSide = value;
    notifyListeners();
  }

  void addAutoPathPoint(AutoPathPoint point )  {
    logger.d('Adding auto point: $point');
    _autoData.addPathPoint(point);
    notifyListeners();
  }


  void updateTeleopData({
    num? hangTime,
    BargeAction? bargeTried,
    BargeAction? bargeResult,
    BargePosition? bargePosition,
  }) {
    _teleopData.hangTime = hangTime ?? _teleopData.hangTime;
    _teleopData.bargeTried = bargeTried ?? _teleopData.bargeTried;
    _teleopData.bargeResult = bargeResult ?? _teleopData.bargeResult;
    _teleopData.bargePosition = bargePosition ?? _teleopData.bargePosition;
    notifyListeners();
  }

  void addTeleopPathPoint(TeleopPathPoint point )  {
    logger.d('Adding teleop point: $point');
    _teleopData.addPathPoint(point);
    notifyListeners();
  }

  void updateComment(String comment) {
    _comment = comment;
    notifyListeners();
  }

  Map<String,dynamic> toJSON() {
    if (_ulid.isEmpty) {
      _ulid = Ulid().toString();
    }
    return {
      'ulid': _ulid,
      'scout': scout,
      'match_level': matchLevel.name,
      'match_number': matchNumber,
      'event_key': eventKey,
      'team_number': teamNumber,
      'alliance': alliance.name,
      'bypass': bypass,
      'disabled': disabled,
      'auto': autoData.toJSON(),
      'teleop': teleopData.toJSON(),
      'comment': comment,
    };
  }

}