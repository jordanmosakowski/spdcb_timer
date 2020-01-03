import 'package:spdcb_timer_new/scramblers/333.dart';
import 'package:spdcb_timer_new/scramblers/clock.dart';
import 'package:spdcb_timer_new/scramblers/minx.dart';
import 'package:spdcb_timer_new/scramblers/nnn.dart';
import 'package:spdcb_timer_new/scramblers/pyram.dart';
import 'package:spdcb_timer_new/scramblers/skewb.dart';
import 'package:spdcb_timer_new/scramblers/sq1.dart';
import 'package:spdcb_timer_new/scramblers/utils.dart';

import '222.dart';

class TimerScrambler{
  String currentType;
  final Map<String,Scrambler> scramblers = {
    "e222": Scrambler222(),
    "e333": Scrambler333(),
    "e444": Scrambler444(),
    "e555": Scrambler555(),
    "e666": Scrambler666(),
    "e777": Scrambler777(),
    "ePyram": ScramblerPyram(),
    "eMinx": ScramblerMinx(),
    "eSkewb": ScramblerSkewb(),
    "eClock": ScramblerClock(),
    "eSq1": ScramblerSq1(),
  };
  TimerScrambler(String initialType){
    currentType = initialType;
  }

  void updateType(String newType){
    currentType = newType;
  }

  String newScramble(){
    return scramblers[currentType].newScramble();
  }
}