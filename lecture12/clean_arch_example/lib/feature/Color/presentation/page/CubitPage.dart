import 'package:clean_arch_example/feature/Color/presentation/cubit/color_cubit.dart';
import 'package:clean_arch_example/feature/Color/presentation/cubit/color_state.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Cubitpage extends StatelessWidget{
  const Cubitpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorCubit>.value(
      value: GetIt.I(),
      child:Scaffold(
        appBar: AppBar(title: const Text('БАЛЬШАЯ ПРОЕКТА')),
        body: SafeArea(
          child: BlocConsumer<ColorCubit, ColorState>(
          buildWhen: (prev, curr){
            return true;
          },
          builder: (context, state){

            if(state.isLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                if(state.error.isNotEmpty) Text('Error! ${state.error}'),
                Container(
                  width: 500,
                  height: 784,
                  color: state.color,
                  child: Column(
                    children: [
                      Text(state.color.toString()),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed('/second');
                        },
                        child: const Text('Xiao hong shu')),
                        ColorPicker(
                          color: state.color,
                          onColorChanged: (color){
                            context.read<ColorCubit>().setColor(color);
                          },
                        )
                    ],
                  ),
                )
              ],
            );
          },
          listener: (context, state){
            
          }))
          ),
      );
  }
}