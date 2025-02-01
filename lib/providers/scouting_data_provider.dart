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
      "position": point.name,
      "success": pathPointIsSuccess,
    });
    pathPointIsSuccess = true;
  }


  Map<String, dynamic>toJSON() {
    return {
      'preload': preload.name,
      'startPosition': startPosition.name,
      'leave': leave,
      'path': path,
    };
  }
}

class TelopData {
  BargeAction bargeAction;
  BargePosition bargePosition;
  num hangTime;
  HangType hangType;
  List<Map<String,Object>> path = [];
  DateTime _pathStartTime = DateTime.now();

  TelopData({
    this.bargeAction = BargeAction.unset,
    this.hangTime = 0,
    this.hangType = HangType.none,
    this.bargePosition = BargePosition.unset,
  });

  bool allFieldsFilled() {
    return bargeAction != BargeAction.unset && path.isNotEmpty;
  }

  void addPathPoint(TelopPathPoint point) {
    if (path.isEmpty) {
      _pathStartTime = DateTime.now();
    }
    path.add({"point": point.name, "timestamp": DateTime.now().difference(_pathStartTime).inMilliseconds});
  }
  Map<String, dynamic>toJSON() {
    return {
      'path': path,
      'bargeAction': bargeAction.name,
      'hangTime': hangTime,
      'hangType': hangType.name,
      'bargePosition': bargePosition.name,
    };
  }
}


class ScoutingDataProvider extends ChangeNotifier {
  // This is the data that will be shared across the app
  // and can be accessed by any widget that listens to this provider
  String _ulid = '';
  String _scout = '';
  MatchLevel _matchLevel = MatchLevel.unset;
  int _matchNumber = 0;
  String _eventKey = 'TestEvent';
  int _teamNumber = 0;
  Alliance _alliance = Alliance.unset;

  String get scout => _scout;

  MatchLevel get matchLevel => _matchLevel;

  int get matchNumber => _matchNumber;

  String get eventKey => _eventKey;

  int get teamNumber => _teamNumber;

  Alliance get alliance => _alliance;

 final AutoData _autoData = AutoData();
 final TelopData _telopData = TelopData();

  AutoData get autoData => _autoData;

  TelopData get telopData => _telopData;

  void reset() {
    _ulid = '';
    _scout = '';
    _matchLevel = MatchLevel.unset;
    _matchNumber = 0;
    _eventKey = 'TestEvent';
    _teamNumber = 0;
    _alliance = Alliance.unset;
    _autoData.preload = Preload.unset;
    _autoData.startPosition = AutoStartPosition.unset;
    _autoData.leave = false;
    _autoData.path = [];
    _autoData.pathPointIsSuccess = true;
    _autoData.selectedReefSide = 0;
    _telopData.bargeAction = BargeAction.unset;
    _telopData.hangTime = 0;
    _telopData.path = [];
    notifyListeners();
  }

  bool infoFieldsFilled() {
    return _scout.isNotEmpty && _matchLevel != MatchLevel.unset && _matchNumber != 0 && _eventKey.isNotEmpty && _teamNumber != 0 && _alliance != Alliance.unset;
  }

  void updateMatchInfo({
    String? scout,
    MatchLevel? matchLevel,
    int? matchNumber,
    String? eventKey,
    int? teamNumber,
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

  void updateAutoData({Preload? preload,
      AutoStartPosition? startPosition,
      bool? leave,}) {
    _autoData.preload = preload ?? _autoData.preload;
    _autoData.startPosition = startPosition ?? _autoData.startPosition;
    _autoData.leave = leave ?? _autoData.leave;
    notifyListeners();
  }
  void updateScoutName(String name) {
    _scout = name;
    notifyListeners();
  }
  void updateMatchLevel(MatchLevel level) {
    _matchLevel = level;
    notifyListeners();
  }
  void updateMatchNumber(int number) {
    _matchNumber = number;
    notifyListeners();
  }
  void updateEventKey(String key) {
    _eventKey = key;
    notifyListeners();
  }
  void updateTeamNumber(int number) {
    _teamNumber = number;
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


  void updateTelopData({
    BargeAction? bargeAction,
    num? hangTime,
    HangType? hangType,
    BargePosition? bargePosition,
  }) {
    _telopData.bargeAction = bargeAction ?? _telopData.bargeAction;
    _telopData.hangTime = hangTime ?? _telopData.hangTime;
    _telopData.hangType = hangType ?? _telopData.hangType;
    _telopData.bargePosition = bargePosition ?? _telopData.bargePosition;
    notifyListeners();
  }

  void addTelopPathPoint(TelopPathPoint point )  {
    logger.d('Adding telop point: $point');
    _telopData.addPathPoint(point);
    notifyListeners();
  }

  Map<String,dynamic> toJSON() {
    if (_ulid.isEmpty) {
      _ulid = Ulid().toString();
    }
    return {
      'ulid': _ulid,
      'scout': scout,
      'matchLevel': matchLevel.name,
      'matchNumber': matchNumber,
      'eventKey': eventKey,
      'teamNumber': teamNumber,
      'alliance': alliance.name,
      'autoData': autoData.toJSON(),
      'telopData': telopData.toJSON(),
    };
  }

}