import 'dart:ui';

import 'package:flutter/foundation.dart';

class Database{
  int currentSession;
  double freezeTime;
  int input;//input method, 0:keyboard, 1:type, 2:stackmat,
  int inspection;//inspection Time
  List<Session> sessions;
  int versionCode;//should match ios/Android build #s
}

class Session{
  String name;
  String scramble;//current scramble format
  List<Solve> solves;
}

class CubeColors{
  List<Color> e222;
  List<Color> e333;
  List<Color> e444;
  List<Color> e555;
  List<Color> e666;
  List<Color> e777;
  List<Color> eMinx;
  List<Color> ePyram;
  List<Color> eSkewb;
  List<Color> eSq1;
  Color primary;
  Color secondary;
  Color background;
  Color accentBackground;
  Color accentPrimary;
  Color accentSecondary;
}

class Settings{
  bool inspection;
  double timerSize;
  bool inspectionVoice;
  double scrambleSize;
  bool hideWhileSolving;
  bool thirdDecimal;
  int displayUpdate; //0 normal, 1: 0.1, 2: second, 3: inspection, 4: none
}

class Solve{
  int time;
  String scrambleType;
  String scramble;
  int penalty;
  DateTime date;
  String comments;
  Solve({
    @required this.date,
    @required this.comments,
    @required this.penalty,
    @required this.scramble,
    @required this.scrambleType,
    @required this.time
  });
}