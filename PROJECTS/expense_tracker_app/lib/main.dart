import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:expense_tracker_app/screens/start_screens.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 117, 38, 169),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 44, 0, 70),
  brightness: Brightness.dark,
);

void main() {
  WidgetsFlutterBinding(); 
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then(
    (fn) => {
      runApp(
        MaterialApp(
          darkTheme: ThemeData().copyWith(
            colorScheme: kDarkColorScheme,
            scaffoldBackgroundColor: kDarkColorScheme.background,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kDarkColorScheme.onSecondaryContainer,
              foregroundColor: kDarkColorScheme.primaryContainer,
            ),
            cardTheme: const CardTheme().copyWith(
              color: kDarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkColorScheme.primaryContainer),
            ),
            textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                      color: kColorScheme.onSecondaryContainer,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
          ),
          theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            scaffoldBackgroundColor: kColorScheme.background,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer,
            ),
            cardTheme: const CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.primaryContainer),
            ),
            textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                      color: kColorScheme.onSecondaryContainer,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
          ),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          home: const StartScreen(),
        ),
      ),
    },
  );
}
