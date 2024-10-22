import 'dart:convert';
import 'package:http/http.dart' as http;


class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  String getTitle(){
    return this.title;
  } 

  factory Album.fromJson(Map<String, dynamic> json){
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'], 
      );
  }

  static Future<Album> fetchAlbum() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200){
        return Album.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load album');
    }
  }

  Future<void> sendAlbum() async {
    final response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/albums'),body: jsonEncode(toJson()));
     if (response.statusCode == 201) {
      print('Sucsesfull');
    } 
    else {
    throw Exception('Failed to send album');
    }
  }
  Map<String, dynamic> toJson() => {'userId': userId, 'id': id, 'title': title};
}