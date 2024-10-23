import 'dart:io';
import 'package:clean_arch_example/feature/Color/data/data_source/localColordataSource.dart';
import 'package:clean_arch_example/feature/Color/domain/entity/colorFailure.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';

class Filelocalcolordatasource implements Localcolordatasource{
  @override
  Future<Either<Colorfailure, String>> read()async {
    try{
      final color = await readData();

      return Right(color);

    }
    catch(e){
      return Left(Colorfailure(code: 1,message: e.toString()));
    }
  }

  @override
  Future<Either<Colorfailure, String>> write(String color)async{
    try{
      await writeData(color);

      return Right(color);
    }
    catch(e){
      return Left(Colorfailure(code: 1,message: e.toString()));
    }
  }

  Future<String> get _localPath async{
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get _localFile async{
    final path = await _localPath;
    return File('$path/color.txt');
  }

  Future<void> writeData(String data)async{
    final file = await _localFile;

    await file.writeAsString(data);
  }

  Future<String> readData() async{
    final file = await _localFile;

    if (!file.existsSync()){
      file.writeAsString('0xFFFFFFF');
    }
    return await file.readAsString();
  }

}