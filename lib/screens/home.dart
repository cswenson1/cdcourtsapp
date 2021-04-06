import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:CDCourtServices/screens/profile.dart';
import 'package:CDCourtServices/services/user_service.dart';
// Tabs Imported
import 'package:CDCourtServices/screens/tabs/check_in.dart';
import 'package:CDCourtServices/screens/tabs/help.dart';
import 'package:CDCourtServices/screens/tabs/faq.dart';
import 'package:CDCourtServices/screens/tabs/settings.dart';

class Home extends StatefulWidget {
  static var routeName = '/home';
  int tabIndex = 0;

  Home({this.tabIndex});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserService userService;
  DateTime currentBackPressTime;
  final List<Map<String, Object>> _tabsList = [
    {
      'title': 'Check In',
      'tabContent': CheckIn(),
    },
    {
      'title': 'Help',
      'tabContent': Help(),
    },
    {
      'title': 'FAQ',
      'tabContent': Faq(),
    },
    {
      'title': 'Settings',
      'tabContent': Settings(),
    },
  ];

  @override
  void initState() {
    super.initState();
    userService = Provider.of<UserService>(context, listen: false);
  }

  void _changeTab(int index) {
    setState(() {
      widget.tabIndex = index;
    });
  }

  Future<bool> _onWillPopup() {
    if (widget.tabIndex != 0) {
      _changeTab(0);
      return Future.value(false);
    }
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back to Exit',
        backgroundColor: Colors.black,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabsList[widget.tabIndex]['title']),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/dummy-profile.png'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.tabIndex,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        onTap: _changeTab,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.event_available),
            title: new Text('Check In'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.description),
            title: new Text('Help'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.question_answer),
            title: new Text('FAQ'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Settings'),
          ),
        ],
      ),
      body: WillPopScope(
        child: _tabsList[widget.tabIndex]['tabContent'],
        onWillPop: _onWillPopup,
      ),
      // body: _tabsList[widget.tabIndex]['tabContent'],
    );
  }
}
