import 'dart:async';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spdcb_timer_new/cubing_icons.dart';
import 'package:spdcb_timer_new/scramble_icon.dart';
import 'package:spdcb_timer_new/scramblers/draw.dart';
import 'package:spdcb_timer_new/scramblers/scrambler.dart';
import 'package:spdcb_timer_new/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Color colorPrimary = Colors.white;
  Color colorAccent = Color.fromRGBO(200, 200, 200, 1.0);
  Color colorBackground = Colors.grey[900];
  Color colorSecondP = Colors.black;
  Color colorSecondB = Colors.white;

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness) => ThemeData(
          scaffoldBackgroundColor: colorBackground,
          textTheme: TextTheme(
            body1: TextStyle(
                color: colorPrimary
            ),
            title: TextStyle(
              color: colorPrimary
            )
          ),
          dialogBackgroundColor: colorBackground,
          dialogTheme: DialogTheme(
            contentTextStyle: TextStyle(
              color: colorPrimary,
            ),
          ),
          disabledColor: colorAccent,
          primaryColor: colorSecondB,
          primaryTextTheme: TextTheme(
            title: TextStyle(
              color: colorSecondP,
            ),
          ),
          primaryIconTheme: IconThemeData(
            color: colorSecondP,
          )
      ),
      themedWidgetBuilder: (context,theme){
        return MaterialApp(
          title: 'SPDCB Timer',
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: Home(),
        );
      }
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
  TimerScrambler scrambler = TimerScrambler("e333");

  Timer mainTimer;
  Timer freezingTimer;
  Timer inspectingTimer;
  String scramble;

  @override
  void initState() {
    super.initState();
    scramble = scrambler.newScramble();
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

  void changeScramble(String id){
    setState((){
      scrambler.currentType = id;
      scramble = scrambler.newScramble();
    });
  }

  final FocusNode keyboardFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(keyboardFocusNode);
    return RawKeyboardListener(
      focusNode: keyboardFocusNode,
      onKey: (RawKeyEvent e){
        if(e.runtimeType==RawKeyDownEvent){
          if(isSolving){
            isSolving = false;
            mainStopwatch.stop();
            mainTimer = null;
            hasBeenReleased = false;
          }
          else if(e.logicalKey == LogicalKeyboardKey.space){
            if (!isSolving && (isInspecting || !hasInspection) && !isFreezing){
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
          if(hasBeenReleased && e.logicalKey == LogicalKeyboardKey.space){
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
              icon: Icon(Icons.settings,),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SettingsPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: (){

              },
            ),
          ],
        ),
        body: GestureDetector(
          onTapDown: (TapDownDetails details){
            if(!kIsWeb){
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

          },
          onTapUp: (TapUpDetails details){//TOOD: Dragging finger doesn't work well
            if(hasBeenReleased && !kIsWeb){
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
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                top:0,
                right:0,
                child: CustomPaint(
                  painter: CubePainter(scrambler.currentType,scramble),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              Positioned(
                top:0,
                bottom:0,
                left:0,
                right:0,
                child: Container(
                  color: Colors.transparent,
                )
              ),
              Positioned(
                top: 10,
                left:300,
                right:300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        ScrambleIcon(scrambler.currentType,"e222",CubingIcons.e222,changeScramble),
                        ScrambleIcon(scrambler.currentType,"e333",CubingIcons.e333,changeScramble),
                        ScrambleIcon(scrambler.currentType,"e444",CubingIcons.e444,changeScramble),
                        ScrambleIcon(scrambler.currentType,"e555",CubingIcons.e555,changeScramble),
                        ScrambleIcon(scrambler.currentType,"e666",CubingIcons.e666,changeScramble),
                        ScrambleIcon(scrambler.currentType,"e777",CubingIcons.e777,changeScramble),
                        ScrambleIcon(scrambler.currentType,"ePyram",CubingIcons.ePyram,changeScramble),
                        ScrambleIcon(scrambler.currentType,"eMinx",CubingIcons.eMinx,changeScramble),
                        ScrambleIcon(scrambler.currentType,"eSkewb",CubingIcons.eSkewb,changeScramble),
                        ScrambleIcon(scrambler.currentType,"eClock",CubingIcons.eClock,changeScramble),
                        ScrambleIcon(scrambler.currentType,"eSq1",CubingIcons.eSq1,changeScramble),
                      ],
                    ),
                    Center(child: Text(scramble,style: TextStyle(fontSize: 20)))
                  ],
                ),
              ),
              Center(
                child: Text(
                  isInspecting ? (15-(inspectingStopwatch.elapsedMilliseconds/1000).floor()).toString() : specialMinutes(mainStopwatch.elapsedMilliseconds/1000.0),
                  style: TextStyle(
                    fontSize: 100,
                    color: isFreezing ? (freezingStopwatch.elapsedMilliseconds>=freezeTime ? Colors.greenAccent[200] : Colors.red) : null,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
