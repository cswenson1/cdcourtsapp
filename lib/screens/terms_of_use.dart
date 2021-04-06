import 'package:flutter/material.dart';

import 'package:CDCourtServices/screens/profile.dart';

class TermsOfUseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms Of Use'),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/dummy-profile.png'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Terms Of Use',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'Today\'s business world is largely dependent on data and the information that is derived from that data.',
                  ),
                  TextSpan(text: '\n'),
                  TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        'Data is critical for businesses that process that information to provide services and products to their customers. From a corporate context, in a company - from the top executive level right down to the operational level - just about everyone relies heavily on information.',
                  ),
                  TextSpan(text: '\n'),
                  TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        'In a complex environment where so much depends on the data that businesses collect and process, protecting that information becomes increasingly important. Among the steps business owners take to protect the data of their users, drafting a clear and concise Privacy Policy agreement holds central importance.',
                  ),
                  TextSpan(text: '\n'),
                  TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        'Users may also give Pinterest permission to access information that is shared with other websites like Facebook and Twitter by linking their Pinterest account with them. This information would also include information about their friends and followers. The account settings have information about how much access Pinterest has to their users',
                  )
                ],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
