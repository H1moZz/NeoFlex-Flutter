import 'package:flutter/material.dart';
import 'package:flutter_application_1/BloC.dart';
import 'package:flutter_application_1/ColorEvent.dart';
import 'package:flutter_application_1/ColorSate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ColorBloC(),
        child: Center(child: BlocBuilder<ColorBloC, ColorState>(
          builder: (context, state) {
            return Container(
              width: 200,
              height: 200,
              color: state.color,
              child: Column(
                children: [
                  Text(state.toString()),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloC>().add(NewRandomColorEvent());
                      },
                      child: const Text('Изменить цвет')),
                  ElevatedButton(
                    onPressed:(){
                      context.read<ColorBloC>().add(ResetColorEvent());
                    },
                    child: const Text('Стандартный цвет')),
                  ElevatedButton(
                    onPressed:(){
                      context.read<ColorBloC>().add(NewColorEvent(color: Colors.black));
                    },
                    child: const Text('Чёрный цвет'))
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}