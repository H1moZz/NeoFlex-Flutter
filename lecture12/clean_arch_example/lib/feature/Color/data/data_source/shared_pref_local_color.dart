import 'package:clean_arch_example/feature/Color/data/data_source/localColordataSource.dart';
import 'package:clean_arch_example/feature/Color/domain/entity/colorFailure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefLocalColor implements Localcolordatasource{
  @override
  Future<Either<Colorfailure, String>> read() async{
    try{
      final prefs = await SharedPreferences.getInstance();

      return Right(prefs.getString('color') ?? '0xFFFFFFF');
    }
    catch(e)
    {
      return Left(Colorfailure(code: 1,message: e.toString()));
    }
  }
  
  @override
  Future<Either<Colorfailure, String>> write(String color)async {
    try{
      final prefs = await SharedPreferences.getInstance();

      prefs.setString('color',color);
      return Right(prefs.getString('color')?? '0xFFFFFFF');
    }
    catch(e)
    {
      return Left(Colorfailure(code: 1,message: e.toString()));
    }
  }
}