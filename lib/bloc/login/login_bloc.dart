import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_customer_flutter/model/login_model.dart';
import 'package:simple_customer_flutter/repository/login_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is Login) {
      try {
        yield LoginLoading();
        final response = await _loginRepository.login(event.email, event.password);
        yield LoginSuccess(LoginModel.fromJson(response.data));
      } catch (e) {
        yield LoginError(e.toString());
      }
    }
  }

}