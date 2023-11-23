import 'screen_blank.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // removes the debug banner that hides the home button
      title: 'ACS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // deepPurple
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20), // size of hello
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.primary, // blue
          foregroundColor: Theme.of(context).colorScheme.onPrimary, // white
          titleTextStyle: TextStyle(
            color: Colors.white,  // Cambia esto al color que prefieras
            fontSize: 20,
          ),
        ),
        // see https://docs.flutter.dev/cookbook/design/themes
      ),
      home: const ScreenBlank(),
    );
  }
}
