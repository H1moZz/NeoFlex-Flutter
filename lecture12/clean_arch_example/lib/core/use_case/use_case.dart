import 'package:clean_arch_example/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNoParams<Type>{
  Future<Either<Failure, Type>> call();
}