import 'package:flutter/material.dart';
import 'package:nikecustomdesign/main_page.dart';
import 'package:nikecustomdesign/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: mainWhite,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}