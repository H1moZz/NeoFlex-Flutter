import 'package:clean_arch_example/core/di/conf_dep.dart';
import 'package:clean_arch_example/feature/Color/presentation/page/CubitPage.dart';
import 'package:flutter/material.dart';

void main() {
  conf_dep();
  runApp(const App());
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Cubitpage(),
        '/second': (context) => const Cubitpage(),
      },
    );
  }

}
