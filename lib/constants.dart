import 'package:flutter/material.dart';

ThemeData baseTheme() {
  TextTheme _basicTextTheme() {
    return ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline5: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 12.0,
            color: Colors.grey,
          ),
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 14.0,
            color: Colors.blue[900],
          ),
          headline2: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 14.0,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(),
    primaryColor: Colors.blue[900],
    accentColor: Colors.purple,
    appBarTheme: AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'QuickSand',
              fontSize: 22.0,
            ),
          ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.purple,
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: CardTheme(
      elevation: 5,
      shadowColor: Colors.blue[900],
    ),
  );
}

const UnderlineInputBorder sTextFieldBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.purple,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(18.0),
  ),
);
