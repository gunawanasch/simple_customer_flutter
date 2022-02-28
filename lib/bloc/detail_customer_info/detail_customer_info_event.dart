import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class DetailCustomerInfoEvent extends Equatable {
  const DetailCustomerInfoEvent();
}

class DetailCustomerInfo extends DetailCustomerInfoEvent {
  final int idCustomerInfo;

  const DetailCustomerInfo({
    @required this.idCustomerInfo
  });

  @override
  List<Object> get props => [idCustomerInfo];

  @override
  String toString() => "DetailCustomerInfo { id_customer_info: $idCustomerInfo }";
}