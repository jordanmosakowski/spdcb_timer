import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spdcb_timer_new/cubing_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPDCB Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSolving = false;
  bool isFreezing = false;
  bool isInspecting = false;
  bool hasBeenReleased = true;
  bool hasInspection = true;
  int freezeTime = 550;
  Stopwatch mainStopwatch = Stopwatch();
  Stopwatch freezingStopwatch = Stopwatch();
  Stopwatch inspectingStopwatch = Stopwatch();

  Timer mainTimer;
  Timer freezingTimer;
  Timer inspectingTimer;

  @override
  void initState() {
    super.initState();
  }

  String specialMinutes(double a){
    var digits = 3;
    if (a<0){return "DNF";}
    else if (a<60){return a.toStringAsFixed(digits);}
    else{
      var b = (a/60).floor();
      var c = (a-(b*60));
      if (b.isNaN || c.isNaN){return "DNF";}
      else if (c<10){return (b.toString()+":0"+c.toStringAsFixed(digits));}
      else {return(b.toString()+":"+c.toStringAsFixed(digits));}
    }
  }

  final FocusNode keyboardFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(keyboardFocusNode);
    return RawKeyboardListener(
      focusNode: keyboardFocusNode,
      onKey: (RawKeyEvent e){
        print(e.logicalKey);
        if(e.runtimeType==RawKeyDownEvent){
          if(e.logicalKey == LogicalKeyboardKey.space){
            if(isSolving){
              isSolving = false;
              mainStopwatch.stop();
              mainTimer = null;
              hasBeenReleased = false;
            }
            else if (!isSolving && (isInspecting || !hasInspection) && !isFreezing){
              isFreezing = true;
              freezingStopwatch.reset();
              freezingStopwatch.start();
              setState((){});
              freezingTimer = Timer.periodic(Duration(milliseconds: 1),(Timer timer){
                setState((){});
              });
            }
          }
        }
        else if(e.runtimeType==RawKeyUpEvent){
          if(hasBeenReleased){
            if(!isInspecting && hasInspection){
              isInspecting = true;
              inspectingStopwatch.reset();
              inspectingStopwatch.start();
              setState((){});
              inspectingTimer = Timer.periodic(Duration(seconds: 1), (Timer timer){
                setState((){});
              });
            }
            else if(!isSolving && (isInspecting || !hasInspection) && isFreezing && freezingStopwatch.elapsedMilliseconds>=freezeTime){
              isSolving = true;
              isInspecting = false;
              isFreezing = false;
              inspectingStopwatch.stop();
              freezingStopwatch.stop();
              inspectingTimer = null;
              mainStopwatch.reset();
              mainStopwatch.start();
              mainTimer = Timer.periodic(Duration(milliseconds: 1), (Timer timer){
                setState((){});
              });
            }
            else if(isFreezing  && freezingStopwatch.elapsedMilliseconds<freezeTime){
              isFreezing = false;
              freezingStopwatch.stop();
              freezingTimer = null;
            }
          }
          else{
            hasBeenReleased = true;
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("SPDCB Timer"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: (){

              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      Icon(CubingIcons.e222),
                      Icon(CubingIcons.e333),
                      Icon(CubingIcons.e444),
                      Icon(CubingIcons.e555),
                      Icon(CubingIcons.e666),
                      Icon(CubingIcons.e777),
                      Icon(CubingIcons.ePyram),
                      Icon(CubingIcons.eMinx),
                      Icon(CubingIcons.eSkewb),
                      Icon(CubingIcons.eClock),
                      Icon(CubingIcons.eSq1),
                    ],
                  ),
                  Center(child: Text("B' R' F2 L2 D2 L B2 R B2 R' F2 R2 B2 U B2 L B2 L' U B'"))
                ],
              ),
            ),
            Center(
              child: Text(
                isInspecting ? (15-(inspectingStopwatch.elapsedMilliseconds/1000).floor()).toString() : specialMinutes(mainStopwatch.elapsedMilliseconds/1000.0),
                style: TextStyle(
                  fontSize: 100,
                  color: isFreezing ? (freezingStopwatch.elapsedMilliseconds>=freezeTime ? Colors.green : Colors.red) : Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
