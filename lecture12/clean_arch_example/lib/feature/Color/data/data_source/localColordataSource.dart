import 'package:clean_arch_example/feature/Color/domain/entity/colorFailure.dart';
import 'package:dartz/dartz.dart';

abstract class Localcolordatasource {
  Future<Either<Colorfailure, String>> write(String color);

  Future<Either<Colorfailure, String>> read();
}