import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:CDCourtServices/screens/request_checkin.dart';
import 'package:CDCourtServices/services/user_service.dart';

class CheckIn extends StatefulWidget {
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  String _userName;
  UserService userService;
  String _checkInMessage = 'You are required to check in each month.';
  String _checkInNotice =
      'Due to COVID-19, your check in will be over the phone';
  bool isCheckedIn = false;

  @override
  void initState() {
    print('Init State of CheckIn');
    super.initState();
    userService = Provider.of<UserService>(context, listen: false);
    _getUserName();
    _isUserCheckedIn().then((value) {
      setState(() {
        isCheckedIn = value;
        if (value) {
          _checkInMessage = 'Your check in for the current month is completed.';
          _checkInNotice = 'Your next check in will be next month';
        }
      });
    });
  }

  void _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = (prefs.getString('name') ?? '');
    });
  }

  Future<bool> _isUserCheckedIn() async {
    bool isCheckedIn = false;
    isCheckedIn = await userService.isCheckedIn();
    return isCheckedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'Hi, $_userName!',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    _checkInMessage,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  _checkInNotice,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          isCheckedIn
              ? Container()
              : Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RequestCheckIn(),
                        ));
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      textTheme: ButtonTextTheme.normal,
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      child: Text(
                        'REQUEST A CHECK IN',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
