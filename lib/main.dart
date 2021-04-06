import 'package:CDCourtServices/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:CDCourtServices/size_config.dart';
import 'package:CDCourtServices/screens/home.dart';
import './screens/get_started/name_view.dart';
import 'package:CDCourtServices/models/User.dart';
import 'package:CDCourtServices/services/user_service.dart';
import 'package:CDCourtServices/services/faq_service.dart';
import 'package:CDCourtServices/services/document_service.dart';
import 'package:CDCourtServices/push_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    PushNotificationsManager pushNotification = new PushNotificationsManager();
    pushNotification.init();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => UserService(),
                ),
                ChangeNotifierProvider(
                  create: (context) => FaqService(),
                ),
                ChangeNotifierProvider(
                  create: (context) => LocationService(),
                ),
                ChangeNotifierProvider(
                  create: (context) => DocumentService(),
                )
              ],
              child: GestureDetector(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Main(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Main extends StatefulWidget {
  const Main({
    Key key,
  }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  bool isLoadingInfo = false;
  bool isInit = false;
  UserService _userService;

  @override
  void initState() {
    super.initState();
    _userService = Provider.of<UserService>(context, listen: false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInit) {
      verifyAuth();
    }
    isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    final user = new User(name: null, email: null, dob: null, phone: null);
    return !isLoadingInfo
        ? Container(
            color: Colors.white,
          )
        : GetStartedNameView(
            user: user,
          );
  }

  Future<void> verifyAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      String token = prefs.getString('token');
      String email = prefs.getString('email');
      if (token != '') {
        bool isJWTExpired = JwtDecoder.isExpired(token);
        if (!isJWTExpired) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Home(
                  tabIndex: 0,
                ),
              ),
              (Route<dynamic> route) => false);
        } else {
          if (email != null && email != '') {
            _userService.refreshToken().then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => Home(
                      tabIndex: 0,
                    ),
                  ),
                  (Route<dynamic> route) => false);
            });
          } else {
            setState(() {
              isLoadingInfo = true;
            });
          }
        }
      } else {
        setState(() {
          isLoadingInfo = true;
        });
      }
    } else {
      setState(() {
        isLoadingInfo = true;
      });
    }
  }
}
