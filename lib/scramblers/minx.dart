import 'dart:math';

import 'package:spdcb_timer_new/scramblers/utils.dart';

class ScramblerMinx extends Scrambler{//7 or mega, 3 for kilo
  String newScramble(){
    int rows = 7;
    Random random = new Random();
    String scrambleString = "";
    int length = 5;
    for (var j=0; j<rows; j++) {
      for (var i = 0; i < length; i++) {
        var version = random.nextInt(4);
        if (version / 2 < 1) {
          scrambleString += "R++ ";
        }
        else {
          scrambleString += "R-- ";
        }
        if (version % 2 == 0) {
          scrambleString += "D++ ";
        }
        else {
          scrambleString += "D-- ";
        }
      }
      bool uMove = scrambleString[scrambleString.length-2]=="+";
      if (uMove){
        scrambleString+="U\n";
      }
      else{
        scrambleString+="U'\n";
      }
    }
    return scrambleString;
  }
}