import 'dart:math';

import 'package:spdcb_timer_new/scramblers/utils.dart';

class ScramblerClock extends Scrambler{
  String newScramble(){
    //TODO: Look at official clock scrambles and make sure this is all fine
    String str = "";
    var random= new Random();
    List<String> addsF=["UR","DR","DL","UL","U","R","D","L","ALL"];
    List<String> addsB=["U","R","D","L","ALL"];
    List<String> pins=["UR","DR","DL","UL"];
    pins.shuffle();
    List<String> signs=["+","-"];
    for (var i=0; i<addsF.length; i++){
      str+=addsF[i];
      var f = random.nextInt(7);
      str+=(f).toString();
      str+=signs[f==0 ? 0: random.nextInt(2)];
      str+=" ";
    }
    str+="y2 ";
    for (var i=0; i<addsB.length; i++){
      str+=addsB[i];
      var f = random.nextInt(7);
      str+=(f).toString();
      str+=signs[f==0 ? 0: random.nextInt(2)];
      str+=" ";
    }
    int pinCount = random.nextInt(5);
    if(pinCount!=4){
      for (var i=0; i<pinCount; i++){
        str+=pins[i];
        str+=" ";
      }
    }

    return str;
  }
}


