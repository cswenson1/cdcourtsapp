import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:CDCourtServices/screens/home.dart';

class CheckInComplete extends StatefulWidget {
  @override
  _CheckInCompleteState createState() => _CheckInCompleteState();
}

class _CheckInCompleteState extends State<CheckInComplete> {
  String _userName;

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  void _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = (prefs.getString('name') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check In'),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/dummy-profile.png'),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
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
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      'Thank You, $_userName!',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Text(
                      'We\'ve received your request to check in.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'We will reach out to you at the number you\'ve provided.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Home()),
                        ModalRoute.withName('/'));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  textTheme: ButtonTextTheme.normal,
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Text(
                    'CLOSE',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
