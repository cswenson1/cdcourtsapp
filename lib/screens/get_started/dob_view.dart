import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:CDCourtServices/models/User.dart';
import 'package:CDCourtServices/screens/get_started/phone_view.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GetStartedDobView extends StatefulWidget {
  final User user;

  GetStartedDobView({Key key, @required this.user}) : super(key: key);

  @override
  _GetStartedDobViewState createState() => _GetStartedDobViewState();
}

class _GetStartedDobViewState extends State<GetStartedDobView> {
  DateTime _selectedDate;
  bool _validate = false;
  String _errorMessage = '';
  TextEditingController _dobController = new TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    _dobController.text = widget.user.dob;

    _selectDate(BuildContext context) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(), // Refer step 1
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
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
                          'What is your Date of Birth?',
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
                          'Please enter your Date of Birth here.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      inputFormatters: [maskFormatter],
                      controller: _dobController,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.event),
                        border: OutlineInputBorder(),
                        labelText: 'Date of Birth',
                        contentPadding: EdgeInsets.all(20),
                        errorText: _validate ? _errorMessage : null,
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      onTap: () => _selectDate(context),
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
                              widget.user.dob = _dobController.text;
                              if (_dobController.text.isEmpty) {
                                setState(() {
                                  _validate = true;
                                  _errorMessage = 'Please Choose A Date';
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
                                    builder: (context) => GetStartedPhoneView(
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
