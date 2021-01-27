import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:loginpage/pages/pro_list.dart';
import 'dart:async';
import 'dart:convert';

import 'package:loginpage/services/api_service.dart';
class ProductLists  extends StatelessWidget {
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


  HttpService httpService = HttpService();

  List<DynamicWid> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon = new Icon(Icons.add);

  addDynamic() {
    if (data.length != 0) {
      floatingIcon = new Icon(Icons.add);

      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 50) {
      return;
    }
    listDynamic.add(new DynamicWid());
  }

  submitData() {
    floatingIcon = new Icon(Icons.arrow_back);
    data = [];
    // listDynamic.forEach((widget) => data.add(widget.controller.text));
    setState(() {});
    print(data.length);
  }

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
              Icon(Icons.clear),
    ],
          ),
        ),
      ),
    );
  }
}
