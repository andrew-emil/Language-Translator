import 'package:flutter/material.dart';
import 'package:language_translator/app_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Translator Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff10223d),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff10223d)),
        useMaterial3: true,
      ),
      home: const AppPage(),
    );
  }
}
