import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_customer_flutter/model/detail_customer_info_model.dart';
import 'package:simple_customer_flutter/repository/detail_customer_info_repository.dart';

import 'detail_customer_info_event.dart';
import 'detail_customer_info_state.dart';

class DetailCustomerInfoBloc extends Bloc<DetailCustomerInfoEvent, DetailCustomerInfoState> {
  final DetailCustomerInfoRepository _detailCustomerInfoRepository;

  DetailCustomerInfoBloc(this._detailCustomerInfoRepository) : super(DetailCustomerInfoInitial());

  @override
  Stream<DetailCustomerInfoState> mapEventToState(
      DetailCustomerInfoEvent event,
      ) async* {
    if (event is DetailCustomerInfo) {
      try {
        yield DetailCustomerInfoLoading();
        final response = await _detailCustomerInfoRepository.getCustomerInfoById(event.idCustomerInfo);
        yield DetailCustomerInfoSuccess(DetailCustomerInfoModel.fromJson(response.data));
      } catch (e) {
        yield DetailCustomerInfoError(e.toString());
      }
    }
  }

}