import 'package:dio/dio.dart';
import 'package:simple_customer_flutter/model/register_model.dart';
import 'package:simple_customer_flutter/network/api_base_helper.dart';

class RegisterRepository {
  APIBaseHelper _helper = APIBaseHelper();

  // Future<RegisterModel> registerOld(String name, String email, String password) async {
  //   try {
  //     // Response response = await _dio.post("${baseUrl}User/register");
  //
  //     FormData formData = new FormData.fromMap({
  //       "name": name,
  //       "email": email,
  //       "password": password,
  //     });
  //
  //     Response response = await _dio.post("${baseUrl}User/register",
  //       data: jsonEncode(formData),
  //     );
  //     return RegisterModel.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return error;
  //   }
  // }

  Future<Response> register(String name, String email, String password) async {
    FormData formData = new FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
    });

    Response response = await _helper.post("User/register",
      formData: formData,
    );
    return response;
  }

}