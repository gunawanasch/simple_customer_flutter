import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_customer_flutter/model/customer_info_model.dart';
import 'package:simple_customer_flutter/repository/customer_info_repository.dart';

import 'customer_info_event.dart';
import 'customer_info_state.dart';

class CustomerInfoBloc extends Bloc<CustomerInfoEvent, CustomerInfoState> {
  final CustomerInfoRepository _customerInfoRepository;

  CustomerInfoBloc(this._customerInfoRepository) : super(CustomerInfoInitial());

  // @override
  // CustomerInfoState get initialState => CustomerInfoInitial();

  @override
  Stream<CustomerInfoState> mapEventToState(
      CustomerInfoEvent event,
      ) async* {
    if (event is CustomerInfo) {
      try {
        yield CustomerInfoLoading();
        final response = await _customerInfoRepository.getAllCustomerInfo();
        yield CustomerInfoSuccess(CustomerInfoModel.fromJson(response.data));
      } catch (e) {
        yield CustomerInfoError(e.toString());
      }
    }
  }

}