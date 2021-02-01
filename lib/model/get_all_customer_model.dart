class GetAllCustomerModel {
  int idCustomerInfo;
  String name;
  String phone;
  int age;
  String address;
  String city;
  String createdDate;

  GetAllCustomerModel(
      {this.idCustomerInfo,
        this.name,
        this.phone,
        this.age,
        this.address,
        this.city,
        this.createdDate});

  GetAllCustomerModel.fromJson(Map<String, dynamic> json) {
    idCustomerInfo = json['id_customer_info'];
    name = json['name'];
    phone = json['phone'];
    age = json['age'];
    address = json['address'];
    city = json['city'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_customer_info'] = this.idCustomerInfo;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['age'] = this.age;
    data['address'] = this.address;
    data['city'] = this.city;
    data['created_date'] = this.createdDate;
    return data;
  }
}
