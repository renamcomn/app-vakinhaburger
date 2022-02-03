
import 'package:flutter/material.dart';

class VakinhaUI {
  VakinhaUI._();

  static final ThemeData theme = ThemeData(
    primaryColor: Color(0XFF007D21),
    primaryColorDark: Color(0XFF00343F),
    fontFamily: 'mplus1',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Color(0XFF007D21),
        textStyle: TextStyle(fontFamily: 'mplus1')
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black),
      selectedLabelStyle: textbold,

      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(color: Colors.grey[400])
    )
  );

  static const TextStyle textbold = TextStyle(fontWeight: FontWeight.bold);
}