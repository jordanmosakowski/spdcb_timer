import 'dart:math';

import 'package:spdcb_timer_new/scramblers/utils.dart';

class ScramblerSkewb extends Scrambler{

  ScramblerSkewb(){
    initialize();
  }

  r(n,x,y,z) {
    var o = 3, a = n[z];
    for (var t = o; t > 1; t--){
      if(t==3){
        n[z] = n[y];
      }
      else if(t==2){
        n[y] = n[x];
      }
    }
    n[x] = a;
    return  r;
  }

  n(r, n, o, a) {
    a = a ?? 6;
    for (var t = 0; a > t; t++) {
      if(r.length<=t){
        r.add(List());
      }
      else{
        r[t] = List();
      }
      for (var e = 0; n > e; e++){

//        r[t][e] = o(e, t);
        r[t].add(o(e,t));
      }
    }
  }

  o(r, n, o, t, e, f, u, i) {
    var v = e is List;
    f = f ?? 6;
    u = u ?? 3;
    i = i ?? 256;
    for (var c = 0, s = (((o + 7) & 0xFFFFFFFF) >> 3); s > c; c++){
      if(r.length<=c){
        r.add(-1);
      }
      else{
        r[c] = -1;
      }
    }
    r[n >> 3] ^= 15 << ((7 & n) << 2);
    for (var m = 0; t >= m; m++) {
    var g = m >= i,
    l = m + 1 ^ 15,
    b = g ? 15 : m,
    d = g ? m : 15;
    r: for (var h = 0; o > h; h++)
    if (a(r, h) == b)
    for (var k = 0; f > k; k++)
    for (var p = h, w = 0; u > w; w++){
      p = v ? e[k][p] : e(p, k);
      if ( a(r, p) == d) {
    if (g) {
    r[h >> 3] ^= l << ((7 & h) << 2);
    continue r;
    }
    r[p >> 3] ^= l << ((7 & p) << 2);
    }
    }
    }
  }

  a(r, n) {
    return r[n >> 3] >> ((7 & n) << 2) & 15;
  }

  var f2 = [1, 1, 1, 3, 12, 60, 360],
      u = [
        [6, 5, 10, 1],
        [9, 7, 4, 2],
        [3, 11, 8, 0],
        [10, 1, 6, 5],
        [0, 8, 11, 3],
        [7, 9, 2, 4],
        [4, 2, 9, 7],
        [11, 3, 0, 8],
        [1, 10, 5, 6],
        [8, 0, 3, 11],
        [2, 4, 7, 9],
        [5, 6, 1, 10]
      ];

  z(n, o) {
    var a = n % 12;
    n = floor(n / 12);
    var t = List(6), e = 5517840, i = 0,s,c;
    for (var v = 0; 5 > v; v++) {
      c = f2[5 - v];
      s = floor(n / c);
      i = i ^ s;
      n -= s * c; s <<= 2; t[v] = e >> s & 15; c = (1 << s) - 1; e = (e & c) + (e >> 4 & ~c);
    }
    0 == (1 & i) ? t[5] = e : (){t[5] = t[4]; t[4] = e;};
    if(0 == o){
      r(t, 0, 3, 1);
    }
    if(2 == o){
      r(t, 1, 5, 2);
    }
    if(1 == o) {r(t, 0, 2, 4);}
    if(3 == o) {r(t, 3, 4, 5);}
    n = 0; e = 5517840;
    for (var v = 0; 4 > v; v++){ s = t[v]==null ? 0 : t[v] << 2; n *= 6 - v; n += e >> s & 15; e -= 1118480 << s;}
    return 12 * n + u[a][o];
  }

  e2(r, n) {
    var o = List(), a = List();
    for (var t = 0; 4 > t; t++){
      if(o.length<=t){
        o.add(r%3);
      }
      else{
        o[t] = r % 3;
      }
      r = floor(r / 3);
    }
    for (var t = 0; 3 > t; t++){
      if(a.length<=t){
        a.add(r%3);
      }
      else {
        a[t] = r % 3;
      }
      r = floor(r / 3);
    }
    if(a.length<=3){
      a.add((6 - a[0] - a[1] - a[2]) % 3);
    }
    else{
      a[3] = (6 - a[0] - a[1] - a[2]) % 3;
    }

    o[n] = (o[n] + 1) % 3;
    var e;
    switch (n) {
      case 0:
        e = a[0]; a[0] = a[2] + 2; a[2] = a[1] + 2; a[1] = e + 2;
        break;
      case 1:
        e = a[0]; a[0] = a[1] + 2; a[1] = a[3] + 2; a[3] = e + 2;
        break;
      case 2:
        e = a[0]; a[0] = a[3] + 2; a[3] = a[2] + 2; a[2] = e + 2;
        break;
      case 3:
        e = a[1]; a[1] = a[2] + 2; a[2] = a[3] + 2; a[3] = e + 2;
    }
    for (var t = 2; t >= 0; t--) r = 3 * r + a[t] % 3;
    for (var t = 3; t >= 0; t--) r = 3 * r + o[t];
    return r;
  }

  t() {
//    a(n, o) {
//      var a = n % 12;
//      n = floor(n / 12);
//      var t = [], e = 5517840, i = 0;
//      for (var v = 0; 5 > v; v++) {
//        var c = f[5 - v],
//            s = floor(n / c);
//            i = i ^ s;
//        n -= s * c; s <<= 2; t[v] = e >> s & 15; c = (1 << s) - 1; e = (e & c) + (e >> 4 & ~c);
//      }
//      for (0 == (1 & i) ? t[5] = e : (t[5] = t[4], t[4] = e), 0 == o && r(t, 0, 3, 1), 2 == o && r(t, 1, 5, 2), 1 == o && r(t, 0, 2, 4), 3 == o && r(t, 3, 4, 5), n = 0, e = 5517840, v = 0; 4 > v; v++) s = t[v] << 2, n *= 6 - v, n += e >> s & 15, e -= 1118480 << s;
//      return 12 * n + u[a][o];
//    }
//
//    e(r, n) {
//      var o = [], a = [];
//      for (var t = 0; 4 > t; t++){ o[t] = r % 3; r = floor(r / 3);}
//      for (var t = 0; 3 > t; t++){ a[t] = r % 3; r = floor(r / 3);}
//      a[3] = (6 - a[0] - a[1] - a[2]) % 3; o[n] = (o[n] + 1) % 3;
//      var e;
//      switch (n) {
//      case 0:
//      e = a[0]; a[0] = a[2] + 2; a[2] = a[1] + 2; a[1] = e + 2;
//      break;
//      case 1:
//      e = a[0]; a[0] = a[1] + 2; a[1] = a[3] + 2; a[3] = e + 2;
//      break;
//      case 2:
//      e = a[0]; a[0] = a[3] + 2; a[3] = a[2] + 2; a[2] = e + 2;
//      break;
//      case 3:
//      e = a[1]; a[1] = a[2] + 2; a[2] = a[3] + 2; a[3] = e + 2;
//      }
//      for (var t = 2; t >= 0; t--) r = 3 * r + a[t] % 3;
//      for (var t = 3; t >= 0; t--) r = 3 * r + o[t];
//      return r;
//    }
//    t = (){};
    var f = [1, 1, 1, 3, 12, 60, 360],
        u = [
          [6, 5, 10, 1],
          [9, 7, 4, 2],
          [3, 11, 8, 0],
          [10, 1, 6, 5],
          [0, 8, 11, 3],
          [7, 9, 2, 4],
          [4, 2, 9, 7],
          [11, 3, 0, 8],
          [1, 10, 5, 6],
          [8, 0, 3, 11],
          [2, 4, 7, 9],
          [5, 6, 1, 10]
        ];
    n(l, 4320, a, 4); o(m, 0, 4320, 7, l, 4, 2,null); n(b, 2187, e, 4); o(g, 0, 2187, 6, b, 4, 2,null);
  }

  e(r, n, o, t, f) {
    if (0 == o) return 0 == r && 0 == n;
    if (a(m, r) > o || a(g, n) > o) return false;
    for (var u = 0; 4 > u; u++)
      if (u != t)
        for (var i = r, v = n, c = 0; 2 > c; c++){
          i = l[u][i]; v = b[u][v];
          if (e(i, v, o - 1, u, f)){f.add(2 * u + (1 - c)); return true;}
        }
    return false;
  }

  f(r) {
    var n = [], o = ["L", "R", "B", "U"];
    for (var  a = 0; a < r.length; a++) {
      var t = r[a] >> 1,
          e = 1 & r[a];
      if (2 == t)
        for (var f = 0; e >= f; f++) {
          var u = o[0];
          o[0] = o[1]; o[1] = o[3]; o[3] = u;
    }
    n.add(o[t] + (1 == e ? "'" : ""));
    }
    return n.join(" ");
    }

  String newScramble() {
    var n, o, a = 0,
        u = [];
    do{ n = i(4320); o = i(2187);} while (0 == n && 0 == o);
    for (; d[n % 12] != (o + floor(o / 3) + floor(o / 9) + floor(o / 27)) % 3;) o = i(2187);
    if (0 != n || 0 != o)
      for (; 99 > a && !e(n, o, a, -1, u); a++);
    return f(u);
  }

  i(r) {
    return floor(random() * r);
  }

  static random() {
    return Random().nextDouble();
  }

  static floor(num a){
    return a.floor();
  }


  initialize() {
//    t();
    n(l, 4320, z, 4); o(m, 0, 4320, 7, l, 4, 2,null); n(b, 2187, e2, 4); o(g, 0, 2187, 6, b, 4, 2,null);
  }

  var m = List(),
      g = [],
      l = List(),
      b = [],
      d = [0, 1, 2, 0, 2, 1, 1, 2, 0, 2, 1, 0];
//  return {
//  version: "May 1, 2015",
//  initialize: c,
//  getRandomScramble: u,
//  }
}