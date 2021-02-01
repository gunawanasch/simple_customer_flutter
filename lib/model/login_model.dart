class LoginModel {
  int status;
  String message;
  int idUser;
  String name;
  String email;

  LoginModel({this.status, this.message, this.idUser, this.name, this.email});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    idUser = json['id_user'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['id_user'] = this.idUser;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
