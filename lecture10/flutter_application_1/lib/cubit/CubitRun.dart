import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/ColorCubit.dart';
import 'package:flutter_application_1/cubit/ColorStateCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(MaterialApp(
    home: CubitPage()
  ));
}


class CubitPage extends StatelessWidget{
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ColorCubit(),
        child: Center(child: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
            return Container(
              width: 1000,
              height: 1000,
              color: state.color,
              child: Column(
                children: [
                  Text(state.toString()),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ColorCubit>().RandomColor();
                      },
                      child: const Text('Изменить цвет')),
                  ElevatedButton(
                    onPressed:(){
                      context.read<ColorCubit>().ResetColor();
                    },
                    child: const Text('Стандартный цвет')),
                  ElevatedButton(
                    onPressed:(){
                      context.read<ColorCubit>().newColor(Colors.black);
                    },
                    child: const Text('Чёрный цвет')),
                  ColorPicker(onColorChanged: (color){
                    context.read<ColorCubit>().newColor(color);
                  })
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}