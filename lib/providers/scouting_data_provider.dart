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
  num hangTime;
  BargeAction bargeTried;
  BargeAction bargeResult;
  BargePosition bargePosition;

  List<Map<String,Object>> path = [];
  DateTime _pathStartTime = DateTime.now();

  TelopData({
    this.hangTime = 0,
    this.bargeTried = BargeAction.unset,
    this.bargeResult = BargeAction.unset,
    this.bargePosition = BargePosition.unset,
  });

  bool allFieldsFilled() {
    return bargeResult != BargeAction.unset && path.isNotEmpty;
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
      'hangTime': hangTime,
      'bargeTried': bargeTried.name,
      'bargeResult': bargeResult.name,
      'bargePosition': bargePosition.name,
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

  String get scout => _scout;

  MatchLevel get matchLevel => _matchLevel;

  String get matchNumber => _matchNumber;

  String get eventKey => _eventKey;

  String get teamNumber => _teamNumber;

  Alliance get alliance => _alliance;

 final AutoData _autoData = AutoData();
 final TelopData _telopData = TelopData();

  AutoData get autoData => _autoData;

  TelopData get telopData => _telopData;

  void reset() {
    _ulid = '';
    _scout = '';
    _matchLevel = MatchLevel.unset;
    _matchNumber = '';
    _eventKey = 'TestEvent';
    _teamNumber = '';
    _alliance = Alliance.unset;
    _autoData.preload = Preload.unset;
    _autoData.startPosition = AutoStartPosition.unset;
    _autoData.leave = false;
    _autoData.path = [];
    _autoData.pathPointIsSuccess = true;
    _autoData.selectedReefSide = 0;
    _telopData.bargeResult = BargeAction.unset;
    _telopData.hangTime = 0;
    _telopData.path = [];
    notifyListeners();
  }

  bool infoFieldsFilled() {
    return _scout.isNotEmpty && _matchLevel != MatchLevel.unset && _matchNumber != 0 && _eventKey.isNotEmpty && _teamNumber != 0 && _alliance != Alliance.unset;
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


  void updateTelopData({
    num? hangTime,
    BargeAction? bargeTried,
    BargeAction? bargeResult,
    BargePosition? bargePosition,
  }) {
    _telopData.hangTime = hangTime ?? _telopData.hangTime;
    _telopData.bargeTried = bargeTried ?? _telopData.bargeTried;
    _telopData.bargeResult = bargeResult ?? _telopData.bargeResult;
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