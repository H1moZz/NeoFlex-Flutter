import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _result = '';  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная страница'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.pushNamed(
                context,
                '/second',
                arguments: <String, String>{
                  'data': 'Это вторая страница',
                },
              );
              if (result != null) {
                setState(() {
                  _result = result as String; 
                });
              }
            },
            child: const Text('Перейти на вторую страницу'),
          ),
          const SizedBox(height: 20),
          Text(
            'Текст со 2 страницы: $_result',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
