import 'dart:convert';

List<CustomerInfoModel> customerInfoModelFromJson(String str) => List<CustomerInfoModel>.from(
    json.decode(str).map((x) => CustomerInfoModel.fromJson(x)));

String photosModelToJson(List<CustomerInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerInfoModel {
  int idCustomerInfo;
  String name;
  String phone;

  CustomerInfoModel({this.idCustomerInfo, this.name, this.phone});

  CustomerInfoModel.fromJson(Map<String, dynamic> json) {
    idCustomerInfo = json['id_customer_info'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_customer_info'] = this.idCustomerInfo;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
