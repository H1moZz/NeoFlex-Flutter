import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainScreen.dart';
import 'package:flutter_application_1/SecondScreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Пример рабооты c навигацией во Flutter',
      home: MainScreen(),
      routes:{
        '/second': (context) => SecondScreen(),
      }
    );
  }
}
