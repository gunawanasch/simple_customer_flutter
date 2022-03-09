import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_customer_flutter/bloc/detail_customer_info/detail_customer_info_bloc.dart';
import 'package:simple_customer_flutter/bloc/detail_customer_info/detail_customer_info_event.dart';
import 'package:simple_customer_flutter/bloc/detail_customer_info/detail_customer_info_state.dart';
import 'package:simple_customer_flutter/repository/detail_customer_info_repository.dart';

class DetailCustomerInfoPage extends StatelessWidget {
  final int idCustomerInfo;
  DetailCustomerInfoPage({this.idCustomerInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Customer Info"),
      ),
      body: BlocProvider(
        create: (context) => DetailCustomerInfoBloc(DetailCustomerInfoRepository())..add(DetailCustomerInfo(idCustomerInfo: idCustomerInfo)),
        child: BlocBuilder<DetailCustomerInfoBloc, DetailCustomerInfoState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is DetailCustomerInfoInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DetailCustomerInfoLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DetailCustomerInfoSuccess) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.detailCustomerInfoModel.name,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Phone:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.detailCustomerInfoModel.phone,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Age:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.detailCustomerInfoModel.age.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Address:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.detailCustomerInfoModel.address,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "City:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.detailCustomerInfoModel.city,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is DetailCustomerInfoError) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${state.message}")));
            }
          },
        ),
      ),
    );
  }
}
