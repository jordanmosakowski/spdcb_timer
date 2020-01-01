import 'dart:ui';

import 'package:flutter/foundation.dart';

class Database{
  int currentSession;
  double freezeTime;
  int inputMethod;//0:keyboard, 1:type, 2:stackmat,
  int inspectionTime;//inspection Time (milliseconds)
  List<Session> sessions;
  int versionCode;//should match ios/Android build #s
  CubeColors colors;
  Settings settings;

  Database({
    @required this.inspectionTime,
    @required this.currentSession,
    @required this.colors,
    @required this.freezeTime,
    @required this.inputMethod,
    @required this.sessions,
    @required this.versionCode,
    @required this.settings,
  });

  static Database fromJson(dynamic json){
    if(json==null){
      return null;
    }
    return Database(
      currentSession: json['currentSession'],
      freezeTime: json['freezeTime'],
      inputMethod: json['input'],
      inspectionTime: json['inspectionTime'],
      colors: CubeColors.fromJson(json['colors']),
      versionCode: json['versionCode'],
      sessions: json['sessions']?.map((dynamic s)=>Session.fromJson(s))?.toList(),
      settings: Settings.fromJson(json['settings'])
    );
  }
}

class Session{
  String name;
  String scramble;//current scramble format
  List<Solve> solves;
  Session({
    @required this.name,
    @required this.scramble,
    @required this.solves
  });
  Map<String,dynamic> toJson(){
    return {
      "name": name,
      "scramble": scramble,
      "solves": solves?.map((Solve solve)=> solve.toJson())?.toList(),
    };
  }
  static Session fromJson(dynamic json){
    if(json==null){
      return null;
    }
    return Session(
      name: json['name'],
      scramble: json['scramble'],
      solves: json['solves']?.map((dynamic json)=> Solve.fromJson(json))?.toList(),
    );
  }
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

  CubeColors({
    @required this.e222,
    @required this.e333,
    @required this.e444,
    @required this.e555,
    @required this.e666,
    @required this.e777,
    @required this.eMinx,
    @required this.ePyram,
    @required this.eSkewb,
    @required this.eSq1,
    @required this.primary,
    @required this.secondary,
    @required this.background,
    @required this.accentBackground,
    @required this.accentPrimary,
  });

  static CubeColors fromJson(dynamic json){
    if(json==null){
      return null;
    }
    return CubeColors(
        e222: json['e222']?.map((int c)=>Color(c))?.toList(),
        e333: json['e333']?.map((int c)=>Color(c))?.toList(),
        e444: json['e444']?.map((int c)=>Color(c))?.toList(),
        e555: json['e555']?.map((int c)=>Color(c))?.toList(),
        e666: json['e666']?.map((int c)=>Color(c))?.toList(),
        e777: json['e777']?.map((int c)=>Color(c))?.toList(),
        eMinx: json['eMinx']?.map((int c)=>Color(c))?.toList(),
        ePyram: json['ePyram']?.map((int c)=>Color(c))?.toList(),
        eSkewb: json['eSkewb']?.map((int c)=>Color(c))?.toList(),
        eSq1: json['eSq1']?.map((int c)=>Color(c))?.toList(),
        primary: json['primary']!=null ? Color(json['primary']) : null,
        secondary: json['secondary']!=null ? Color(json['secondary']) : null,
        background: json['background']!=null ? Color(json['background']) : null,
        accentBackground: json['accentBackground']!=null ? Color(json['accentBackground']) : null,
        accentPrimary: json['accentPrimary']!=null ? Color(json['accentPrimary']) : null,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "e222": e222.map((Color c)=>c.value).toList(),
      "e333": e333.map((Color c)=>c.value).toList(),
      "e444": e444.map((Color c)=>c.value).toList(),
      "e555": e555.map((Color c)=>c.value).toList(),
      "e666": e666.map((Color c)=>c.value).toList(),
      "e777": e777.map((Color c)=>c.value).toList(),
      "eMinx": eMinx.map((Color c)=>c.value).toList(),
      "ePyram": ePyram.map((Color c)=>c.value).toList(),
      "eSkewb": eSkewb.map((Color c)=>c.value).toList(),
      "eSq1": eSq1.map((Color c)=>c.value).toList(),
      "primary": primary.value,
      "secondary": secondary.value,
      "background": background.value,
      "accentBackground": accentBackground.value,
      "accentPrimary": accentPrimary.value,
    };
  }


//  Color accentSecondary;
}

class Settings{
  bool inspection;
  double timerSize;
  bool inspectionVoice;
  double scrambleSize;
  bool hideWhileSolving;
  bool thirdDecimal;
  int displayUpdate; //0 normal, 1: 0.1, 2: second, 3: inspection, 4: none

  Settings({
    @required this.displayUpdate,
    @required this.hideWhileSolving,
    @required this.inspection,
    @required this.inspectionVoice,
    @required this.scrambleSize,
    @required this.thirdDecimal,
    @required this.timerSize
  });

  static Settings fromJson(dynamic json){
    return Settings(
      displayUpdate: json['displayUpdate'],
      hideWhileSolving: json['hideWhileSolving'],
      inspection: json['inspection'],
      inspectionVoice: json['inspectionVoice'],
      scrambleSize: json['scrambleSize'],
      thirdDecimal: json['thirdDecimal'],
      timerSize: json['timerSize']
    );
  }
  Map<String,dynamic> toJson(){
    return {
      "displayUpdate": displayUpdate,
      "hideWhileSolving": hideWhileSolving,
      "inspection": inspection,
      "inspectionVoice": inspectionVoice,
      "scrambleSize": scrambleSize,
      "thirdDecimal": thirdDecimal,
      "timerSize": timerSize,
    };
  }
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
  static Solve fromJson(dynamic json){
    return Solve(
      time: json['time'],
      scrambleType: json['scrambleType'].toString(),
      scramble: json['scramble'].toString(),
      penalty: json['penalty'],
      date: json['date'] ? DateTime.fromMillisecondsSinceEpoch(json['date']) : null,
      comments: json['comments'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "time": time,
      "scrambleType": scrambleType,
      "penalty": penalty,
      "date": date.millisecondsSinceEpoch,
      "comments": comments,
      "penalty": penalty
    };
  }
}