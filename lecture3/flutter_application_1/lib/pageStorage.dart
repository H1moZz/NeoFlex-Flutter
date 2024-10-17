import 'package:flutter/material.dart';

class TabDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, 
    child: Scaffold(
      appBar: AppBar(
        title: Text('Пример сохранения скрола'),
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.settings))
          ]),

      ),
      body: TabBarView(
        children: [
          ListView.builder(
            key: const PageStorageKey('1'),
            itemCount: 50,
            itemBuilder: (context,index) => ListTile(
              title: Text("Index item $index")
            ),
          ),
          ListView.builder(
            key: const PageStorageKey('2'),
            itemCount: 50,
            itemBuilder: (context,index) => ListTile(
              title: Text("Index item $index")
            ), 
            )
        ])
    ));
  }
}
