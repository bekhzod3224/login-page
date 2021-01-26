import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/model/login_model.dart';
import 'package:loginpage/pages/form/form.dart';
import 'package:loginpage/services/api_service.dart';



class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserForm> users = [];
  double firstFieldValue = 0;
  double thirdFieldValue = 0;
  HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        leading: Icon(
          Icons.wb_cloudy,
        ),
        title: Text('REGISTER USERS'),
        actions: <Widget>[
          new RaisedButton(
            onPressed: onAddForm,
            child: new Padding(
              padding: new EdgeInsets.all(16.0),
              child: new Text('Submit Data'),
            ),
          ),
        ],
      ),
      body:  Column(
        children: [
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
          Expanded(
            child:
              users.length <= 0
                  ? Center(

              )
                  : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: users.length,
                itemBuilder: (_, i) => users[i],
              ),
            ),

        ],
      
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddForm,
        foregroundColor: Colors.white,
      ),
    );
  }

  ///on form user deleted
  void onDelete(int index) {
    setState(() {
      print("ok");
       users.removeAt(index);
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
print("sd");
      users.add(UserForm());
    });
  }

  ///on save forms
  void onSave() {
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {

        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('List of Users'),
              ),
              body: ListView.builder(

                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(

                  ),

                ),
              ),
            ),
          ),
        );
      }
    }
  }
}
