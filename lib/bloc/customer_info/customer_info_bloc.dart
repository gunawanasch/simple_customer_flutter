import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_customer_flutter/model/customer_info_model.dart';
import 'package:simple_customer_flutter/repository/customer_info_repository.dart';

import 'customer_info_event.dart';
import 'customer_info_state.dart';

class CustomerInfoBloc extends Bloc<CustomerInfoEvent, CustomerInfoState> {
  final CustomerInfoRepository _customerInfoRepository;

  CustomerInfoBloc(this._customerInfoRepository) : super(CustomerInfoInitial());

  @override
  Stream<CustomerInfoState> mapEventToState(
      CustomerInfoEvent event,
      ) async* {
    if (event is CustomerInfo) {
      try {
        yield CustomerInfoLoading();
        final response = await _customerInfoRepository.getAllCustomerInfo();
        final list = <CustomerInfoModel>[];
        response.data.forEach((v) {
          list.add(new CustomerInfoModel.fromJson(v));
        });
        yield CustomerInfoSuccess(list);
      } catch (e) {
        yield CustomerInfoError(e.toString());
      }
    }
  }

}