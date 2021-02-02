class RegisterModel {
  RegisterModel({
    this.status,
    this.message,
  });

  int status;
  String message;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}