import 'package:clean_arch_example/core/failure/failure.dart';

class Colorfailure extends Failure{
  Colorfailure({required super.code, super.message});
  
  @override
  String getLocalizedString() {
    return 'Error';
  }
}