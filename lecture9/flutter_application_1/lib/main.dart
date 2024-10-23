import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(AppDataProvider(
    appData: AppData(backgroundColor: Colors.red),
    child: const MaterialApp(
      home: HomePage(),
    ),
  ));
}

class AppDataProvider extends InheritedWidget {
   const AppDataProvider(
      {required this.appData, required super.child, super.key});

  final AppData appData;

  static AppDataProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataProvider>();

  @override
  bool updateShouldNotify(AppDataProvider oldWidget) {
    return true;
  }
}

class AppData {
  Color backgroundColor;

  AppData({required this.backgroundColor});

  void changeBackgroundColor(Color newColor) {
    backgroundColor = newColor;
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Домашняя страница'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: AppDataProvider.of(context)?.appData.backgroundColor,
          child: Column(
            children: [
              Text(AppDataProvider.of(context)?.appData.backgroundColor.toString() ?? 'цвета нету(('),
              ElevatedButton(
                onPressed:(){
                  setState((){
                    AppDataProvider.of(context)?.appData.changeBackgroundColor(Util.randomColor());
                  });
                },
                child: const Text('Изменить цвет'))
            ],
          ),
        ),
      )
    );
  }
}

class Util {
  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff));
  }
}