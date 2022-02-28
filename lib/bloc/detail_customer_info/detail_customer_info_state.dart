import 'package:equatable/equatable.dart';
import 'package:simple_customer_flutter/model/detail_customer_info_model.dart';

abstract class DetailCustomerInfoState extends Equatable {
  const DetailCustomerInfoState();
}

class DetailCustomerInfoInitial extends DetailCustomerInfoState {
  const DetailCustomerInfoInitial();
  @override
  List<Object> get props => [];
}

class DetailCustomerInfoLoading extends DetailCustomerInfoState {
  const DetailCustomerInfoLoading();
  @override
  List<Object> get props => null;
}

class DetailCustomerInfoSuccess extends DetailCustomerInfoState {
  final DetailCustomerInfoModel detailCustomerInfoModel;
  const DetailCustomerInfoSuccess(this.detailCustomerInfoModel);
  @override
  List<Object> get props => [DetailCustomerInfoModel()];
}

class DetailCustomerInfoError extends DetailCustomerInfoState {
  final String message;
  const DetailCustomerInfoError(this.message);
  @override
  List<Object> get props => [message];
}