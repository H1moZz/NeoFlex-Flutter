import 'package:flutter/material.dart';

final counterkey = GlobalKey<CounterState>();

class counterPage extends StatefulWidget{
  const counterPage({super.key});

  @override
  State<counterPage> createState() => _counterPageState();
}

class _counterPageState extends State<counterPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter =  ${counterkey.currentState?.counter ?? 0}')
      ),
      body: Center(
        child: Counter(key: counterkey)
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('${counterkey.currentState?.counter ?? 0}'),
        onPressed:(){
          setState(() {
            counterkey.currentState?.increment();
          });
        }
      ),
    );
    }
}



class Counter extends StatefulWidget{
  const Counter({super.key});
  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter>{

  int counter = 0;

  void increment(){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('$counter');
  }

}