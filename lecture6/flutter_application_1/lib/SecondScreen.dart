import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget{
  @override
  SecondscreenState createState() => SecondscreenState();
}

class SecondscreenState extends State<SecondScreen>{
  final TextEditingController _controller = TextEditingController();
  String inputText = ''; 

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Второй экран'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,  
              decoration: const InputDecoration(
                labelText: 'Введите текст',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  inputText = text;  
                });
              }
            ),
            Text(
              args['data'] ?? 'Нет данных',
              style: const TextStyle(
                fontSize: 50,
              )
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop(inputText);
            }, child: Text('Вернуться обратно'))
          ],
        ),
        
      ),
    );
  }
}