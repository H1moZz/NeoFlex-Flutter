import 'package:flutter_application_1/basic_http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Album.dart';


void main() async{
  Album album = const Album(userId: 11, id: 101, title: 'testing post request');
  await album.sendAlbum();
  print('ID => ${album.id} \nTitle => ${album.title}');
}
