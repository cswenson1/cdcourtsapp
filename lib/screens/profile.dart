import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:CDCourtServices/screens/home.dart';
import 'package:CDCourtServices/services/user_service.dart';
import 'package:CDCourtServices/models/User.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _title = 'Profile';
  var _editButtonText = 'EDIT PROFILE';
  bool _isEditing = false;
  UserService _userService;
  User _currentUser = new User();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _userService = Provider.of<UserService>(context, listen: false);

    _getCurrentUser();
  }

  _getCurrentUser() async {
    User getUser = await _userService.getCurrentUser();
    setState(() {
      _currentUser = getUser;
      _isLoading = false;
    });
    print(_currentUser.name);
  }

  _changeTab(int index) {
    if (index == 0) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Home(
              tabIndex: 0,
            ),
          ),
          (Route<dynamic> route) => false);
    } else if (index == 1) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Home(
              tabIndex: 1,
            ),
          ),
          (Route<dynamic> route) => false);
    } else if (index == 2) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Home(
              tabIndex: 2,
            ),
          ),
          (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Home(
              tabIndex: 3,
            ),
          ),
          (Route<dynamic> route) => false);
    }
  }

  _enableEditMode() {
    setState(() {
      if (_isEditing) {
        _title = 'Profile';
        _editButtonText = 'EDIT PROFILE';
        _isEditing = false;
      } else {
        _title = 'Edit Profile';
        _editButtonText = 'SAVE PROFILE';
        _isEditing = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/dummy-profile.png'),
            onPressed: () {},
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 3,
      //   backgroundColor: Colors.blue,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.white,
      //   onTap: _changeTab,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.event_available),
      //       title: new Text('Check In'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.description),
      //       title: new Text('Help'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.question_answer),
      //       title: new Text('FAQ'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.settings),
      //       title: new Text('Settings'),
      //     ),
      //   ],
      // ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(bottom: 50),
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue[300],
                                  width: 10,
                                  style: BorderStyle.solid,
                                ),
                                image: DecorationImage(
                                  image: new AssetImage(
                                      'assets/images/dummy-profile.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              initialValue: _currentUser.name,
                              key: Key(_currentUser.name.toString()),
                              focusNode: _isEditing
                                  ? new AlwaysEnabledFocusNode()
                                  : new AlwaysDisabledFocusNode(),
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                                contentPadding: EdgeInsets.all(20),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              initialValue: _currentUser.email,
                              key: Key(_currentUser.email.toString()),
                              focusNode: new AlwaysDisabledFocusNode(),
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                contentPadding: EdgeInsets.all(20),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              initialValue: _currentUser.dob,
                              key: Key(_currentUser.dob.toString()),
                              focusNode: new AlwaysDisabledFocusNode(),
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date Of Birth',
                                contentPadding: EdgeInsets.all(20),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              initialValue: _currentUser.phone,
                              key: Key(_currentUser.phone.toString()),
                              focusNode: new AlwaysDisabledFocusNode(),
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone Number',
                                contentPadding: EdgeInsets.all(20),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              initialValue:
                                  _currentUser.probationOfficer == null
                                      ? 'N/A'
                                      : _currentUser.probationOfficer['name'],
                              key: Key(_currentUser.probationOfficer == null
                                  ? 'N/A'
                                  : _currentUser.probationOfficer['name']
                                      .toString()),
                              focusNode: new AlwaysDisabledFocusNode(),
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Probation Officer',
                                contentPadding: EdgeInsets.all(20),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              initialValue: _currentUser.color == null
                                  ? 'N/A'
                                  : _currentUser.color['name'],
                              key: Key(_currentUser.color == null
                                  ? 'N/A'
                                  : _currentUser.color['name'].toString()),
                              focusNode: new AlwaysDisabledFocusNode(),
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Color',
                                contentPadding: EdgeInsets.all(20),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.home_work_rounded,
                                    size: 40.0,
                                    color: Colors.blue,
                                  ),
                                  title: Text(
                                    _currentUser.office == null
                                        ? 'No Office Assigned'
                                        : _currentUser.office['name'],
                                  ),
                                  subtitle: Text(
                                    _currentUser.office == null
                                        ? ''
                                        : _currentUser.office['address'],
                                  ),
                                  trailing: _currentUser.office != null
                                      ? Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.black,
                                        )
                                      : Text(''),
                                  onTap: () async {
                                    if (_currentUser.office != null) {
                                      MapsLauncher.launchQuery(
                                        _currentUser.office['address'],
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 20, top: 20),
                            child: SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: _enableEditMode,
                                color: Colors.blue,
                                textColor: Colors.white,
                                textTheme: ButtonTextTheme.normal,
                                padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                                child: Text(
                                  _editButtonText,
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
                  ],
                ),
              ),
            ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class AlwaysEnabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => true;
}
