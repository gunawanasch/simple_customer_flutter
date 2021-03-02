import 'package:dio/dio.dart';
import 'package:simple_customer_flutter/network/api_base_helper.dart';

class LoginRepository {
  APIBaseHelper _helper = APIBaseHelper();

  Future<Response> login(String email, String password) async {
    FormData formData = new FormData.fromMap({
      "email": email,
      "password": password,
    });

    Response response = await _helper.post("user/login",
      formData: formData,
    );

    return response;
  }

}