import 'package:flutter/material.dart';
import 'package:flutter_application_1/DB.dart';
import 'package:flutter_application_1/Doggy.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Dog fella1 = Dog(id: 1, name: 'Freddie', age: 3);
  Dog fella2 = Dog(id: 2, name: 'Bonny', age: 1);
  Dog fella3 = Dog(id: 3, name: 'Chica', age: 5);
  Dog fella4 = Dog(id: 3, name: 'Sigma', age: 5);
  await insertDog(fella1);
  await insertDog(fella2);
  await insertDog(fella3);
  await insertDog(fella4);
  List<Dog> all = await getAllDogs();
  for(var dog in all){
    print(dog.getInfo());
  }
  await deleteDog(1);
  all = await getAllDogs();
  for(var dog in all){
    print(dog.getInfo());
  }
}