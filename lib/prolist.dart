<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final steps = [
    'step1',
    'step2',
    'step3',
  ];

  final form = FormGroup({
    // 'name': FormControl<String>(validators: [Validators.required,]),
    // 'category': FormControl<String>(validators: [Validators.required,]),
    // 'instructions': FormControl<String>(),
    // 'unit': FormControl<int>(validators: [Validators.required,]),
    'steps': FormArray<String>([]),
  });

  FormArray<String> get selectedSteps => form.control('steps') as FormArray;

  @override
  void initState() {
    selectedSteps.addAll(
      steps.map((step) => FormControl<String>(value: '')).toList(),
    );
    super.initState();
  }

  Widget _buildStepListItem(step) {
    return ReactiveTextField(
      formControlName: this.steps.indexOf(step).toString(),
      decoration: InputDecoration(
        labelText: step,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steps',
      home: Scaffold(
        body: ReactiveForm(
          formGroup: this.form,
          child: Column(
            children: [
              ReactiveFormArray<String>(
                formArrayName: 'steps',
                builder: (context, formArray, child) => Column(
                  children: this.steps.map(_buildStepListItem).toList(),
                ),
              ),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return RaisedButton(
                    child: Text('Send'),
                    onPressed: form.valid
                        ? () {
                      print(this.selectedSteps.rawValue);
                    }
                        : null,
                  );
                },
              ),
            ],
=======
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/model/login_model.dart';
import 'package:loginpage/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
class ProList  extends StatelessWidget {
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



  // final HttpService httpService = HttpService();
  // var http = HttpService();
  // var response = await http.postsURL;
  // var practices = await jsonCodec.decode(response.body);
  // practicelist = await practices.toList();

  Map data;
  List userData;
  List list;

  Future getData() async {
    String token = "ed4f65d97737ae9ce27f4b51334cc04d1235a3217be2a36dbae0d1406e813d31";
    var url = "https://vvmarket.abr.tj/api/v1/products/autocomplete/?q=&page=1";
    http.Response response = await http.get(url,headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json',

    });
    data = json.decode(response.body);

    //debugPrint(response.body);
    setState(() {
      data = data["body"];
      list = data["like"];
      print(list);
    });
  }


  final _formKey = GlobalKey<FormState>();
  // final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();


  @override

  void initState() {
    super.initState();
    getData();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(

             children:  [
                 new DropdownSearch<String>(
                    validator: (v) => v == null ? "Обязательное поле" : null,
                    hint: "Продукт",
                    mode: Mode.MENU,
                    showSelectedItem: true,
                    items: ["Rc"],

                    showSearchBox: true,
                    label: "Продукт",

                    // items: list,
                    showClearButton: true,
                    onChanged: print,


                  ),
               ],
>>>>>>> main
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> main
