import 'package:flutter_application_1/ColorEvent.dart';
import 'package:flutter_application_1/ColorSate.dart';
import 'package:flutter_application_1/Util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ColorBloC extends Bloc<ColorEvent, ColorState>{

  ColorBloC(): super(const ColorInitialState()){
    on<NewColorEvent>(
      OnNewColorEvent
    );
    on<NewRandomColorEvent>(
      OnNewRandomColorEvent
    );
    on<ResetColorEvent>(
      OnResetColorEvent
    );
  }

  void OnNewColorEvent(NewColorEvent event, Emitter<ColorState> emit){
    emit(ColorCurrentState(event.color));
  }
  void OnNewRandomColorEvent(NewRandomColorEvent event, Emitter<ColorState> emit){
    emit(ColorCurrentState(Util.randomColor()));
  }

  void OnResetColorEvent(ResetColorEvent event, Emitter<ColorState> emit){
    emit(const ColorInitialState());
  }

}

