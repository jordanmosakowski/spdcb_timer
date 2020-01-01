import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  Color colorPrimary;
  Color colorAccent;
  Color colorBackground;
  Color colorSecondP;
  Color colorSecondB;
  bool hasDoneInit;
  @override
  void initState() {
    super.initState();
    hasDoneInit = false;
  }

  updateTheme(){
    DynamicTheme.of(context).setThemeData(ThemeData(
        scaffoldBackgroundColor: colorBackground,
        textTheme: TextTheme(
            body1: TextStyle(
                color: colorPrimary
            ),
            title: TextStyle(
                color: colorPrimary
            )
        ),
        dialogBackgroundColor: colorBackground,
        dialogTheme: DialogTheme(
          contentTextStyle: TextStyle(
            color: colorPrimary,
          ),
        ),
        disabledColor: colorAccent,
        primaryColor: colorSecondB,
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: colorSecondP,
          ),
        ),
        primaryIconTheme: IconThemeData(
          color: colorSecondP,
        )
    ));
  }

  @override
  Widget build(BuildContext context) {
    if(!hasDoneInit){
      setState((){
        colorPrimary = Theme.of(context).textTheme.body1.color;
        colorBackground = Theme.of(context).scaffoldBackgroundColor;
        colorAccent = Theme.of(context).disabledColor;
        colorSecondP = Theme.of(context).primaryIconTheme.color;
        colorSecondB = Theme.of(context).primaryColor;
        hasDoneInit = true;
      });

    }
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).primaryIconTheme.color,
        ),
        title: Text("Settings"),
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.add),
//            color: Theme.of(context).primaryIconTheme.color,
//            onPressed: (){},
//          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ColorPickerButton("Text Color",colorPrimary,(Color color){colorPrimary=color;updateTheme();}),
          ColorPickerButton("Accent Text Color",colorAccent,(Color color){colorAccent=color;updateTheme();}),
          ColorPickerButton("Background Color",colorBackground,(Color color){colorBackground=color;updateTheme();}),
          ColorPickerButton("Secondary Text Color",colorSecondP,(Color color){colorSecondP=color;updateTheme();}),
          ColorPickerButton("Secondary Background Color",colorSecondB,(Color color){colorSecondB=color;updateTheme();}),
        ],
      )
    );
  }
}

class ColorPickerButton extends StatelessWidget {
  final Color initialColor;
  final Function(Color color) callback;
  final String text;
  ColorPickerButton(this.text,this.initialColor,this.callback);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("$text"),
      onPressed: (){
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text("Choose $text"),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: initialColor,
                onColorChanged: callback,
                enableLabel: false,
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Done'),
                onPressed: () {
//                        colorBackground = color;
//                        updateTheme();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
