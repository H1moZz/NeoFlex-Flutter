import 'package:clean_arch_example/feature/Color/data/data_source/localColordataSource.dart';
import 'package:clean_arch_example/feature/Color/domain/entity/colorEntity.dart';
import 'package:clean_arch_example/feature/Color/domain/entity/colorFailure.dart';
import 'package:clean_arch_example/feature/Color/domain/rep/color_rep.dart';
import 'package:dartz/dartz.dart';

class ColorRepImpl implements ColorRep{

final Localcolordatasource _localcolordatasource;

  ColorRepImpl({required Localcolordatasource localcolordatasource}) : _localcolordatasource = localcolordatasource;

  @override
  Future<Either<Colorfailure, Colorentity>> read() async {
    final res = await _localcolordatasource.read();

     return res.fold((failure) => Left(failure), (color) => Right(Colorentity(color: color)));
  }

  @override
  Future<Either<Colorfailure, Colorentity>> write(Colorentity color) async{
    final res = await _localcolordatasource.write(color.color);

     return res.fold((failure) => Left(failure), (color) => Right(Colorentity(color: color)));
  }

}