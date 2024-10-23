import 'dart:ui';

import 'package:flutter_application_1/Util.dart';
import 'package:flutter_application_1/cubit/ColorStateCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<ColorState>{
  ColorCubit(): super(ColorInitialState());

  void newColor(Color color){
    emit(ColorCurrentState(color));
  }
  void RandomColor(){
    emit(ColorCurrentState(Util.randomColor()));
  }
  void ResetColor(){
    emit(ColorInitialState());
  } 
}