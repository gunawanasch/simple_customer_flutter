import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:simple_customer_flutter/model/customer_info_model.dart';
import 'package:simple_customer_flutter/network/api_base_helper.dart';

class CustomerInfoRepository {
  APIBaseHelper _helper = APIBaseHelper();

  Future<Response> getAllCustomerInfo() async {
    Response response = await _helper.get("v1/getAllCustomerInfo");

    return response;
  }

  Future<Response> getCustomerInfoById(int idCustomerInfo) async {
    FormData formData = new FormData.fromMap({
      "id_customer_info": idCustomerInfo
    });

    Response response = await _helper.post("customerInfo/getCustomerInfoById",
      formData: formData,
    );

    return response;
  }

}