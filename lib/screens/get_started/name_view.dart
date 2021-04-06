import 'package:flutter/material.dart';

import 'package:CDCourtServices/models/User.dart';
import 'package:CDCourtServices/screens/get_started/email_view.dart';

class GetStartedNameView extends StatefulWidget {
  final User user;

  GetStartedNameView({Key key, @required this.user}) : super(key: key);

  @override
  _GetStartedNameViewState createState() => _GetStartedNameViewState();
}

class _GetStartedNameViewState extends State<GetStartedNameView> {
  bool _validate = false;
  String _errorMessage = '';
  TextEditingController _nameController = new TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    _nameController.text = widget.user.name;

    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/icon/icon_transparent.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Text(
                          'What is your Name?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: Text(
                          'Please enter your First & Last name here.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        contentPadding: EdgeInsets.all(20),
                        errorText: _validate ? _errorMessage : null,
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 136.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              widget.user.name = _nameController.text;
                              if (_nameController.text.isEmpty) {
                                setState(() {
                                  _validate = true;
                                  _errorMessage = 'Please Enter Your Name';
                                });
                                return;
                              } else {
                                setState(() {
                                  _validate = false;
                                  _errorMessage = '';
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GetStartedEmailView(
                                      user: widget.user,
                                    ),
                                  ),
                                );
                              }
                            },
                            color: themeData.primaryColor,
                            textColor: Colors.white,
                            textTheme: ButtonTextTheme.normal,
                            padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                            child: Text(
                              localizations.continueButtonLabel,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
