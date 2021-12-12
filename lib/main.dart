import 'package:flutter/material.dart';
import 'package:grocerylist/additem.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  List<Widget> list = new List<Widget>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(this.list,title: 'Grocery List'),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage(this.list, {Key key, this.title}) : super(key: key);
  List<Widget> list;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _incrementCounter() {
  //   setState(() {
  //     widget.list.add(
  //       ListTile(
  //         leading: Icon(Icons.add_shopping_cart),
  //         title:Text("Spinach"),
  //         subtitle: Text("Qty: 20"),
  //         trailing: IconButton(
  //           icon: Icon(Icons.delete),
  //           tooltip: "The item will be deleted",
  //           onPressed: (){
  //             print("Delete button is pressed");
  //           },
  //         ),
  //       )
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.list[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AddItem(widget.list)));
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
