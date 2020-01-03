import 'dart:math';

import 'package:spdcb_timer_new/scramblers/utils.dart';

class ScramblerSq1 extends Scrambler{
  static Random rand = new Random();

  static List p = [1,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,1,0,0,1,0];
  static List seq = new List<List<int>>();

  String newScramble() {
    seq.clear();
    p = [1,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,1,0,0,1,0];
    getseq();
    String s = "";
    for (int i = 0; i < seq.length; i++) {
      if (seq[i][0] == 7) s += "/";
      else s += " (" + seq[i][0].toString() + "," + seq[i][1].toString() + ") ";
    }
    return s;
  }
  static void getseq() {
    var cnt = 0;
    var len = 16;
    while (cnt < len) {
      var x = rand.nextInt(12) - 5;
      var y = rand.nextInt(12) - 5;
      var size = ((x == 0) ? 0 : 1) + ((y == 0) ? 0 : 1);
      if (size > 0 || cnt == 0) {
        if (domove(x, y)) {
          var m = [x, y];
          if (size > 0) seq.add(m);
          cnt++;
          var n = [7, 0];
          seq.add(n);
          domove(7, 0);
        }
      }
    }
  }

  static domove( x, y) {
    if (x == 7) {
      for (var i = 0; i < 6; i++) {
        var temp = p[i + 6];
        p[i + 6] = p[i + 12];
        p[i + 12] = temp;
      }
      return true;
    }
    else {
      if (p[(17 - x) % 12] == 1 || p[(11 - x) % 12] == 1 || p[12 + ((17 - y) % 12)] == 1 || p[12 + ((11 - y) % 12)] == 1) {
        return false;
      }
      else {
        var px = p.sublist(0,12);
        var py = p.sublist(12,24);
        for (int i = 0; i < 12; i++) {
          p[i] = px[(12 + i - x) % 12];
          p[i + 12] = py[(12 + i - y) % 12];
        }
        return true;
      }
    }
  }
}
