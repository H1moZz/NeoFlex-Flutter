import 'package:flutter/material.dart';
 
final List<String> users = ["Хиханьки", "Хаханьки", "Котик", "Кiт", "Cat"];

void main() {
  runApp(MaterialApp(
    home: ListViewTest()
  ));
}

class ExpandedFlexTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
    padding: EdgeInsets.only(top:25),
    color: Colors.white,
    child:Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
              child: Container(color: Colors.teal),
              flex: 3,
          ),
          Expanded(
              child: Container(color: Colors.red),
              flex:1
          ),
          Expanded(
              child: Container(color: Colors.indigoAccent),
              flex: 2,
          )
        ]
      )
    );
  }
}

class ColumnFlexTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
    padding: EdgeInsets.only(top:25),
    color: Colors.white,
    child:Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.teal),
            flex:3
          ),
          Expanded(
              child: Container(color: Colors.red),
              flex:1
          ),
          Expanded(
              child: Container(color: Colors.indigoAccent),
              flex: 2,
          )
        ]
      )
    );
  }
}

class StackTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
    color: Colors.white,
    padding: EdgeInsets.only(top:40, bottom: 10, left: 20, right: 20),
    child: Stack(
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          color: Colors.blueGrey,
        ),
        Container(
          width: 160,
          height: 160,
          color: Colors.cyan,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ],
    )
  );
  }
}

class ListViewTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: users.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(
              color: Colors.red,
              thickness: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(users[index], style: TextStyle(fontSize: 22))
              );
            }
        ),
     );
  }
}