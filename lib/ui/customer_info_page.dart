import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_customer_flutter/bloc/customer_info/customer_info_bloc.dart';
import 'package:simple_customer_flutter/bloc/customer_info/customer_info_event.dart';
import 'package:simple_customer_flutter/bloc/customer_info/customer_info_state.dart';
import 'package:simple_customer_flutter/model/customer_info_model.dart';
import 'package:simple_customer_flutter/repository/customer_info_repository.dart';
import 'package:simple_customer_flutter/ui/detail_customer_info_page.dart';

class CustomerInfoPage extends StatefulWidget {
  @override
  _CustomerInfoPageState createState() => _CustomerInfoPageState();
}

class _CustomerInfoPageState extends State<CustomerInfoPage> {
  CustomerInfoBloc _customerInfoBloc = CustomerInfoBloc(CustomerInfoRepository());

  @override
  void initState() {
    _customerInfoBloc.add(CustomerInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => CustomerInfoBloc(CustomerInfoRepository())..add(CustomerInfo()),
        child: BlocBuilder<CustomerInfoBloc, CustomerInfoState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is CustomerInfoInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CustomerInfoLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CustomerInfoSuccess) {
              return ListView.builder(
                  itemCount: state.listCustomerInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomerInfoRow(customerInfoModel: state.listCustomerInfo[index]);
                  }
              );
            } else if (state is CustomerInfoError) {
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

class CustomerInfoRow extends StatelessWidget {
  CustomerInfoRow({Key key, this.customerInfoModel}) : super(key: key);
  final CustomerInfoModel customerInfoModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DetailCustomerInfoPage(idCustomerInfo: customerInfoModel.idCustomerInfo);
            }
        ));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customerInfoModel.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        customerInfoModel.phone,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
