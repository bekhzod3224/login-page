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
<<<<<<< Updated upstream
=======


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
