import 'package:http/http.dart' as http;
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
