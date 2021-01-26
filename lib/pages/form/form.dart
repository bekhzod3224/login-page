import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/model/login_model.dart';
import 'package:loginpage/services/api_service.dart';


typedef OnDelete();

class UserForm extends StatefulWidget {

  final state = _UserFormState();
  final OnDelete onDelete;

  UserForm({ this.onDelete}) ;
  @override
  _UserFormState createState() => state;

  bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();
  HttpService httpService = HttpService();
  double firstFieldValue = 0;
  double thirdFieldValue = 0;
  @override
  Widget build(BuildContext context) {
    return
         Form(
          key: form,
          child: Column(

            children: <Widget>[


              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: Column(
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
              )
            ],
          ),
        );


  }

  ///form validator
  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}
