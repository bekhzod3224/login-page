<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< Updated upstream
import 'package:http/http.dart' as http;
=======
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:loginpage/services/urlApi.dart';
>>>>>>> Stashed changes
=======
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
>>>>>>> main
=======
import 'package:http/http.dart' as http;
>>>>>>> parent of 976a345... admin
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  Future<LoginResponse> login(LoginRequestModel requestModel) async {
    String url = "https://vvmarket.abr.tj/api/v1/authorization/get/token/";

    final response = await http.post(url, body: requestModel.toJson(),
   headers: {'Content-type': 'application/json'}
    );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 400) {
        return LoginResponse.fromJson(
          json.decode(response.body),
        );
      } else {
        throw Exception('Failed to load data!');
      }
    }

  }
<<<<<<< HEAD
<<<<<<< HEAD

  Future<List<ProModel>> getProduct(filter) async {
      var models = null;
      Dio dio = new Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = urlApis.token;
      try{
        var response = await dio.get("${urlApis.url_Api}products/autocomplete/?q=&page=1",
          queryParameters: {"filter": filter},
        );
        if (response.statusCode == 200){
          var jsonMap = response.data['body']['like'];
          var  models = ProModel.fromJsonList(jsonMap);
          return models;
        }
      }catch(Exception){
        return models;
      }

  }

}


  // List<String> names =[];
  // Map<String, dynamic> map;
  // final String postsURL = "https://vvmarket.abr.tj/api/v1/products/autocomplete/?q=&page=1";
  // String token = "ed4f65d97737ae9ce27f4b51334cc04d1235a3217be2a36dbae0d1406e813d31";
  // Future<List<Post>> getPosts() async {
  //   Response res = await get(postsURL,headers: {
  //     HttpHeaders.authorizationHeader: token,
  //     HttpHeaders.contentTypeHeader: 'application/json',
  //     'Content-type': 'application/json'
  //
  //   });
  //   print(res.statusCode);
  //
  //   if (res.statusCode == 200) {
  //     // print(res.body);
  //
  //     map = jsonDecode(res.body);
  //     //
  //     // print(map['body']['like'].forEach((e)=> print(e['name'])));
  //     map['body']['like'].forEach((e)=>names.add(e['name']));
  //     print(names);
  //     List<dynamic> body = jsonDecode(res.body);
  //     print(res.body);
  //
  //   } else {
  //     throw "Can't get posts.";
  //   }
  // }
// }
>>>>>>> Stashed changes
=======
class HttpService {
  final String postsURL = "https://vvmarket.abr.tj/api/v1/products/autocomplete/?q=&page=1";

  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(res.body);
      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}
>>>>>>> main
=======
>>>>>>> parent of 976a345... admin
