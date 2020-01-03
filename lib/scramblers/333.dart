import 'dart:math';
import 'package:spdcb_timer_new/scramblers/utils.dart';
class Scrambler333 extends Scrambler{
  String newScramble(){
    String str ="";
    var random = new Random();
    var moves = random.nextInt(6)+19;
    var start = random.nextInt(4)+4;
    var startMoves = ["R2","L2","F2","B2","U","D"];
    var turns = ["","2","'"];
    var last = 6;
    var twoAgo = 6;
    for (var i=0; i<start; i++){
      var move = random.nextInt(6);
      if(move!=last && !(twoAgo==move && twoAgo~/2==last~/2)){
        twoAgo=last;
        last=move;
        str+=startMoves[move];
        if(move>3){
          str+=turns[random.nextInt(3)];
        }
        str+=" ";
      }
      else{
        i--;
      }
    }
    var faces = ["R","L","F","B","U","D"];
    for (var i=start; i<moves; i++){
      var move = random.nextInt(6);
      if(move!=last && !(twoAgo==move && twoAgo~/2==last~/2)){
        twoAgo=last;
        last=move;
        str+=faces[move];
        str+=turns[random.nextInt(3)];
        str+=" ";
      }
      else{
        i--;
      }
    }
    return str;
  }

}
