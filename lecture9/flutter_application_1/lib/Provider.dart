import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => AppData(backgroundColor: Colors.blue),
    child: MaterialApp(
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

class AppData with ChangeNotifier{
  Color backgroundColor;

  AppData({required this.backgroundColor});

  void changeBackgroundColor(Color newColor) {
    backgroundColor = newColor;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget{
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
          color: context.watch<AppData>().backgroundColor,
          child: Column(
            children: [
              Text(context.watch<AppData>().backgroundColor.toString()),
              ElevatedButton(
                onPressed:(){
                    context.read<AppData>().changeBackgroundColor(Util.randomColor());
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