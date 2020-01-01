//
//// How to use: Any Widget in the app can access the ThemeChanger
//// because it is an InheritedWidget. Then the Widget can call
//// themeChanger.theme = [blah] to change the theme. The ThemeChanger
//// then accesses AppThemeState by using the _themeGlobalKey, and
//// the ThemeChanger switches out the old ThemeData for the new
//// ThemeData in the AppThemeState (which causes a re-render).
//
//import 'package:flutter/material.dart';
//
//final _themeGlobalKey = new GlobalKey(debugLabel: 'app_theme');
//
//class AppTheme extends StatefulWidget {
//
//  final child;
//
//  AppTheme({
//    this.child,
//  }) : super(key: _themeGlobalKey);
//
//  @override
//  AppThemeState createState() => new AppThemeState();
//}
//
//class AppThemeState extends State<AppTheme> {
//
//  ThemeData _theme = DEV_THEME;
//
//  set theme(newTheme) {
//    if (newTheme != _theme) {
//      setState(() => _theme = newTheme);
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new ThemeChanger(
//      appThemeKey: _themeGlobalKey,
//      child: new Theme(
//        data: _theme,
//        child: widget.child,
//      ),
//    );
//  }
//}
//
//class ThemeChanger extends InheritedWidget {
//
//  static ThemeChanger of(BuildContext context) {
//    return context.inheritFromWidgetOfExactType(ThemeChanger);
//  }
//
//  final ThemeData theme;
//  final GlobalKey _appThemeKey;
//
//  ThemeChanger({
//    appThemeKey,
//    this.theme,
//    child
//  }) : _appThemeKey = appThemeKey, super(child: child);
//
//  set setBackgroundColor(Color color) {
//        (_appThemeKey.currentState as AppThemeState)?.theme = EXPERIMENT_THEME;
//    }
//  }
//
//  @override
//  bool updateShouldNotify(ThemeChanger oldWidget) {
//    return oldWidget.theme == theme;
//  }
//
//}