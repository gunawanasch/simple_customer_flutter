import 'package:flutter/material.dart';
import 'package:simple_customer_flutter/library/colors.dart';

class LoadingDialog {
  static Future<void> show(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Row(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Loading....",style: TextStyle(color: PrimaryColor),)
                      ]),
                    )
                  ]));
        });
  }
}