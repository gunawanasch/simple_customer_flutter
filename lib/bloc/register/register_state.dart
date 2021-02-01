import 'package:equatable/equatable.dart';
import 'package:simple_customer_flutter/model/register_model.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
  @override
  List<Object> get props => null;
}

class RegisterSuccess extends RegisterState {
  final RegisterModel registerModel;
  const RegisterSuccess(this.registerModel);
  @override
  List<Object> get props => [registerModel];
}

class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);
  @override
  List<Object> get props => [message];
}