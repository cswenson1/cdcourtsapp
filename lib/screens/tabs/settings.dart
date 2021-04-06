import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'package:CDCourtServices/screens/privacy_policy.dart';
import 'package:CDCourtServices/screens/profile.dart';
import 'package:CDCourtServices/screens/terms_of_use.dart';
import 'package:CDCourtServices/screens/locations_view.dart';

class Settings extends StatelessWidget {
  String version;
  String buildNumber;
  String platform;

  Settings() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
    if (Platform.isAndroid) {
      platform = 'Android';
    } else if (Platform.isIOS) {
      platform = 'iOS';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        color: Colors.grey[200],
                        child: Text('Our Offices'),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => LocationsView(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        color: Colors.grey[200],
                        child: Text('Terms Of Use'),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TermsOfUseView(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        color: Colors.grey[200],
                        child: Text('Privacy Policy'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PrivacyPolicyView(),
                          ));
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        color: Colors.grey[200],
                        child: Text('Profile'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Profile(),
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Text('v${version}b$buildNumber - $platform'),
        ],
      ),
    );
  }
}
