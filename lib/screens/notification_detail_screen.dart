import 'package:flutter/material.dart';

import 'package:CDCourtServices/screens/profile.dart';

class NotificationDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  const NotificationDetailScreen({
    Key key,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              size: 25,
            ),
            onPressed: () {},
          ),
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
