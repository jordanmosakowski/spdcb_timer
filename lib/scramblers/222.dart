import 'dart:math';
import 'package:spdcb_timer_new/scramblers/utils.dart';

class Scrambler222 extends Scrambler{
  String newScramble(){
    String str = "";
    Random random = new Random();
    var length = 11;
    var moves = ["R","U","F"];
    var ends = ["","'","2"];
    var previous = -1;
    var move, end;
    for(var i=0; i<length; i++){
      move = random.nextInt(3);
      if(move!=previous){
        end = random.nextInt(3);
        str+=moves[move]+ends[end]+" ";
        previous=move;
      }
      else{
        i--;
      }
    }
    return str;
  }
}