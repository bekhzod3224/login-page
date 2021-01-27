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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
=======
>>>>>>> main


class Post {

  final int id;
  final String name;


  Post({

    @required this.id,
    @required this.name,

  });

<<<<<<< HEAD


  factory Post.fromJson(Map<String, dynamic> json) {

    return Post(
=======
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(

>>>>>>> main
      id: json['id'] as int,
      name: json['name'] as String,

    );
  }
}
<<<<<<< HEAD

class ProModel {
  final String id;
  final String name;


  ProModel({this.id,this.name});

  factory ProModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    print(json);
    return ProModel(
      id: json["id"],
      name: json["name"],
    );
  }

  static List<ProModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => ProModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(ProModel model) {
    return this?.id == model?.id;
  }

  @override
  String toString() => name;
}
>>>>>>> Stashed changes
=======
>>>>>>> main
=======
>>>>>>> parent of 976a345... admin
