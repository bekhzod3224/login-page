import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/model/login_model.dart';
import 'package:loginpage/services/api_service.dart';

class DynamicWid extends StatefulWidget {
  @override
  _DynamicWidState createState() => _DynamicWidState();
}

class _DynamicWidState extends State<DynamicWid> {
  TextEditingController controller = new TextEditingController();
double firstFieldValue = 0;
double thirdFieldValue = 0;

final _formKey = GlobalKey<FormState>();
// final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();


HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
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
    );
  }
}


