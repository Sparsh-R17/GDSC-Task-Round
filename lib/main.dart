import 'package:flutter/material.dart';
import 'screens/body.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: const Color(0xFF0C002E),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff1e0368),
          secondary: const Color(0xff3600d0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff1e0368),
          ),
        ),
      ),
      home: const Body(),
    );
  }
}
