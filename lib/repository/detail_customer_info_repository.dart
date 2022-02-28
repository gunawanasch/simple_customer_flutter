import 'package:dio/dio.dart';
import 'package:simple_customer_flutter/network/api_base_helper.dart';

class DetailCustomerInfoRepository {
  APIBaseHelper _helper = APIBaseHelper();

  Future<Response> getCustomerInfoById(int idCustomerInfo) async {
    FormData formData = new FormData.fromMap({
      "id_customer_info": idCustomerInfo,
    });

    Response response = await _helper.post("v1/getCustomerInfoById",
      formData: formData,
    );

    return response;
  }

}