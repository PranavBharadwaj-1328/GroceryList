import 'package:flutter/material.dart';
import 'package:grocerylist/main.dart';

// ignore: must_be_immutable
class AddItem extends StatefulWidget {
  List<Widget> list = new List<Widget>();
  AddItem(this.list);
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String itemName;
  String quantity;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Divider(
            //   height: 80,
            // ),
            TextFormField(
              onSaved: (String value) {
                this.itemName = value;
              },
              decoration: const InputDecoration(labelText: 'Item Name'),
            ),
            TextFormField(
              onSaved: (String value) {
                this.quantity = value;
              },
              decoration: const InputDecoration(labelText: 'Quantity'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      _formKey.currentState.save();
                    }
                    setState(() {
                      var k = UniqueKey();
                      widget.list.add(
                          ListTile(
                            key: k,
                            leading: Icon(Icons.add_shopping_cart),
                            title: Text(itemName),
                            subtitle: Text(quantity),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              tooltip: "The item will be deleted",
                              onPressed: () {
                                // print("Delete button is pressed");
                                setState(() {
                                  widget.list.removeWhere((element) => element.key == k);
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MyHomePage(widget.list, title:'Grocery List')));
                                });
                              },
                            ),
                          ));
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MyHomePage(widget.list, title:'Grocery List')));
                  },
                  child: Text('Add Item' /*style: TextStyle(fontSize: 30),*/)),
            )
          ],
        ),
      ),
    );
  }
}
