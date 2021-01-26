import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:loginpage/pages/form/multi_form.dart';
import 'package:loginpage/pages/product_list.dart';
import 'package:loginpage/prolist.dart';
import 'package:loginpage/test.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
>>>>>>> Stashed changes

class UserPage extends StatelessWidget {
  final String username;

  const UserPage({this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< Updated upstream
        title: Text(username),
=======
        title: Container(
          margin: EdgeInsets.all(100.0),
          child: Row(

            children: [

              Icon(Icons.assignment),
              Icon(Icons.logout),
              Icon(Icons.add_alert),
            ],
          ),
        ),
      ),
      //manashu pageda ishlaveraylik
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: null,
                accountEmail: new Text(username),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://vvmarket.abr.tj/favicon.ico'),
                ),
            ),

            new ListTile(

              title: Row(
                children: [
                  Icon(Icons.comment),
                  new Text("  Приход"),
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new PostPage() ),);
              } ,

            ),
            new ListTile(

              title: Row(
                children: [
                  Icon(Icons.comment),
                  new Text("  Приход"),
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new MultiForm() ),);
              } ,

            ),

          ],
        ),
      ),
      body: Container(
        child: Column(

          children: <Widget>[

            Container(
              height: 600,
              child: Center(child: Text("Приветствуем!",style: TextStyle(fontSize: 45.0),)),
            ),


          ],
        ),
>>>>>>> Stashed changes
      ),
    );
  }
}
