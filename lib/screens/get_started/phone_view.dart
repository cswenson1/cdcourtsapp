import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:CDCourtServices/models/User.dart';
import 'package:CDCourtServices/services/user_service.dart';
import 'package:CDCourtServices/screens/welcome.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GetStartedPhoneView extends StatefulWidget {
  final User user;

  GetStartedPhoneView({Key key, @required this.user}) : super(key: key);

  @override
  _GetStartedPhoneViewState createState() => _GetStartedPhoneViewState();
}

class _GetStartedPhoneViewState extends State<GetStartedPhoneView> {
  UserService userService;
  bool _validate = false;
  String _errorMessage = '';
  TextEditingController _phoneController = new TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '(###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    userService = Provider.of<UserService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    _phoneController.text = widget.user.phone;

    void register(BuildContext context) {
      if (widget.user != null) {
        userService.login(widget.user).then((value) {
          if (value != null) {
            print('Login Successfull!');
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Welcome(),
              ),
              (Route<dynamic> route) => false,
            );
          }
          print('Here');
          print(value);
        });
      }
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
                          'What is your Phone Number?',
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
                          'For your safety, we will send you a code on your email.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _phoneController,
                      inputFormatters: [maskFormatter],
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
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
                              widget.user.phone =
                                  maskFormatter.getUnmaskedText();
                              if (_phoneController.text.isEmpty ||
                                  maskFormatter.getUnmaskedText().length < 10) {
                                setState(() {
                                  _validate = true;
                                  _errorMessage =
                                      'Please Enter Your Phone Number';
                                });
                                return;
                              } else {
                                register(context);
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
