import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_customer_flutter/bloc/register/register_event.dart';
import 'package:simple_customer_flutter/bloc/register/register_state.dart';
import 'package:simple_customer_flutter/model/register_model.dart';
import 'package:simple_customer_flutter/repository/register_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _registerRepository;

  RegisterBloc(this._registerRepository) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
      RegisterEvent event,
      ) async* {
    if (event is Register) {
      try {
        yield RegisterLoading();
        final response = await _registerRepository.register(event.name, event.email, event.password);
        yield RegisterSuccess(RegisterModel.fromJson(response.data));
      } catch (e) {
        yield RegisterError(e.toString());
      }
    }
  }

}