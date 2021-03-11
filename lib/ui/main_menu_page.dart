import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_customer_flutter/library/colors.dart';
import 'package:simple_customer_flutter/library/drawer_item.dart';
import 'package:simple_customer_flutter/ui/customer_page.dart';
import 'package:simple_customer_flutter/ui/login_page.dart';

import 'about_page.dart';

class MainMenuPage extends StatefulWidget {
  final _listDrawer = [
    DrawerItem("Customer", Icons.note),
    DrawerItem("About", Icons.help),
    DrawerItem("Logout", Icons.logout),
  ];

  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  String _name = "";
  String _email = "";
  int _selectedDrawerIndex = 0;

  @override
  void initState() {
    super.initState();
    _getDataLogin();
  }

  Future _getDataLogin() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    setState(() {
      _name = _sp.getString("name");
      _email = _sp.getString("email");
    });
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return CustomerPage();
      case 1:
        return AboutPage();
      case 2:
        _logout();
        return SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>
                LoginPage()), (Route<dynamic> route) => false
          );
        });
      default:
        return Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  Future _logout() async {
    final _sp = await SharedPreferences.getInstance();
    await _sp.clear();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _listDrawerOptions = [];
    for (var i = 0; i < widget._listDrawer.length; i++) {
      var d = widget._listDrawer[i];
      _listDrawerOptions.add(
          ListTile(
            leading: Icon(d.icon),
            title: Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget._listDrawer[_selectedDrawerIndex].title,
          style: TextStyle(
            color: White,
          ),
        ),
        iconTheme: IconThemeData(color: White),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: PrimaryColor,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          child: Card(
                            color: Blue2,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Container(
                                child: Text(
                                  _name[0],
                                  style: TextStyle(
                                    color: White,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                          child: Text(_name,
                            style: TextStyle(
                              color: White,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                          child: Text(_email,
                            style: TextStyle(
                              color: White,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(children: _listDrawerOptions),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

}