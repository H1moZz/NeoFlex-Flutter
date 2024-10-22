import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MainApp1 extends StatefulWidget{
  MainApp createState() => MainApp();
}

class MainApp extends State<MainApp1> {

  late dynamic datafromserver;

  Future<http.Response> fetchAlbum(){
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

  Future<void> getalbumData() async{
    Response response = await fetchAlbum();
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('Data get successfully: ${jsonData}');
    } else {
      print('Failed to send data: ${response.statusCode}');
    }
    setState(() {
      datafromserver = jsonData['title'];
    });
  }

  @override void initState() {
    super.initState();
    getalbumData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(datafromserver.toString()),
        ),
      ),
    );
  }
}