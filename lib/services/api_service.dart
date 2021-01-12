import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
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