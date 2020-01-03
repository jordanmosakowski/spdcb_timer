import 'dart:math';

import 'package:spdcb_timer_new/scramblers/utils.dart';

class Scrambler444 extends Scrambler{
  String newScramble() {
    return ScramblerNNN().newScramble(4);
  }
}

class Scrambler555 extends Scrambler{
  String newScramble() {
    return ScramblerNNN().newScramble(5);
  }
}
class Scrambler666 extends Scrambler{
  String newScramble() {
    return ScramblerNNN().newScramble(6);
  }
}

class Scrambler777 extends Scrambler{
  String newScramble() {
    return ScramblerNNN().newScramble(7);
  }
}

class ScramblerNNN{
  String newScramble(int size){
    var random = new Random();
    var scrambleString = "";

    int layers = size~/2;
    bool even = (size/2==size~/2);
    List<int> lengths = [0,8,25,40,60,70,100,125,150,175,200];
    List<int> types = new List(layers*6);
    for (var i=0; i<(layers*6); i++){
      types[i]=i;
    }
    //print('new scramble');
    List<String> moves = ["R","L","U","D","B","F"];
    List<int> removes = [];
    for (var i=0; i<lengths[size-1]; i++){
      var move = random.nextInt(types.length);
      if (removes.indexOf(move)>=0){i--;}
      else {
        if (removes.length>0 && (removes[0])~/6!=(move)~/6){
          removes = [];
        }
        if (even && move % layers ==layers-1){
          //print("middle: "+move.toString()+" "+moves[move~/layers]);
          var middle = move~/(layers*2);
          //print('faceSet: '+middle.toString());
          var start = middle*layers*2;
          var add1 = start+layers-1;
          var add2 = start+layers+layers-1;
          //print(add1.toString()+" "+add2.toString());
          removes.add(add1);
          removes.add(add2);
          //print(start);
        }
        else{
          removes.add(move);
        }
        //print(removes);
        var rotation = random.nextInt(3);
        if (move % layers > 1) {
          scrambleString += (move % layers + 1).toString();
        }
        scrambleString += moves[move ~/ layers];
        if (move % layers > 0) {
          scrambleString += "w";
        }
        if (rotation == 1) {
          scrambleString += "'";
        }
        else if (rotation == 2) {
          scrambleString += "2";
        }
        scrambleString += " ";
      }
    }
    return scrambleString;
  }


}