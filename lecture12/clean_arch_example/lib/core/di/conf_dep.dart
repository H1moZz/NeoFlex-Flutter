import 'package:clean_arch_example/feature/Color/data/data_source/fileLocalColorDataSource.dart';
import 'package:clean_arch_example/feature/Color/data/data_source/localColordataSource.dart';
import 'package:clean_arch_example/feature/Color/data/data_source/shared_pref_local_color.dart';
import 'package:clean_arch_example/feature/Color/data/repository/color_rep_impl.dart';
import 'package:clean_arch_example/feature/Color/domain/rep/color_rep.dart';
import 'package:clean_arch_example/feature/Color/domain/usecase/get_color_usecase.dart';
import 'package:clean_arch_example/feature/Color/domain/usecase/save_color_usecase.dart';
import 'package:clean_arch_example/feature/Color/presentation/cubit/color_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

void conf_dep(){

  if(kIsWeb){
    GetIt.I.registerFactory<Localcolordatasource>(()=> SharedPrefLocalColor());
  }
  else{
    GetIt.I.registerFactory<Localcolordatasource>(()=> Filelocalcolordatasource());
  }
  
  GetIt.I.registerFactory<ColorRep>(()=> ColorRepImpl(localcolordatasource: GetIt.I()));

  GetIt.I.registerFactory(()=> GetColorUsecase(colorRep: GetIt.I()));

  GetIt.I.registerFactory(()=> SaveColorUsecase(colorRep: GetIt.I()));

  GetIt.I.registerLazySingleton<ColorCubit>(() => ColorCubit(GetIt.I(), GetIt.I()));

  
}