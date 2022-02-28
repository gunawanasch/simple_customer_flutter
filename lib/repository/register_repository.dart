import 'package:dio/dio.dart';
import 'package:simple_customer_flutter/network/api_base_helper.dart';

class RegisterRepository {
  APIBaseHelper _helper = APIBaseHelper();

  Future<Response> register(String name, String email, String password) async {
    FormData formData = new FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
    });

    Response response = await _helper.post("user/register",
      formData: formData,
    );

    return response;
  }

}