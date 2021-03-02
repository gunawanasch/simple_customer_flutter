import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class Register extends RegisterEvent {
  final String name;
  final String email;
  final String password;

  const Register({
    @required this.name,
    @required this.email,
    @required this.password
  });

  @override
  List<Object> get props => [name, email, password];

  @override
  String toString() => "Register { name: $name, email: $email, password: $password }";
}