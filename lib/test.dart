<<<<<<< HEAD
import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:loginpage/pages/form/form.dart';
import 'package:loginpage/pages/form/multi_form.dart';
import 'package:loginpage/pages/page.dart';
import 'dart:async';
import 'dart:convert';

import 'package:loginpage/services/api_service.dart';
class PostPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double firstFieldValue = 0;
  double thirdFieldValue = 0;

  final _formKey = GlobalKey<FormState>();
  // final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();
  List<UserForm> users = [];
  MultiForm multiForm = MultiForm();

  HttpService httpService = HttpService();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(

            children:  [

          DropdownSearch<ProModel>(
            validator: (v) => v == null ? "Обязательное поле" : null,
            label: "Компания",
            mode: Mode.MENU,
            showSearchBox: true,
            showClearButton: true,
            onFind: (String filter) => httpService.getMarket(filter),
            onChanged: (ProModel data) {
              print(data);
            },
          ),
              Divider(),
              DropdownSearch<ProModel>(
                validator: (v) => v == null ? "Обязательное поле" : null,
                label: "Склад",
                mode: Mode.MENU,
                showSearchBox: true,
                showClearButton: true,
                onFind: (String filter) => httpService.getAdress(filter),
                onChanged: (ProModel data) {
                  print(data);
                },
              ),
              Divider(),
              DropdownSearch<ProModel>(
                validator: (v) => v == null ? "Обязательное поле" : null,
                label: "Контрагент",
                mode: Mode.MENU,
                showSearchBox: true,
                showClearButton: true,
                onFind: (String filter) => httpService.getCont(filter),
                onChanged: (ProModel data) {
                  print(data);
                },
              ),
              Divider(),
          DateTimePicker(
            icon: Icon(Icons.event),
            // type: DateTimePickerType.dateTimeSeparate,
            dateMask: 'd-MM-yyyy',
            initialValue: DateTime.now().toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            dateLabelText: 'Дата',
            onChanged: (val) => print(val),
            validator: (val) {
              return null;
            },
            onSaved: (val) => print(val),
          ),
              Divider(),
              Column(
                children: [
                  DropdownSearch<ProModel>(
                    validator: (v) => v == null ? "Обязательное поле" : null,
                    label: "Продукт",
                    mode: Mode.MENU,
                    showSearchBox: true,
                    showClearButton: true,
                    onFind: (String filter) => httpService.getProduct(filter),
                    onChanged: (ProModel data) {
                      print(data);
                    },
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(

                          onChanged: (value){
                            if(value.isEmpty){
                              setState(() => firstFieldValue = 0);
                            }else{
                              setState((){
                                firstFieldValue = double.parse(value);
                              });
                            }
                          },
                          // autocorrect: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Количество",
                          ),
                          // onSaved: (str) => result() ,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (value){
                            if(value.isEmpty){
                              setState(() => thirdFieldValue = 0);
                            }else{
                              setState((){
                                thirdFieldValue = double.parse(value);
                              });
                            }
                          },
                          textAlign: TextAlign.center,
                          autocorrect: false,
                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Приходная цена",
                          ),
                          // onSaved: (str) =>  ,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  new Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          autocorrect: false,
                          onChanged: (text) {
                            print("First text field: $text");
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Цена продажи",
                          ),
                          // onSaved: (str) =>  ,
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.center,

                          autocorrect: false,
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "${firstFieldValue * thirdFieldValue}",
                          ),
                          // onSaved: (str) =>  ,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              RaisedButton(

                child: Text("add"),
              ),
              Icon(Icons.clear),

              Expanded(
                child: Container(
                  child:
                  users.length <= 0
                      ? Center(

                  )
                      : ListView.builder(
                    addAutomaticKeepAlives: true,
                    itemCount: users.length,
                    itemBuilder: (_, i) => users[i],
                  ),
                )

              ),

            //assalomu alekum yangi page qilsak bo`ladimi
              // xa mayli hozir men logindi teraman
            ],
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: onAddForm,
      foregroundColor: Colors.white,
    ),
    );
  }
  void onAddForm() {
    setState(() {
      print("sd");
      users.add(UserForm());
    });
  }
}
=======
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
>>>>>>> main
