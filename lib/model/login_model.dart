import 'package:flutter/foundation.dart';

class LoginResponse{
  final String token;
  final String error;

  LoginResponse({this.token, this.error});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}


class Post {

  final int id;
  final String name;


  Post({

    @required this.id,
    @required this.name,

  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(

      id: json['id'] as int,
      name: json['name'] as String,

    );
  }
}
