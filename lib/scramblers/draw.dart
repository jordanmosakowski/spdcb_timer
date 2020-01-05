import 'dart:math' as Math;
import 'package:flutter/material.dart';
class CubePainter extends CustomPainter{
  String scramble;
  String scrambleType;
  CubePainter(String type, String scramble){
    this.scrambleType = type;
    this.scramble = scramble;
  }
  @override
  void paint(Canvas canvas, Size canvasSize) {
    if(scrambleType=="e333" || scrambleType=="e333bf"){
      DrawNNN(3).draw(canvas, scramble);
    }
    else if(scrambleType=="e444" || scrambleType=="444bf"){
      DrawNNN(4).draw(canvas, scramble);
    }
    else if(scrambleType=="e222"){
      DrawNNN(2).draw(canvas, scramble);
    }
    else if(scrambleType=="e555" || scrambleType=="555bf"){
      DrawNNN(5).draw(canvas, scramble);
    }
    else if(scrambleType=="e666"){
      DrawNNN(6).draw(canvas, scramble);
    }
    else if(scrambleType=="e777"){
      DrawNNN(7).draw(canvas, scramble);
    }
    else if(scrambleType=="ePyram"){
      DrawPyram().draw(canvas, scramble);
    }
    else if(scrambleType=="eSkewb"){
      DrawSkewb().draw(canvas,scramble);
    }
    else if(scrambleType=="eMinx"){
      DrawMinx().draw(canvas,scramble);
    }
    else if(scrambleType=="eSq1"){
      DrawSq1().draw(canvas,scramble);
    }
    else if(scrambleType=="eClock"){
      DrawClock().draw(canvas,scramble);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DrawNNN{
  var cube;
  int size;
  DrawNNN(int size){
    this.size = size;
  }
  void r(f){
    turnFace(4);
    for(var i=0; i<f; i++) {
      for (var j=1; j<size+1; j++){
        var buffer = cube[1][size*j-1-i];
        cube[1][size*j-1- i] = cube[2][size*j-1-i];
        cube[2][size*j-1- i] = cube[3][size*j-1-i];
        cube[3][size*j-1- i] = cube[5][size*(size-j)+i];
        cube[5][size*(size-j)+i] = buffer;
      }
    }
  }
  void x([a]){
    turnFace(4);
    turnFace(0);
    turnFace(0);
    turnFace(0);
    var buffer = cube[1];
    cube[1]=cube[2];
    cube[2]=cube[3];
    cube[3]=cube[5];
    cube[5]=buffer;
    turnFace(5);
    turnFace(5);
    turnFace(3);
    turnFace(3);
  }
  void y([a]){
    turnFace(1);
    turnFace(3);
    turnFace(3);
    turnFace(3);
    var buffer = cube[0];
    cube[0]=cube[2];
    cube[2]=cube[4];
    cube[4]=cube[5];
    cube[5]=buffer;
  }
  void z([a]){
    turnFace(2);
    turnFace(5);
    turnFace(5);
    turnFace(5);
    var buffer = cube[1];
    cube[1]=cube[0];
    cube[0]=cube[3];
    cube[3]=cube[4];
    cube[4]=buffer;
    turnFace(1);
    turnFace(4);
    turnFace(0);
    turnFace(3);
  }
  void l(f){
    turnFace(0);
    for(var i=0; i<f; i++) {
      for (var j=0; j<size; j++){
        var buffer = cube[1][size*j+i];
        cube[1][size*j+i] = cube[5][size*(size-j)-i-1];
        cube[5][size*(size-j)-i-1] = cube[3][size*j+i];
        cube[3][size*j+i] = cube[2][size*j+i];
        cube[2][size*j+i] = buffer;
      }

    }

  }
  void u(f){
    turnFace(1);
    for(var i=0; i<f; i++) {
      for (var j=0; j<size; j++){
        var buffer = cube[0][size*i+j];
        cube[0][size*i+j] = cube[2][size*i+j];
        cube[2][size*i+j] = cube[4][size*i+j];
        cube[4][size*i+j] = cube[5][size*i+j];
        cube[5][size*i+j] = buffer;
      }
    }
  }
  void d(f){
    turnFace(3);
    for(var i=0; i<f; i++) {
      for (var j=0; j<size; j++){
        var buffer = cube[0][size*(size-i)-1-j];
        cube[0][size*(size-i)-1-j] = cube[5][size*(size-i)-1-j];
        cube[5][size*(size-i)-1-j] = cube[4][size*(size-i)-1-j];
        cube[4][size*(size-i)-1-j] = cube[2][size*(size-i)-1-j];
        cube[2][size*(size-i)-1-j] = buffer;
      }
    }
  }
  void f(f){
    turnFace(2);
    for(var i=0; i<f; i++) {
      for (var j=0; j<size; j++){
        var buffer = cube[1][size*(size-i)-j-1];
        cube[1][size*(size-i)-j-1] = cube[0][size*(j+1)-i-1];
        cube[0][size*(j+1)-i-1] = cube[3][i*size+j];
        cube[3][i*size+j] = cube[4][size*(size-j-1)+i];
        cube[4][size*(size-j-1)+i] = buffer;
      }
    }
  }
  void b(f){
    turnFace(5);
    for(var i=0; i<f; i++) {
      for (var j=0; j<size; j++){
        var buffer = cube[1][size*(i+1)-j-1];
        cube[1][size*(i+1)-j-1] = cube[4][size*(size-j)-i-1];
        cube[4][size*(size-j)-i-1] = cube[3][size*(size-i-1)+j];
        cube[3][size*(size-i-1)+j] = cube[0][size*j+i];
        cube[0][size*j+i] = buffer;
      }
    }
  }
  void turnFace(face){
    //corners
    var buffer = cube[face][0];
    cube[face][0] = cube[face][size*(size-1)];
    cube[face][size*(size-1)] = cube[face][size*size-1];
    cube[face][size*size-1] = cube[face][size-1];
    cube[face][size-1] = buffer;
    //edges
    for(var i=0; i<size-2; i++){
      buffer = cube[face][i+1];
      cube[face][i+1] = cube[face][size*(size-2-i)];
      cube[face][size*(size-2-i)] = cube[face][size*size-2-i];
      cube[face][size*size-2-i] = cube[face][size*(i+2)-1];
      cube[face][size*(i+2)-1]=buffer;
    }
    //centers
    for(var i=0; i<(size/2).floor()-1; i++){
      for(var j=0; j<size-1-2*(i+1); j++){
        buffer = cube[face][size*(i+1)+j+i+1];
        cube[face][size*(i+1)+j+i+1] = cube[face][size*(size-2-i-j)+i+1];
        cube[face][size*(size-2-i-j)+i+1] = cube[face][size*(size-1-i)-2-j-i];
        cube[face][size*(size-1-i)-2-j-i] = cube[face][size*(j+2+i)-2-i];
        cube[face][size*(j+2+i)-2-i] = buffer;
      }
    }
  }
  bool isSolved(s,seq){
    size = s;
    var moves = {
      "R": r,
      "L": l,
      "U": u,
      "D": d,
      "F": f,
      "B": b,
      "x": x,
      "y": y,
      "z": z,
    };
    cube = List(6);
    for(var i=0; i<6; i++){
      cube[i] = List(size*size);
    }
    for(var i=0; i<size*size; i++){
      cube[0][i]=0;
      cube[1][i]=1;
      cube[2][i]=2;
      cube[3][i]=3;
      cube[4][i]=4;
      cube[5][i]=5;
    }
    seq = seq.split(" ");
    for(var i=0; i<seq.length; i++){
      var layers;
      var move = seq[i];
      var direction;
      if(move!=""){
        if(move[0]=="3" || move[0]=="4" || move[0]=="5" || move[0]=="6" || move[0]=="7" || move[0]=="8"){layers=int.parse(move[0]);}
        else if(move.length > 1 && move[1]=="w"){layers = 2;}
        else{layers=1;}
        if(move.indexOf("'")>-1){direction=3;}
        else if(move.indexOf("2")>-1){direction=2;}
        else{direction=1;}
        for(var j=0; j<direction; j++){
          var face;
          if(layers>2){
            face = move[1];
          }
          else{
            face = move[0];
          }
          if(move!="") {
            moves[face](layers);
          }
        }}
    }
    for(int i=0; i<cube.length; i++){
      int color = cube[i][0];
      for(int j=0; j<cube[i].length; j++){
        if(cube[i][j]!=color){
          return false;
        }
      }
    }
    return true;
  }
  void draw(Canvas canvas, String scramble) {
    List<Color> colors = [
      Colors.orange,
      Colors.white,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.blue,
      Colors.black
    ];
    Map<String, Function> moves = {
      "R": r,
      "L": l,
      "U": u,
      "D": d,
      "F": f,
      "B": b,
      "x": x,
      "y": y,
      "z": z,
    };
    cube = List(6);
    for (var i = 0; i < 6; i++) {
      cube[i] = List(size * size);
    }
    for (var i = 0; i < size * size; i++) {
      cube[0][i] = 0;
      cube[1][i] = 1;
      cube[2][i] = 2;
      cube[3][i] = 3;
      cube[4][i] = 4;
      cube[5][i] = 5;
    }
    List<String> seq = scramble.split(" ");
    for (var i = 0; i < seq.length; i++) {
      var layers;
      var move = seq[i];
      var direction;
      if (move != "") {
        if (move[0] == "3" || move[0] == "4" || move[0] == "5" ||
            move[0] == "6" || move[0] == "7" || move[0] == "8") {
          layers = int.parse(move[0]);
        }
        else if (move.length > 1 && move[1] == "w") {
          layers = 2;
        }
        else {
          layers = 1;
        }
        if (move.indexOf("'") > -1) {
          direction = 3;
        }
        else if (move.indexOf("2") > -1) {
          direction = 2;
        }
        else {
          direction = 1;
        }
        for (var j = 0; j < direction; j++) {
          var face;
          if (layers > 2) {
            face = move[1];
          }
          else {
            face = move[0];
          }
          if (move != "") {
            moves[face](layers);
          }
        }
      }
    }
    final paint = Paint();
    Rect rect;
    paint.strokeWidth = 2;
    for (var i = 0; i < size * size; i++) {
      rect = Rect.fromLTWH(3 + i % size * 60 / size, 65 + (i / size).floor() * 60 / size,60 / size, 60 / size);
      paint.color = colors[cube[0][i]];
      paint.style = PaintingStyle.fill;
      canvas.drawRect(rect, paint);
      paint.color = colors[6];
      paint.style = PaintingStyle.stroke;
      canvas.drawRect(rect, paint);
      rect = Rect.fromLTWH(65 + i % size * 60 / size, 3 + (i / size).floor() * 60 / size, 60 / size, 60 / size);
      paint.color = colors[cube[1][i]];
      paint.style = PaintingStyle.fill;
      canvas.drawRect(rect, paint);
      paint.color = colors[6];
      paint.style = PaintingStyle.stroke;
      canvas.drawRect(rect, paint);
      rect = Rect.fromLTWH(65 + i % size * 60 / size, 65 + (i / size).floor() * 60 / size, 60 / size, 60 / size);
      paint.color = colors[cube[2][i]];
      paint.style = PaintingStyle.fill;
      canvas.drawRect(rect, paint);
      paint.color = colors[6];
      paint.style = PaintingStyle.stroke;
      canvas.drawRect(rect, paint);
      rect = Rect.fromLTWH(65 + i % size * 60 / size, 65 + 62 + (i / size).floor() * 60 / size, 60 / size, 60 / size);
      paint.color = colors[cube[3][i]];
      paint.style = PaintingStyle.fill;
      canvas.drawRect(rect, paint);
      paint.color = colors[6];
      paint.style = PaintingStyle.stroke;
      canvas.drawRect(rect, paint);
      rect = Rect.fromLTWH(65 + 62 + i % size * 60 / size, 65 + (i / size).floor() * 60 / size, 60 / size, 60 / size);
      paint.color = colors[cube[4][i]];
      paint.style = PaintingStyle.fill;
      canvas.drawRect(rect, paint);
      paint.color = colors[6];
      paint.style = PaintingStyle.stroke;
      canvas.drawRect(rect, paint);
      rect = Rect.fromLTWH(65 + 62 + 62 + i % size * 60 / size, 65 + (i / size).floor() * 60 / size, 60 / size, 60 / size);
      paint.color = colors[cube[5][i]];
      paint.style = PaintingStyle.fill;
      canvas.drawRect(rect, paint);
      paint.color = colors[6];
      paint.style = PaintingStyle.stroke;
      canvas.drawRect(rect, paint);
    }
  }
}
class DrawPyram{
  var buffer, cube;
  void u(){
    buffer = cube[0][0];
    cube[0][0] = cube[3][0];
    cube[3][0] = cube[2][4];
    cube[2][4] = buffer;
  }
  void r(){
    buffer = cube[0][8];
    cube[0][8]=cube[1][4];
    cube[1][4]=cube[3][8];
    cube[3][8]=buffer;
  }
  void b(){
    buffer = cube[2][0];
    cube[2][0]=cube[3][4];
    cube[3][4]=cube[1][8];
    cube[1][8]=buffer;
  }
  void l(){
    buffer = cube[0][4];
    cube[0][4]=cube[2][8];
    cube[2][8]=cube[1][0];
    cube[1][0]=buffer;
  }
  void U(){
    u();
    buffer = cube[0][1];
    cube[0][1]=cube[3][5];
    cube[3][5]=cube[2][2];
    cube[2][2]=buffer;
    buffer = cube[0][2];
    cube[0][2]=cube[3][1];
    cube[3][1]=cube[2][3];
    cube[2][3]=buffer;

    buffer = cube[0][3];
    cube[0][3]=cube[3][2];
    cube[3][2]=cube[2][7];
    cube[2][7]=buffer;
  }
  void R(){
    r();
    buffer = cube[0][3];
    cube[0][3] = cube[1][2];
    cube[1][2] = cube[3][7];
    cube[3][7] = buffer;
    buffer = cube[0][7];
    cube[0][7] = cube[1][3];
    cube[1][3] = cube[3][6];
    cube[3][6] = buffer;
    buffer = cube[0][6];
    cube[0][6] = cube[1][7];
    cube[1][7] = cube[3][5];
    cube[3][5] = buffer;
  }
  void L(){
    l();
    buffer = cube[0][1];
    cube[0][1]=cube[2][5];
    cube[2][5]=cube[1][2];
    cube[1][2]=buffer;
    buffer = cube[0][5];
    cube[0][5]=cube[2][6];
    cube[2][6]=cube[1][1];
    cube[1][1]=buffer;
    buffer = cube[0][6];
    cube[0][6]=cube[2][7];
    cube[2][7]=cube[1][5];
    cube[1][5]=buffer;
  }
  void B(){
    b();
    buffer = cube[2][2];
    cube[2][2]=cube[3][7];
    cube[3][7]=cube[1][5];
    cube[1][5]=buffer;
    buffer = cube[2][1];
    cube[2][1]=cube[3][3];
    cube[3][3]=cube[1][6];
    cube[1][6]=buffer;
    buffer = cube[2][5];
    cube[2][5]=cube[3][2];
    cube[3][2]=cube[1][7];
    cube[1][7]=buffer;
  }
  tip(a){return a*Math.sqrt(3)/2;}
  void draw(Canvas canvas, String scramble){
    cube = [List(9),List(9),List(9),List(9)];//FDLR
    for(var i=0; i<9; i++){
      cube[0][i]=0;
      cube[1][i]=1;
      cube[2][i]=2;
      cube[3][i]=3;
    }
    var moves = {
      "R":R,
      "L":L,
      "B":B,
      "U":U,
      "r":r,
      "l":l,
      "b":b,
      "u":u
    };
    var colors = [Colors.green,Colors.yellow,Colors.red,Colors.blue,Colors.black];
    List<double> x=[0,70,3,140];
    List<double> y=[0,tip(120)+10,3,3];
    var seq = scramble.split(" ");
    for(var i=0; i<seq.length; i++){
      if(seq[i]!=""){
        moves[seq[i][0]]();
        if(seq[i].length==2){
          moves[seq[i][0]]();
        }
      }
    }
    final Paint fill = Paint();
    final Paint stroke = Paint()..strokeWidth=2..style=PaintingStyle.stroke..color = colors[4];
    Path path = Path();
    path.moveTo(130, 3);
    path.relativeLineTo(20, tip(40));
    path.relativeLineTo(-40, 0);
    path.close();
    fill.color = colors[cube[0][0]];
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
    path = Path();
    path.moveTo(110, tip(40)+3);
    path.relativeLineTo(20, tip(40));
    path.relativeLineTo(-40, 0);
    path.close();
    fill.color = colors[cube[0][1]];
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
    path = Path();
    path.moveTo(110, tip(40)+3);
    path.relativeLineTo(40, 0);
    path.relativeLineTo(-20, tip(40));
    path.close();
    fill.color = colors[cube[0][2]];
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
    path = Path();
    path.moveTo(150, tip(40)+3);
    path.relativeLineTo(20, tip(40));
    path.relativeLineTo(-40, 0);
    path.close();
    fill.color = colors[cube[0][3]];
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
    path = Path();
    path.moveTo(90, tip(80)+3);
    path.relativeLineTo(20, tip(40));
    path.relativeLineTo(-40, 0);
    path.close();
    fill.color = colors[cube[0][4]];
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
    path = Path();
    path.moveTo(130, tip(80)+3);
    path.relativeLineTo(20, tip(40));
    path.relativeLineTo(-40, 0);
    path.close();
    fill.color = colors[cube[0][6]];
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
    path = Path();
    path.moveTo(170, tip(80)+3);
    path.relativeLineTo(20, tip(40));
    path.relativeLineTo(-40, 0);
    path.close();
    fill.color = colors[cube[0][8]];
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
    path = Path();
    path.moveTo(90, tip(80)+3);
    path.relativeLineTo(40, 0);
    path.relativeLineTo(-20, tip(40));
    path.close();
    fill.color = colors[cube[0][5]];
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
    path = Path();
    path.moveTo(130, tip(80)+3);
    path.relativeLineTo(40, 0);
    path.relativeLineTo(-20, tip(40));
    path.close();
    fill.color = colors[cube[0][7]];
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);

    for (var i=1; i<4; i++) {
      path = Path();
      path.moveTo(x[i], y[i]);
      path.relativeLineTo(40, 0);
      path.relativeLineTo(-20, tip(40));
      path.close();
      fill.color = colors[cube[i][0]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+40, y[i]);
      path.relativeLineTo(40, 0);
      path.relativeLineTo(-20, tip(40));
      path.close();
      fill.color = colors[cube[i][2]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+80, y[i]);
      path.relativeLineTo(40, 0);
      path.relativeLineTo(-20, tip(40));
      path.close();
      fill.color = colors[cube[i][4]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+20, y[i]+tip(40));
      path.relativeLineTo(40, 0);
      path.relativeLineTo(-20, tip(40));
      path.close();
      fill.color = colors[cube[i][5]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+60, y[i]+tip(40));
      path.relativeLineTo(40, 0);
      path.relativeLineTo(-20, tip(40));
      path.close();
      fill.color = colors[cube[i][7]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+40, y[i]+tip(40)*2);
      path.relativeLineTo(40, 0);
      path.relativeLineTo(-20, tip(40));
      path.close();
      fill.color = colors[cube[i][8]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+40, y[i]);
      path.relativeLineTo(20, tip(40));
      path.relativeLineTo(-40, 0);
      path.close();
      fill.color = colors[cube[i][1]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+80, y[i]);
      path.relativeLineTo(20, tip(40));
      path.relativeLineTo(-40, 0);
      path.close();
      fill.color = colors[cube[i][3]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+60, y[i]+tip(40));
      path.relativeLineTo(20, tip(40));
      path.relativeLineTo(-40, 0);
      path.close();
      fill.color = colors[cube[i][6]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
    }
  }

}
class DrawSkewb{
  var cube;
  var buffer;
  void r(){
    buffer = cube[4][4];
    cube[4][4]=cube[3][4];
    cube[3][4]=cube[5][3];
    cube[5][3]=buffer;
    buffer = cube[4][2];
    cube[4][2] = cube[3][2];
    cube[3][2] = cube[5][2];
    cube[5][2] = buffer;
    buffer = cube[4][1];
    cube[4][1] = cube[3][1];
    cube[3][1] = cube[5][4];
    cube[5][4] = buffer;
    buffer = cube[4][3];
    cube[4][3] = cube[3][3];
    cube[3][3] = cube[5][0];
    cube[5][0] = buffer;
    buffer = cube[2][4];
    cube[2][4] = cube[0][3];
    cube[0][3] = cube[1][1];
    cube[1][1] = buffer;
  }
  void l(){
    buffer = cube[2][3];
    cube[2][3] = cube[0][4];
    cube[0][4] = cube[3][0];
    cube[3][0]=buffer;
    buffer = cube[2][2];
    cube[2][2] = cube[0][2];
    cube[0][2] = cube[3][2];
    cube[3][2] = buffer;
    buffer = cube[2][0];
    cube[2][0] = cube[0][3];
    cube[0][3] = cube[3][1];
    cube[3][1] = buffer;
    buffer=cube[2][4];
    cube[2][4] =cube[0][1];
    cube[0][1] = cube[3][3];
    cube[3][3] = buffer;
    buffer = cube[1][3];
    cube[1][3] = cube[5][4];
    cube[5][4] = cube[4][3];
    cube[4][3] = buffer;
  }
  void u(){
    buffer = cube[1][0];
    cube[1][0]=cube[5][1];
    cube[5][1]=cube[0][0];
    cube[0][0]=buffer;
    buffer = cube[1][2];
    cube[1][2]=cube[5][2];
    cube[5][2]=cube[0][2];
    cube[0][2]=buffer;
    buffer = cube[1][1];
    cube[1][1]=cube[5][4];
    cube[5][4]=cube[0][1];
    cube[0][1]=buffer;
    buffer = cube[1][3];
    cube[1][3]=cube[5][0];
    cube[5][0]=cube[0][3];
    cube[0][3]=buffer;
    buffer = cube[2][0];
    cube[2][0]=cube[4][1];
    cube[4][1]=cube[3][3];
    cube[3][3]=buffer;
  }
  void b(){
    buffer = cube[5][4];
    cube[5][4]=cube[3][3];
    cube[3][3]=cube[0][3];
    cube[0][3]=buffer;
    buffer = cube[5][2];
    cube[5][2]=cube[3][2];
    cube[3][2]=cube[0][2];
    cube[0][2]=buffer;
    buffer = cube[5][1];
    cube[5][1]=cube[3][4];
    cube[3][4]=cube[0][4];
    cube[0][4]=buffer;
    buffer = cube[5][3];
    cube[5][3]=cube[3][0];
    cube[3][0]=cube[0][0];
    cube[0][0]=buffer;
    buffer = cube[1][0];
    cube[1][0]=cube[4][4];
    cube[4][4]=cube[2][3];
    cube[2][3]=buffer;
  }
  String draw(Canvas canvas, String scramble){
    List<Color> colors = [
      Colors.orange,
      Colors.white,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.blue,
      Colors.black
    ];
    List<double> x = [3,65,65,65,127,189];
    List<double> y = [65,3,65,127,65,65];
    var moves = {
      "R": r,
      "L": l,
      "U": u,
      "B": b
    };
    cube = [[0,0,0,0,0],[1,1,1,1,1],[2,2,2,2,2],[3,3,3,3,3],[4,4,4,4,4],[5,5,5,5,5]];
    List<String> seq = scramble.split(" ");
    for(var i=0; i<seq.length; i++){
      if(seq[i]!=""){
        moves[seq[i][0]]();
        if(seq[i].length==2){
          moves[seq[i][0]]();
        }
      }
    }
    final Paint fill = Paint();
    final Paint stroke = Paint()..strokeWidth=2..style=PaintingStyle.stroke..color = colors[6];
    Path path;
    for(var i=0; i<6; i++){
      path = Path();
      path.moveTo(x[i]+30, y[i]);
      path.relativeLineTo(30, 30);
      path.relativeLineTo(-30,30);
      path.relativeLineTo(-30,-30);
      path.close();
      fill.color = colors[cube[i][2]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i], y[i]);
      path.relativeLineTo(30, 0);
      path.relativeLineTo(-30,30);
      path.close();
      fill.color = colors[cube[i][0]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+60, y[i]);
      path.relativeLineTo(0, 30);
      path.relativeLineTo(-30,-30);
      path.close();
      fill.color = colors[cube[i][1]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i], y[i]+60);
      path.relativeLineTo(30, 0);
      path.relativeLineTo(-30,-30);
      path.close();
      fill.color = colors[cube[i][3]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      path = Path();
      path.moveTo(x[i]+60, y[i]+60);
      path.relativeLineTo(-30, 0);
      path.relativeLineTo(30,-30);
      path.close();
      fill.color = colors[cube[i][4]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
    }
  }
}
class DrawMinx{
  var cube,buffer,i,j,offsetX,offsetY;
  sin(a){return Math.sin(a*Math.pi/180);}
  cos(a){return Math.cos(a*Math.pi/180);}
  double pair(a,b){return (cos(a)*b+offsetX[j]*4/5);}
  double pair2(a,b){return sin(a)*b+offsetY[j]*4/5;}
  void U(){
    buffer = cube[0][0];
    cube[0][0]=cube[0][2];
    cube[0][2]=cube[0][4];
    cube[0][4]=cube[0][6];
    cube[0][6]=cube[0][8];
    cube[0][8]=buffer;
    buffer = cube[0][1];
    cube[0][1]=cube[0][3];
    cube[0][3]=cube[0][5];
    cube[0][5]=cube[0][7];
    cube[0][7]=cube[0][9];
    cube[0][9]=buffer;
    buffer=cube[1][0];
    cube[1][0]=cube[5][0];
    cube[5][0]=cube[4][0];
    cube[4][0]=cube[3][0];
    cube[3][0]=cube[2][0];
    cube[2][0]=buffer;
    buffer=cube[1][1];
    cube[1][1]=cube[5][1];
    cube[5][1]=cube[4][1];
    cube[4][1]=cube[3][1];
    cube[3][1]=cube[2][1];
    cube[2][1]=buffer;
    buffer=cube[1][3];
    cube[1][3]=cube[5][3];
    cube[5][3]=cube[4][3];
    cube[4][3]=cube[3][3];
    cube[3][3]=cube[2][3];
    cube[2][3]=buffer;
  }
  void rotateFace(face){
    buffer = cube[face][0];
    cube[face][0]=cube[face][2];
    cube[face][2]=cube[face][4];
    cube[face][4]=cube[face][6];
    cube[face][6]=cube[face][8];
    cube[face][8]=buffer;
    buffer = cube[face][1];
    cube[face][1]=cube[face][3];
    cube[face][3]=cube[face][5];
    cube[face][5]=cube[face][7];
    cube[face][7]=cube[face][9];
    cube[face][9]=buffer;
  }
  void rotateCounter(face){
    rotateFace(face);
    rotateFace(face);
    rotateFace(face);
    rotateFace(face);
  }
  void Ui(){
    U();
    U();
    U();
    U();
  }
  void D(){
    U();
    buffer = cube[0][0];
    cube[0][0]=cube[0][8];
    cube[0][8]=cube[0][6];
    cube[0][6]=cube[0][4];
    cube[0][4]=cube[0][2];
    cube[0][2]=buffer;
    buffer = cube[0][1];
    cube[0][1]=cube[0][9];
    cube[0][9]=cube[0][7];
    cube[0][7]=cube[0][5];
    cube[0][5]=cube[0][3];
    cube[0][3]=buffer;
    buffer = cube[1];
    cube[1]=cube[2];
    cube[2]=cube[3];
    cube[3]=cube[4];
    cube[4]=cube[5];
    cube[5]=buffer;
    buffer = cube[7];
    cube[7]=cube[11];
    cube[11]=cube[10];
    cube[10]=cube[9];
    cube[9]=cube[8];
    cube[8]=buffer;
    buffer = cube[6][0];
    cube[6][0]=cube[6][2];
    cube[6][2]=cube[6][4];
    cube[6][4]=cube[6][6];
    cube[6][6]=cube[6][8];
    cube[6][8]=buffer;
    buffer = cube[6][1];
    cube[6][1]=cube[6][3];
    cube[6][3]=cube[6][5];
    cube[6][5]=cube[6][7];
    cube[6][7]=cube[6][9];
    cube[6][9]=buffer;
  }
  void Dp(){
    D();
    D();
  }
  void Dm(){
    D();
    D();
    D();
  }
  void R(){
    buffer=cube[0][0];
    cube[0][0]=cube[1][0];
    cube[1][0]=cube[11][4];
    cube[11][4]=cube[10][2];
    cube[10][2]=cube[3][6];
    cube[3][6]=buffer;
    buffer=cube[0][10];
    cube[0][10]=cube[1][10];
    cube[1][10]=cube[11][10];
    cube[11][10]=cube[10][10];
    cube[10][10]=cube[3][10];
    cube[3][10]=buffer;
    buffer=cube[0][4];
    cube[0][4]=cube[1][4];
    cube[1][4]=cube[11][8];
    cube[11][8]=cube[10][6];
    cube[10][6]=cube[3][0];
    cube[3][0]=buffer;
    buffer=cube[0][1];
    cube[0][1]=cube[1][1];
    cube[1][1]=cube[11][5];
    cube[11][5]=cube[10][3];
    cube[10][3]=cube[3][7];
    cube[3][7]=buffer;
    buffer=cube[0][8];
    cube[0][8]=cube[1][8];
    cube[1][8]=cube[11][2];
    cube[11][2]=cube[10][0];
    cube[10][0]=cube[3][4];
    cube[3][4]=buffer;
    buffer=cube[0][9];
    cube[0][9]=cube[1][9];
    cube[1][9]=cube[11][3];
    cube[11][3]=cube[10][1];
    cube[10][1]=cube[3][5];
    cube[3][5]=buffer;
    buffer=cube[0][6];
    cube[0][6]=cube[1][6];
    cube[1][6]=cube[11][0];
    cube[11][0]=cube[10][8];
    cube[10][8]=cube[3][2];
    cube[3][2]=buffer;
    buffer=cube[0][7];
    cube[0][7]=cube[1][7];
    cube[1][7]=cube[11][1];
    cube[11][1]=cube[10][9];
    cube[10][9]=cube[3][3];
    cube[3][3]=buffer;
    buffer = cube[5];
    cube[5]=cube[7];
    cube[7]=cube[6];
    cube[6]=cube[9];
    cube[9]=cube[4];
    cube[4]=buffer;
    rotateFace(8);
    rotateFace(4);
    rotateFace(5);
    rotateFace(5);
    rotateFace(5);
    rotateCounter(7);
    rotateCounter(7);
    rotateCounter(7);
    rotateFace(6);
    rotateCounter(9);
    rotateCounter(9);
  }
  void Rp(){
    R();
    R();
  }
  void Rm(){
    R();
    R();
    R();
  }
  void draw(Canvas canvas, String scramble){
    offsetX = [100,100,44,65,134.5,156,268,233,212,268,324,302.5];//pink is 212,99.5,-18
    offsetY = [80,139,99,32,32,98,98,146,79.5,39,79.5,146];
    var angles=[-90,-54,18,90,162,234,90,-18,54,126,198,270];
    var moves = {
      "U": U,
      "U'": Ui,
      "R++": Rp,
      "R--": Rm,
      "D++": Dp,
      "D--":Dm,
    };
    cube = List(12);
    for(i=0; i<12; i++){
      cube[i]=List(11);
      for(j=0; j<11; j++){
        cube[i][j]=i;
      }
      //cube[i][0]=12;
    }
    var colors = [Color(0xffffffff),Color(0xFF006600),Color(0xFF8a1aff),Color(0xFFffcc00),Color(0xFF0000b3),Color(0xFFdd0000),Color(0xFF999999),Color(0xFFffffb3),Color(0xFFff99ff),Color(0xFF71e600),Color(0xFFff8433),Color(0xFF88ddff),Colors.black];
    var innerRad=19*4/5;
    var cornerHeight=36.5*4/5+0.5;
    var edgeHeight = 30*4/5+0.5;
    var edgeWidth =24*4/5+3;
    List<String> seq = scramble.split("\n").join(" ").split(" ");
    for(var k=0; k<seq.length; k++){
      var move = seq[k];
      if(move!=""){
        moves[move]();
      }
    }
    final Paint fill = Paint();
    final Paint stroke = Paint()..strokeWidth=2..style=PaintingStyle.stroke..color = colors[12];
    Path path;
    for(j=0; j<12; j++){
      var startAngle=angles[j];
      var edges=[startAngle,startAngle-72,startAngle-72*2,startAngle-72*3,startAngle-72*4,startAngle];
      path = Path();
      path.moveTo(pair(startAngle,innerRad), pair2(startAngle,innerRad));
      path.lineTo(pair(startAngle-72,innerRad), pair2(startAngle-72,innerRad));
      path.lineTo(pair(startAngle-72*2,innerRad),pair2(startAngle-72*2,innerRad));
      path.lineTo(pair(startAngle-72*3,innerRad),pair2(startAngle-72*3,innerRad));
      path.lineTo(pair(startAngle-72*4,innerRad),pair2(startAngle-72*4,innerRad));
      path.close();
      fill.color = colors[cube[j][10]];
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
      for(i=0; i<edges.length-1; i++){
        path = Path();
        path.moveTo(pair(edges[i],innerRad),pair2(edges[i],innerRad));
        path.lineTo(pair(edges[i+1],innerRad),pair2(edges[i+1],innerRad));
        path.lineTo(pair(edges[i+1]+edgeWidth,edgeHeight),pair2(edges[i+1]+edgeWidth,edgeHeight));
        path.lineTo(pair(edges[i]-edgeWidth,edgeHeight),pair2(edges[i]-edgeWidth,edgeHeight));
        path.close();
        fill.color = colors[cube[j][i*2]];
        canvas.drawPath(path, fill);
        canvas.drawPath(path, stroke);

        path = Path();
        path.moveTo(pair(edges[i],innerRad),pair2(edges[i],innerRad));
        path.lineTo(pair(edges[i]-edgeWidth,edgeHeight),pair2(edges[i]-edgeWidth,edgeHeight));
        path.lineTo(pair(edges[i],cornerHeight),pair2(edges[i],cornerHeight));
        path.lineTo(pair(edges[i]+edgeWidth,edgeHeight),pair2(edges[i]+edgeWidth,edgeHeight));
        path.close();
        fill.color = colors[cube[j][i*2+1]];
        canvas.drawPath(path, fill);
        canvas.drawPath(path, stroke);
      }
    }
  }
}
class DrawSq1{
  double offsetX=60;
  double offsetY=60;
  var edgeSize = 15;
  var buffer,cube;
  var z = 1;
  sin(a){return Math.sin(a*Math.pi/180);}
  cos(a){return Math.cos(a*Math.pi/180);}
  void U(t){
    for(var j=0;j<t; j++) {
      buffer = cube[0][0];
      for (var i = 0; i < 11; i++) {
        cube[0][i] = cube[0][i + 1];
      }
      cube[0][11] = buffer;
    }
  }
  void Ui(t){
    U(12-t);
  }
  void Di(t){
    for(var j=0;j<t; j++) {
      buffer = cube[1][0];
      for (var i = 0; i < 11; i++) {
        cube[1][i] = cube[1][i + 1];
      }
      cube[1][11] = buffer;
    }
  }
  void slash(){
    for(var i=0; i<6; i++){
      buffer = cube[0][i];
      cube[0][i]=cube[1][5-i];
      cube[1][5-i]=buffer;
    }
  }
  void D(t){
    Di(12-t);
  }
  double pair(a,b){return (cos(a)*b+offsetX);}
  double pair2(a,b){return (sin(a)*b+offsetY);}
  void draw(Canvas canvas, String scramble){
    offsetX=60;
    offsetY=60;
    edgeSize = 15;
    z = 1;
    cube = [[0,1,1,2,3,3,4,5,5,6,7,7],[8,9,9,10,11,11,12,13,13,14,15,15]];
    var sides = List<dynamic>(16);
    sides = [4,[4,2],2,[2,0],0,[0,5],5,[5,4],4,[2,4],2,[0,2],0,[5,0],5,[4,5]];
    List<String> seq = scramble.split(" ");
    var middle = true;
    for(var i=0; i<seq.length; i++){
      if(seq[i]=="/"){slash(); middle=!middle;}
      else if(seq[i]!=""){
        var split = seq[i].split(",");
        if(split[0].length==3){
          Ui(int.parse(split[0][2]));
        }
        else{
          U(int.parse(split[0][1]));
        }
        if(split[1].length==3){
          Di(int.parse(split[1][1]));
        }
        else{
          D(int.parse(split[1][0]));
        }
      }
    }
    List<Color> colors = [
      Colors.orange,
      Colors.white,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.blue,
      Colors.black
    ];
    final Paint fill = Paint();
    final Paint stroke = Paint()..strokeWidth=2..style=PaintingStyle.stroke..color = colors[6];
    Path path;
    for(var i=0; i<12; i++){
      if(cube[0][i]%2==0){
        fill.color = colors[(cube[0][i]/8).floor()==0 ? 3:1];
        path = edge1(i);
        canvas.drawPath(path, fill);
        canvas.drawPath(path, stroke);
        fill.color = colors[sides[cube[0][i]]];//
        path = edge2(i);
        canvas.drawPath(path, fill);
        canvas.drawPath(path, stroke);
        //
      }
      else{
        fill.color = colors[(cube[0][i]/8).floor()==0 ? 3:1];
        path = corner1(i);
        canvas.drawPath(path, fill);
        canvas.drawPath(path, stroke);
        fill.color = colors[sides[cube[0][i]][0]];
        path = corner2(i);
        canvas.drawPath(path, fill);
        canvas.drawPath(path, stroke);
        fill.color = colors[sides[cube[0][i]][1]];
        path = corner3(i);
        canvas.drawPath(path, fill);
        canvas.drawPath(path, stroke);
        i++;
      }
    }
    z=-1;
    offsetY+=120;

    for(var i=0; i<12; i++){
      if(cube[1][i]%2==0){
        fill.color = colors[(cube[1][i]/8).floor()==0 ? 3:1];
        path = edge1(i-1);
        canvas.drawPath(path,fill);
        canvas.drawPath(path,stroke);
        fill.color = colors[sides[cube[1][i]]];
        path = edge2(i-1);
        canvas.drawPath(path,fill);
        canvas.drawPath(path,stroke);
      }
      else{
        path = corner1(i);
        fill.color = colors[(cube[1][i]/8).floor()==0 ? 3:1];
        canvas.drawPath(path,fill);
        canvas.drawPath(path,stroke);
        path = corner2(i);
        fill.color = colors[sides[cube[1][i]][0]];
        canvas.drawPath(path,fill);
        canvas.drawPath(path,stroke);
        path = corner3(i);
        fill.color = colors[sides[cube[1][i]][1]];
        canvas.drawPath(path,fill);
        canvas.drawPath(path,stroke);
        i++;
      }
    }
    fill.color = colors[4];
    canvas.drawRect(Rect.fromLTWH(20,114,30,12),fill);
    canvas.drawRect(Rect.fromLTWH(20,114,30,12),stroke);
    if(middle){
      canvas.drawRect(Rect.fromLTWH(50,114,50,12),fill);
      canvas.drawRect(Rect.fromLTWH(50,114,50,12),stroke);
    }
    else{
      fill.color = colors[0];
      canvas.drawRect(Rect.fromLTWH(50,114,30,12),fill);
      canvas.drawRect(Rect.fromLTWH(50,114,30,12),stroke);
    }
  }

  Path edge1(position){
    var angle = (position*-30+75)*z;
    Path path = Path()
      ..moveTo(offsetX, offsetY)
      ..lineTo(pair(angle,30),pair2(angle,30))
      ..lineTo(pair(angle+30,30),pair2(angle+30,30))
      ..close();
    return path;
//    return Paper.path("M"+offsetX.toString()+" "+offsetY.toString()+"L"+pair(angle,30)+"L"+pair(angle+30,30)+"L"+offsetX.toString()+" "+offsetY.toString(),fill,null);
  }
  Path edge2(position){
    var angle = (position*-30+75)*z;
    Path path = Path()
      ..moveTo(pair(angle,30),pair2(angle,30))
      ..lineTo(pair(angle+30,30),pair2(angle+30,30))
      ..lineTo(pair(angle+30,40),pair2(angle+30,40))
      ..lineTo(pair(angle,40),pair2(angle,40))
      ..close();
    return path;
//    return Paper.path("M"+pair(angle,30)+"L"+pair(angle+30,30)+"L"+pair(angle+30,40)+"L"+pair(angle,40)+"L"+pair(angle,30),fill,null);
  }
  Path corner1(position){
    var angle  = (position*-30+75)*z;
    Path path = Path()
      ..moveTo(offsetX,offsetY)
      ..lineTo(pair(angle+30,30),pair2(angle+30,30))
      ..lineTo(pair(angle,41),pair2(angle,41))
      ..lineTo(pair(angle-30,30),pair2(angle-30,30))
      ..close();
    return path;
//    return Paper.path("M"+offsetX.toString()+" "+offsetY.toString()+"L"+pair(angle+30,30)+"L"+pair(angle,41)+"L"+pair(angle-30,30)+"L"+offsetX.toString()+" "+offsetY.toString(),fill,null);
  }
  Path corner2(position){
    var angle  = (position*-30+75)*z;
    Path path = Path()
      ..moveTo(pair(angle+30,30),pair2(angle+30,30))
      ..lineTo(pair(angle+30,40),pair2(angle+30,40))
      ..lineTo(pair(angle,55),pair2(angle,55))
      ..lineTo(pair(angle,41),pair2(angle,41))
      ..close();
    return path;
//    return Paper.path("M"+pair(angle+30,30)+"L"+pair(angle+30,40)+"L"+pair(angle,55)+"L"+pair(angle,41)+"L"+pair(angle+30,30),fill,null);
  }
  Path corner3(position){
    var angle  = (position*-30+75)*z;
    Path path = Path()
      ..moveTo(pair(angle-30,30),pair2(angle-30,30))
      ..lineTo(pair(angle-30,40),pair2(angle-30,40))
      ..lineTo(pair(angle,55),pair2(angle,55))
      ..lineTo(pair(angle,41),pair2(angle,41))
      ..close();
    return path;
//    return Paper.path("M"+pair(angle-30,30)+"L"+pair(angle-30,40)+"L"+pair(angle,55)+"L"+pair(angle,41)+"L"+pair(angle-30,30),fill,null);
  }
}
class DrawClock{
  var cube;
  double sin(a){return Math.sin(a*Math.pi/180);}
  double cos(a){return Math.cos(a*Math.pi/180);}
  void ur(t){
    for(var i=0; i<t; i++){
      cube[1][1]++;
      cube[1][2]++;
      cube[1][4]++;
      cube[1][5]++;
      cube[0][0]--;
    }
  }
  void dr(t){
    for(var i=0; i<t; i++){
      cube[1][5]++;
      cube[1][8]++;
      cube[1][4]++;
      cube[1][7]++;
      cube[0][6]--;
    }
  }
  void dl(t){
    for(var i=0; i<t; i++){
      cube[1][3]++;
      cube[1][6]++;
      cube[1][4]++;
      cube[1][7]++;
      cube[0][8]--;
    }
  }
  void ul(t){
    for(var i=0; i<t; i++){
      cube[1][0]++;
      cube[1][1]++;
      cube[1][4]++;
      cube[1][3]++;
      cube[0][2]--;
    }
  }
  void u(t,f){
    for(var i=0; i<t; i++){
      cube[f][0]++;
      cube[f][1]++;
      cube[f][2]++;
      cube[f][3]++;
      cube[f][4]++;
      cube[f][5]++;
      if(f==0){
        cube[1][0]--;
        cube[1][2]--;
      }
      else{
        cube[0][0]--;
        cube[0][2]--;
      }
    }
  }
  void r(t,f){
    for(var i=0; i<t; i++){
      cube[f][7]++;
      cube[f][1]++;
      cube[f][2]++;
      cube[f][8]++;
      cube[f][4]++;
      cube[f][5]++;
      if(f==0){
        cube[1][0]--;
        cube[1][6]--;
      }
      else{
        cube[0][0]--;
        cube[0][6]--;
      }
    }
  }
  void d(t,f){
    for(var i=0; i<t; i++){
      cube[f][3]++;
      cube[f][4]++;
      cube[f][5]++;
      cube[f][6]++;
      cube[f][7]++;
      cube[f][8]++;
      if(f==0){
        cube[1][8]--;
        cube[1][6]--;
      }
      else{
        cube[0][8]--;
        cube[0][6]--;
      }
    }
  }
  void l(t,f){
    for(var i=0; i<t; i++){
      cube[f][0]++;
      cube[f][1]++;
      cube[f][3]++;
      cube[f][4]++;
      cube[f][7]++;
      cube[f][6]++;
      if(f==0){
        cube[1][8]--;
        cube[1][2]--;
      }
      else{
        cube[0][8]--;
        cube[0][2]--;
      }
    }
  }
  void all(t,f){
    for(var i=0; i<t; i++){
      for(var j=0; j<9; j++){
        cube[f][j]++;
      }
      if(f==0){
        cube[1][0]--;
        cube[1][2]--;
        cube[1][6]--;
        cube[1][8]--;
      }
      else{
        cube[0][0]--;
        cube[0][2]--;
        cube[0][6]--;
        cube[0][8]--;
      }
    }
  }
  void draw(Canvas canvas, String scramble){
    cube = [[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    var pins = [0,0,0,0];
    var pinColors = [Color(0xFFf0f000),Color(0xFF805000)];
    List<String> seq = scramble.split(" ");
    var face = 1;
    for(var i=0; i<seq.length; i++) {
      var move = seq[i];
      if(move.indexOf("UR")>-1){
        if(move.length>3 && move[3]=="+"){
          ur(int.parse(move[2]));
        }
        else if(move.length>3 && move[3]=="-"){
          ur(12-int.parse(move[2]));
        }
        else{
          pins[0]=1;
        }
      }
      else if(move.indexOf("DR")>-1){
        if(move.length>3 && move[3]=="+"){
          dr(int.parse(move[2]));
        }
        else if(move.length>3 && move[3]=="-"){
          dr(12-int.parse(move[2]));
        }
        else{
          pins[1]=1;
        }
      }
      else if(move.indexOf("DL")>-1){
        if(move.length>3 && move[3]=="+"){
          dl(int.parse(move[2]));
        }
        else if(move.length>3 && move[3]=="-"){
          dl(12-int.parse(move[2]));
        }
        else{
          pins[2]=1;
        }
      }
      else if(move.indexOf("UL")>-1){
        if(move.length>3 && move[3]=="+"){
          ul(int.parse(move[2]));
        }
        else if(move.length>3 && move[3]=="-"){
          ul(12-int.parse(move[2]));
        }
        else{
          pins[3]=1;
        }
      }
      else if(move.indexOf("y2")>-1){
        face=0;
      }
      else if(move.indexOf("ALL")>-1){
        if(move[4]=="+"){
          all(int.parse(move[3]),face);
        }
        else{
          all(12-int.parse(move[3]),face);
        }
      }
      else if(move.indexOf("U")>-1){
        if(move[2]=="+"){
          u(int.parse(move[1]),face);
        }
        else{
          u(12-int.parse(move[1]),face);
        }
      }
      else if(move.indexOf("R")>-1){
        if(move[2]=="+"){
          r(int.parse(move[1]),face);
        }
        else{
          r(12-int.parse(move[1]),face);
        }
      }
      else if(move.indexOf("D")>-1){
        if(move[2]=="+"){
          d(int.parse(move[1]),face);
        }
        else{
          d(12-int.parse(move[1]),face);
        }
      }
      else if(move.indexOf("L")>-1){
        if(move[2]=="+"){
          l(int.parse(move[1]),face);
        }
        else{
          l(12-int.parse(move[1]),face);
        }
      }
    }

    final Paint fill = Paint();
    final Paint stroke = Paint()..strokeWidth=1..style=PaintingStyle.stroke..color = Color(0xFF000000);
    Rect rect;
    Path path;
    fill.color = Color(0xFF55ccff);
    rect = Rect.fromCenter(center: Offset(73,73),width:140,height:140);//,Color(0xFF000000));
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
    fill.color = Color(0xFF3375b2);
    rect = Rect.fromCenter(center: Offset(225,73),width:140,height:140);//,Color(0xFF000000));
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
    for(var i=0; i<9; i++){
      stroke.color = Color(0xFF000000);
      rect = Rect.fromCenter(center: Offset((i%3*35+38).toDouble(),(38+((i/3).floor())*35).toDouble()),width:15*2.0,height:15*2.0);
      fill.color = Color(0xFF3375b2);
      canvas.drawOval(rect, fill);
      canvas.drawOval(rect, stroke);
      rect = Rect.fromCenter(center: Offset((i%3*35+38).toDouble(),(38+((i/3).floor())*35).toDouble()),width:3*2.0,height:3*2.0);
      fill.color = Color(0xFFFFFF00);
      stroke.color = Color(0xFFFF0000);
      canvas.drawOval(rect, fill);
      canvas.drawOval(rect, stroke);
      var x = i%3*35+38;
      var y = ((i/3).floor())*35+38;
      var a = 360/12*-(cube[0][i]+6);
      path = Path();
      path.moveTo(x-sin(a+90)*3,y-cos(a+90)*3);
      path.lineTo(x+sin(a)*13, y+cos(a)*13);
      path.lineTo(x+sin(a+90)*3,y+cos(a+90)*3);
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
//      Paper.path("M"+(x-sin(a+90)*3).toString()+" "+(y-cos(a+90)*3).toString()+"L"+(x+sin(a)*13).toString()+" "+(y+cos(a)*13).toString()+"L"+(x+sin(a+90)*3).toString()+" "+(y+cos(a+90)*3).toString(),Color(0xFFFFFF00),Color(0xFFFF0000));
    }
    for(var i=0; i<9; i++){
      stroke.color = Color(0xFF000000);
      rect = Rect.fromCenter(center: Offset((i%3*35+191).toDouble(),(38+((i/3).floor())*35).toDouble()),width:15*2.0,height:2.0*15);
      fill.color = Color(0xFF55ccff);
      canvas.drawOval(rect,fill);
      canvas.drawOval(rect,stroke);
      stroke.color = Color(0xFFFF0000);
      rect = Rect.fromCenter(center: Offset((i%3*35+191).toDouble(),(38+((i/3).floor())*35).toDouble()),width:3*2.0,height:2.0*3);
      fill.color = Color(0xFFFFFF00);
      canvas.drawOval(rect,fill);
      canvas.drawOval(rect,stroke);
      var x = i%3*35+191;
      var y = ((i/3).floor())*35+38;
      var a = 360/12*-(cube[1][i]+6);
      path = Path();
      path.moveTo(x-sin(a+90)*3,y-cos(a+90)*3);
      path.lineTo(x+sin(a)*13,y+cos(a)*13);
      path.lineTo(x+sin(a+90)*3,y+cos(a+90)*3);
      fill.color = Color(0xFFFFFF00);
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
//      Paper.path("M"+(x-sin(a+90)*3).toString()+" "+(y-cos(a+90)*3).toString()+"L"+(x+sin(a)*13).toString()+" "+(y+cos(a)*13).toString()+"L"+(x+sin(a+90)*3).toString()+" "+(y+cos(a+90)*3).toString(),Color(0xFFFFFF00), Color(0xFFFF0000));
    }
    stroke.color = Color(0xFF000000);
    rect = Rect.fromCenter(center:Offset(55.0,55.0),width: 6.0,height:6.0);
    fill.color = pinColors[1-pins[3]];
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
    rect = Rect.fromCenter(center:Offset(91.0,55.0),width: 6.0,height:6.0);
    fill.color = pinColors[1-pins[0]];
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
    rect = Rect.fromCenter(center:Offset(55.0,91.0),width: 6.0,height:6.0);
    fill.color = pinColors[1-pins[2]];
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
    rect = Rect.fromCenter(center:Offset(91.0,91.0),width: 6.0,height:6.0);
    fill.color = pinColors[1-pins[1]];
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);

    rect = Rect.fromCenter(center:Offset(55+153.0,55.0),width: 6.0,height:6.0);
    fill.color = pinColors[pins[0]];
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
    rect = Rect.fromCenter(center:Offset(91+153.0,55.0),width: 6.0,height:6.0);
    fill.color = pinColors[pins[3]];
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
    rect = Rect.fromCenter(center:Offset(55+153.0,91.0),width: 6.0,height:6.0);
    fill.color = pinColors[pins[1]];
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
    rect = Rect.fromCenter(center:Offset(91+153.0,91.0),width: 6.0,height:6.0);
    fill.color = pinColors[pins[2]];
    canvas.drawOval(rect, fill);
    canvas.drawOval(rect, stroke);
  }
}