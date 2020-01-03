import 'dart:math';

import 'package:spdcb_timer_new/scramblers/utils.dart';

class ScramblerPyram extends Scrambler {
  static random() {
    return Random().nextDouble();
  }

  static floor(num a){
    return a.floor();
  }

  r() {
    for (var r = 0; 6 > r; r++) {
      d[r + 1] = F.length - 3;
      for (var o = 0; o < F.length; o += 3)
        if (b[r] == F[o]) {
          d[r + 1] = o;
          break;
        }
    }
  }

  o(r) {
    m[r] = [
      1,
      1,
      1,
      1,
      1,
      0,
      2,
      0,
      3,
      3,
      3,
      3,
      3,
      0,
      1,
      1,
      1,
      0,
      2,
      2,
      2,
      0,
      3,
      3,
      3,
      0,
      0,
      0,
      1,
      0,
      2,
      2,
      2,
      2,
      2,
      0,
      3,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      4,
      4,
      4,
      4,
      4,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      4,
      4,
      4,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      4,
      0,
      0,
      0,
      0,
      0,
      0
    ];
  }

  f() {
    var r, f, n;
    for (n = 0; s > n; n++) {
      a();
      e();
      M[n] = "";
      o(n);
      for (r = 0; r < x.length; r++) {
        M[n] += ["U", "L", "R", "B"][7 & x[r]] + ["", "'"][((8 & x[r]) / 8).floor()] + " ";
        c([3, 0, 1, 2][7 & x[r]], 1 + (8 & x[r]) / 8, n);
      }
      var t = ["l", "r", "b", "u"];
      for (r = 0; 4 > r; r++) {
        f = (3 * random()).floor();
        if(2>f){
          M[n] += t[r] + ["", "'"][f] + " ";
          c(4 + r, 1 + f, n);
        }
      }
    }
  }

  a() {
    if(4==k){
//      clearTimeout(j);
    }
    w = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3];
    k = 0;
    x = [];
  }

  e() {
    var r, o, f, a, e = 0, t = 0, i = 0;
    z = [0, 1, 2, 3, 4, 5];
    for (var u = 0; 4 > u; u++) {
      var c = u + ((6 - u) * random()).floor(), l = z[u];
      z[u] = z[c];
      z[c] = l;
      if(u != c){
        i++;
      }
    }
    if (i % 2 == 1) {
      var l = z[4];
      z[4] = z[5];
      z[5] = l;
    }
    i = 0;
    L = List(10);
    for (var u = 0; 5 > u; u++){
      L[u] = (2 * random()).floor();
      i += L[u];
    }
    L[5] = i % 2;
    for (var u = 6; 10 > u; u++) L[u] = (3 * random()).floor();
    for (r = 0; 6 > r; r++) {
      o=0;
      for (f = 0; 6 > f && z[f] != r; f++) {
        if(z[f]>r){
          o++;
        }
      }
      t = t * (6 - r) + o;
    }
    for (r = 9; r >= 6; r--) e = 3 * e + L[r];
    for (r = 4; r >= 0; r--) e = 2 * e + L[r];
    if (0 != t || 0 != e) for (a = 7; 12 > a && !n(t, e, a, -1); a++) ;
  }

  n(r, o, f, a) {
    if (0 == f) {
      if (0 == r && 0 == o) return true;
    } else {
      if (y[r] > f || R[o] > f) return false;
      var e, t, i, u;
      for (u = 0; 4 > u; u++) {
        if (u != a) {
          e = r;
          t = 0;
          for (i = 0; 2 > i; i++) {
            e = S[e][u];
            t = q[t][u];
//            print(x);
            x.add(u + 8 * i);
            if (n(e, t, f - 1, u)) return true;
            x.length--;
          }
        }
      }
    }
    return false;
  }

  t() {
    var r, o, f, a, e, n;
    for (o = 0; 720 > o; o++){
      y[o] = -1; S[o] = List(4);
      for (e = 0; 4 > e; e++) {
        S[o][e] = i(o, e);
      }
    }
    y[0] = 0;
    for (a = 0; 6 >= a; a++){
      n=0;
      for (o = 0; 720 > o; o++){
        if (y[o] == a){
          for (e = 0; 4 > e; e++){
            f=o;
            for (r = 0; 2 > r; r++){
              f = S[f][e];
              if(-1 == y[f]){y[f] = a + 1; n++;}
            }
          }
        }
      }
    }
    for (o = 0; 2592 > o; o++){
      R[o] = -1;
      q[o] = List(4);
      for (e = 0; 4 > e; e++){
        q[o][e] = u(o, e);
      }
    }
    R[0] = 0;
    for (a = 0; 5 >= a; a++){
      n=0;
      for (o = 0; 2592 > o; o++){
        if (R[o] == a){
          for (e = 0; 4 > e; e++) {
            f=0;
            for (r = 0; 2 > r; r++){
              f = q[f][e];
              if(-1 == R[f]) {
                R[f] = a + 1;
                n++;
              }
            }
          }
        }
      }
    }
  }

  i(r, o) {
    var f, a, e, n = List(10), t = r;
    for (f = 1; 6 >= f; f++) {
      e = floor(t / f);
      a = t - f * e;
      t = e;
      for (e = f - 1; e >= a; e--) {
//        print(e+1);
        n[e + 1] = n[e];
      }
      n[a] = 6 - f;
    }
    0 == o ? v(n, 0, 3, 1) : 1 == o ? v(n, 1, 5, 2) : 2 == o ? v(n, 0, 2, 4) : 3 == o ? v(n, 3, 4, 5) : (){};
    t=0;
    for (f = 0; 6 > f; f++) {
      a=0;
      for (e = 0; 6 > e && n[e] != f; e++){
        if(n[e] > f){ a++;}
      }
      t = t * (6 - f) + a;
    }
    return t;
  }

  u(r, o) {
    var f, a, e, n = 0, t = List(10), i = r;
    for (f = 0; 4 >= f; f++){
      t[f] = 1 & i;
      i >>= 1;
      n ^= t[f];
    }
    t[5] = n;
    for (f = 6; 9 >= f; f++){
      e = floor(i / 3);
      a = i - 3 * e;
      i = e;
      t[f] = a;
    }
    if(0==o){
      t[6]++;
      if(3 == t[6]) {
        t[6] = 0;
      }
      v(t, 0, 3, 1);
      t[1] ^= 1;
      t[3] ^= 1;
    }
    else if(1==o){
      t[7]++; if(3 == t[7]){
        t[7] = 0;
      }
      v(t, 1, 5, 2);
      t[2] ^= 1;
      t[5] ^= 1;
    }
    else if(2==o){
      t[8]++;
      if(3 == t[8]){
        t[8] = 0;
      }
      v(t, 0, 2, 4);
      t[0] ^= 1;
      t[2] ^= 1;
    }
    else if(3==0){
      t[9]++;
      if(3 == t[9]){
        t[9] = 0;
      }
      v(t, 3, 4, 5);
      t[3] ^= 1;
      t[4] ^= 1;
    }
    i = 0;
    for (f = 9; f >= 6; f--) i = 3 * i + t[f];
    for (f = 4; f >= 0; f--) i = 2 * i + t[f];
    return i;
  }

  c(r, o, f) {
    switch (r) {
      case 0:
        l(f, 14, 58, 18, o); l(f, 15, 57, 31, o); l(f, 16, 70, 32, o); l(f, 30, 28, 56, o);
        break;
      case 1:
        l(f, 32, 72, 22, o); l(f, 33, 59, 23, o); l(f, 20, 58, 24, o); l(f, 34, 60, 36, o);
        break;
      case 2:
        l(f, 14, 10, 72, o); l(f, 1, 11, 71, o); l(f, 2, 24, 70, o); l(f, 0, 12, 84, o);
        break;
      case 3:
        l(f, 2, 18, 22, o); l(f, 3, 19, 9, o); l(f, 16, 20, 10, o); l(f, 4, 6, 8, o);
        break;
      case 4:
        l(f, 30, 28, 56, o);
        break;
      case 5:
        l(f, 34, 60, 36, o);
        break;
      case 6:
        l(f, 0, 12, 84, o);
        break;
      case 7:
        l(f, 4, 6, 8, o);
    }
  }

  l(r, o, f, a, e) {
    2 == e ? v(m[r], a, f, o) : v(m[r], o, f, a);
  }

  v(r, o, f, a) {
    var e = r[o];
    r[o] = r[f]; r[f] = r[a]; r[a] = e;
  }

  g(r) {
    return "r" == r ? "#FF0000" : "o" == r ? "#FF8000" : "b" == r
        ? "#0000FF"
        : "g" == r ? "#00FF00" : "y" == r ? "#FFFF00" : "w" == r
        ? "#FFFFFF"
        : "x" == r ? "#000000" :
    0;
  }

  h(r, o, f, a, e, n, t, i, u) {
    var c = 1;
    if(2==i){
      c = -1;
    }
    var l = [a, a - n, a + n], v = [e + t * c, e - t * c, e - t * c], h = "";
    for ( s = 0; s < l.length; s++) {
      var b = E(o, f, [l[s], v[s]]);
      h += (0 == s ? "M" : "L") + b[0] + "," + b[1];
    }
    h += "z";
//    r.path(h).attr({fill: g(u), stroke: "#000"});
  }

  var s = 1,
      b = "xgryb ",
      F = ["g", "green.jpg", "green", "r", "red.jpg", "red", "y", "yellow.jpg", "yellow", "b", "blue.jpg", "blue", "w", "white.jpg", "white", "o", "orange.jpg", "orange", "p", "purple.jpg", "purple", "0", "gray.jpg", "grey"
      ],
      p = [1, 2, 1, 2, 1, 0, 2, 0, 1, 2, 1, 2, 1, 0, 1, 2, 1, 0, 2, 1, 2, 0, 1, 2, 1, 0, 0, 0, 1, 0, 2, 1, 2, 1, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
      m = List(10000),
      d = List(10000),
      M = List(10000);

//  r();

  var k, j, w = List(10000), y = List(10000), R = List(10000), S = List(10000), q = List(10000), x = [], z = List(10000), L = List(10000), T = [];
  String newScramble() {
    f();
    return M[0];
  }
  U () {
    r(); t(); /*o && setTimeout(o, 0)*/
  }
  var _ = 15; var C = 18;
  E (num r, num o,f) {
    var a = 2 * _ + 9 * C, e = 2 * _ + 5.3 * C, n = min(r / a, o / e), t = f[0] * n + (r - a * n) / 2,
        i = f[1] * n + (o - e * n) / 2;
    return [t, i];
  }

  PyramNew(){
    U();
  }




}