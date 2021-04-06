import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'checkin-complete.dart';
import 'package:CDCourtServices/services/user_service.dart';

class RequestCheckIn extends StatefulWidget {
  @override
  _RequestCheckInState createState() => _RequestCheckInState();
}

class _RequestCheckInState extends State<RequestCheckIn> {
  UserService userService;
  DateTime _selectedDate;
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  TextEditingController _dobController = new TextEditingController();
  Map<String, String> formValues = {
    "name": "",
    "phone": "",
    "date_of_checkin": ""
  };

  @override
  void initState() {
    super.initState();
    userService = Provider.of<UserService>(context, listen: false);
  }

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  void _submit() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    final result = await userService.requestCheckIn(formValues);
    if (result) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CheckInComplete(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    _selectDate(BuildContext context) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
      ).then((value) {
        if (value == null) {
          return;
        }
        _selectedDate = value;
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formattedDate = formatter.format(_selectedDate);
        _dobController.text = formattedDate;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Request A Check In'),
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
                      bottom: 40,
                    ),
                    child: Text(
                      'Please enter your name and the phone number we can call you at.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                              contentPadding: EdgeInsets.all(20),
                            ),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            onEditingComplete: () {
                              node.nextFocus();
                            },
                            onSaved: (value) {
                              formValues['name'] = value;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            autocorrect: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone Number',
                              contentPadding: EdgeInsets.all(20),
                            ),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your phone';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              formValues['phone'] = value;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TextFormField(
                            controller: _dobController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            autocorrect: false,
                            maxLines: 1,
                            onTap: () => _selectDate(context),
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.event),
                              border: OutlineInputBorder(),
                              labelText: 'Date',
                              contentPadding: EdgeInsets.all(20),
                            ),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your phone';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              formValues['date_of_checkin'] = value;
                            },
                          ),
                        ),
                      ],
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
                  // onPressed: () {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => CheckInComplete(),
                  //     ),
                  //   );
                  // },
                  onPressed: () => _submit(),
                  color: Colors.blue,
                  textColor: Colors.white,
                  textTheme: ButtonTextTheme.normal,
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Text(
                    'SUBMIT',
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
