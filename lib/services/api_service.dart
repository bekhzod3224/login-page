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
import 'dart:convert';
import '../model/login_model.dart';



class HttpService{

    Future<List<ProModel>> getMarket(filter) async {
      var models = null;
      Dio dio = new Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = urlApis.token;
      try{
        var response = await dio.get(
          "${urlApis.url_Api}companies/autocomplete/?q=",
          queryParameters: {"filter": filter},
        );
        if (response.statusCode == 200){
          print(response.data);
          var jsonMap = response.data['body'];
          var models = ProModel.fromJsonList(jsonMap);
          return models;
        }
      }catch(Exception){
        return models;
      }
    }

  Future<List<ProModel>> getAdress(filter) async {
      var models = null;
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = urlApis.token;
    try{
      var response = await dio.get(
        "${urlApis.url_Api}warehouses/autocomplete/?q=&page=1",
        queryParameters: {"filter": filter},
      );
      if (response.statusCode == 200){
        var jsonMap = response.data['body'];
        var models = ProModel.fromJsonList(jsonMap);
        return models;
      }
    }catch(Exception){
      return models;
    }

  }
<<<<<<< Updated upstream
=======

  Future<List<ProModel>> getCont(filter) async {
      var models = null;
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = urlApis.token;
    try{
      var response = await dio.get(
        "${urlApis.url_Api}users/counterparty/autocomplete?q=&page=1",
        queryParameters: {"filter": filter},
      );
      if (response.statusCode == 200){
        var jsonMap = response.data['body'];
        var models = ProModel.fromJsonList(jsonMap);
        return models;
      }
    }catch(Exception){
      return models;
    }

  }

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
