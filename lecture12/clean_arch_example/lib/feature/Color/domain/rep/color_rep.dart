import 'package:clean_arch_example/feature/Color/domain/entity/colorEntity.dart';
import 'package:clean_arch_example/feature/Color/domain/entity/colorFailure.dart';
import 'package:dartz/dartz.dart';

abstract class ColorRep {
  Future<Either<Colorfailure,Colorentity>> write(Colorentity color);
  Future<Either<Colorfailure,Colorentity>> read();
}