import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class Tests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
    );
  }
}
class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ok"),
      ),
      body: Text("hi"),
    );
  }
}
get_list(){
  List<KeyValueModel> datas = [
    KeyValueModel(key: "Key 1", value: "Value 1"),
    KeyValueModel(key: "Key 2", value: "Value 2"),
    KeyValueModel(key: "Key 3", value: "Value 3"),
    KeyValueModel(key: "Key 4", value: "Value 4"),
    KeyValueModel(key: "Key 5", value: "Value 5"),
  ];
  return datas;
}
//Create a Model class to hold key-value pair data
class KeyValueModel {
  String key;
  String value;

  KeyValueModel({this.key, this.value});
}


class Test extends StatefulWidget {
  @override
  TestState createState() {
    return new TestState();
  }
}
class TestState extends State<Test> {

  List listan = get_list();

  KeyValueModel _selectedValue = KeyValueModel(key: "0", value: "value");

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Key value Pair - DropdownButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[




            SearchableDropdown<KeyValueModel>(
              isCaseSensitiveSearch: true,
              items: listan
                  .map((data) => DropdownMenuItem<KeyValueModel>(
                child: Text(data.key),
                value: data,
              )).toList(),
              onChanged: (KeyValueModel value) {
                setState(() => _selectedValue = value);
              },
              hint: Text('Select Key'),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(_selectedValue.value),
          ],
        ),
      ),
    );
  }
}
