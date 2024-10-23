import 'package:clean_arch_example/feature/Color/domain/entity/colorEntity.dart';
import 'package:clean_arch_example/feature/Color/domain/usecase/get_color_usecase.dart';
import 'package:clean_arch_example/feature/Color/domain/usecase/save_color_usecase.dart';
import 'package:clean_arch_example/feature/Color/presentation/cubit/color_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<ColorState>{
  ColorCubit(this._saveColorUsecase, this._getColorUsecase):
   super(ColorCurrentState(
    color: Colors.transparent,
    isLoading: true
    )){
      getColor();
    }

  final SaveColorUsecase _saveColorUsecase;
  final GetColorUsecase _getColorUsecase;

  void getColor() async{
    emit(ColorCurrentState(color: state.color, isLoading: true));

    final res = await _getColorUsecase();

    res.fold((failure) => emit(ColorCurrentState(color: state.color , isLoading: false, error: failure.getLocalizedString())),
     (entity)=> emit(ColorCurrentState(color: Color(int.tryParse(entity.color)?? 0xFFFFFFF), isLoading: false)));
  }
  void setColor(Color color) async{
    emit(ColorCurrentState(color: state.color, isLoading: true));

    final res = await _saveColorUsecase(Colorentity(color: color.value.toString()));

    res.fold((failure) => emit(ColorCurrentState(color: state.color , isLoading: false, error: failure.getLocalizedString())),
     (entity)=> emit(ColorCurrentState(color: Color(int.tryParse(entity.color)?? 0xFFFFFFF), isLoading: false)));
  }

}