import 'package:equatable/equatable.dart';
import 'package:simple_customer_flutter/model/customer_info_model.dart';

abstract class CustomerInfoState extends Equatable {
  const CustomerInfoState();
}

class CustomerInfoInitial extends CustomerInfoState {
  const CustomerInfoInitial();
  @override
  List<Object> get props => [];
}

class CustomerInfoLoading extends CustomerInfoState {
  const CustomerInfoLoading();
  @override
  List<Object> get props => null;
}

class CustomerInfoSuccess extends CustomerInfoState {
  final List<CustomerInfoModel> customerInfoModel;
  const CustomerInfoSuccess(this.customerInfoModel);
  @override
  List<Object> get props => [CustomerInfoModel];
}

class CustomerInfoError extends CustomerInfoState {
  final String message;
  const CustomerInfoError(this.message);
  @override
  List<Object> get props => [message];
}