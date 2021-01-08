import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage/model/login_model.dart';
import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loginpage/user.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),

    );
  }
}
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return new LoginState();
  }
}
class LoginState extends State <Login> {

  final formKey = GlobalKey<FormState>();
  String _email, _password;
  String cookie;
  String user;
  Map<String, dynamic> map;

  void loginApi(BuildContext context, String username){
    var form = formKey.currentState;
    var url = "https://vvmarket.abr.tj/api/v1/authorization/get/token/";
    if (form.validate()) {
      form.save();
      var body = { "email":_email, "password":_password};
      http.post(url,body:json.encode(body),headers: {'Content-type': 'application/json'}).then((response){

        final int statusCode = response.statusCode;
        if (statusCode == 200){
          map = jsonDecode(response.body);
          print(map['username']);

          Navigator.push(context, MaterialPageRoute(builder: (_){
            return UserPage(

              username: map['username'],
            );
          }),);

        }else{
          print("error");
        }
        // print(response.headers);
        // print(_email);
      });
    }
  }

  LoginRequestModel loginRequestModel;
  void inState(BuildContext context) {
    print("ok");
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text("Вход в VVMarket")),
        backgroundColor: Colors.blue,
      ),
      body: new Container(

        alignment: Alignment.center,
        child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                    child: TextFormField(
                      autocorrect: false,
                      decoration: InputDecoration(

                        border: OutlineInputBorder(),
                        labelText: "Логин:",
                      ),
                      validator: (str) =>
                      !str.contains('@') ? "Not a Valid Email!" : null,
                      onSaved: (str) =>  _email = str,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                    child: TextFormField(

                      autocorrect: false,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Парол",
                      ),
                      validator: (str) =>
                      str.length <= 5 ? "Not a Valid Password!" : null,
                      onSaved: (str) => _password = str,
                      style: TextStyle(),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(

                      width: 340.0,
                      height: 70,
                      child: RaisedButton(

                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(child: CircularProgressIndicator(),);
                              });

                          // Navigator.pop(context);
                          loginApi(context, "");
                        },
                        textColor: Colors.white,
                        color: Colors.blue,
                      elevation: 25.0,
                      splashColor: Colors.indigo,

                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                      ),
                        child: Text("Войти",style: TextStyle(fontSize: 20.0),),),

                    ),
                  ),


                ],
              ),
            )
        ),
      ),


    );
  }
}