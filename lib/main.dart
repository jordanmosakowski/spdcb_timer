import 'package:flutter/material.dart';
import 'package:spdcb_timer_new/cubing_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPDCB Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPDCB Timer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    Icon(CubingIcons.e222),
                    Icon(CubingIcons.e333),
                    Icon(CubingIcons.e444),
                    Icon(CubingIcons.e555),
                    Icon(CubingIcons.e666),
                    Icon(CubingIcons.e777),
                    Icon(CubingIcons.ePyram),
                    Icon(CubingIcons.eMinx),
                    Icon(CubingIcons.eSkewb),
                    Icon(CubingIcons.eClock),
                    Icon(CubingIcons.eSq1),
                  ],
                ),
                Center(child: Text("B' R' F2 L2 D2 L B2 R B2 R' F2 R2 B2 U B2 L B2 L' U B'"))
              ],
            ),
          ),
          Center(
            child: Text(
                "0.000",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
