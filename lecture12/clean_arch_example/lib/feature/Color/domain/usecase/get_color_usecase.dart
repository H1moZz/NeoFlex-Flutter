import 'package:clean_arch_example/core/use_case/use_case.dart';
import 'package:clean_arch_example/feature/Color/domain/entity/colorEntity.dart';
import 'package:clean_arch_example/feature/Color/domain/entity/colorFailure.dart';
import 'package:clean_arch_example/feature/Color/domain/rep/color_rep.dart';
import 'package:dartz/dartz.dart';


class GetColorUsecase implements UseCaseNoParams<Colorentity>{

  final ColorRep colorRep;

  GetColorUsecase({required this.colorRep});

  @override
  Future<Either<Colorfailure, Colorentity>>call(){
    return colorRep.read();
  }

}