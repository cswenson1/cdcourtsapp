import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:CDCourtServices/screens/home.dart';
import 'package:CDCourtServices/screens/profile.dart';
import 'package:CDCourtServices/models/Notification.dart';
import 'package:CDCourtServices/screens/locations_view.dart';
import 'package:CDCourtServices/services/notification_service.dart';
import 'package:CDCourtServices/screens/notification_detail_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isLoading = true;
  NotificationService notificationService;
  List<Notifications> notifications;
  int notificationCount = 0;

  @override
  void initState() {
    super.initState();
    notificationService = Provider.of<NotificationService>(
      context,
      listen: false,
    );
    getAllNotifications();
  }

  getAllNotifications() async {
    notificationService.getAllNotifications().then((value) {
      setState(() {
        notifications = value;
        isLoading = false;
        notificationCount = notifications.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: notificationCount,
              itemBuilder: (context, index) {
                return new Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.circle,
                            size: 10.0,
                            color: notifications[index].isRead
                                ? Colors.grey
                                : Colors.blue,
                          ),
                        ),
                        title: Text(notifications[index].title),
                        subtitle: Text(notifications[index].description),
                        onTap: () async {
                          List<int> notificationsIDsArray = [
                            notifications[index].id
                          ];
                          bool notificationUpdated = await notificationService
                              .updateNotification(notificationsIDsArray);
                          if (notificationUpdated) {
                            setState(() {
                              notifications[index].isRead = true;
                            });
                            switch (notifications[index].notificationType) {
                              case NotificationType.documentNotification:
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => Home(
                                        tabIndex: 1,
                                      ),
                                    ),
                                    (Route<dynamic> route) => false);
                                break;
                              case NotificationType.locationNotification:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LocationsView(),
                                  ),
                                );
                                break;
                              case NotificationType.none:
                                break;
                              case NotificationType.profileDetailsNotification:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Profile(),
                                  ),
                                );
                                break;
                              case NotificationType.colorUpdated:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationDetailScreen(
                                      title: notifications[index].title,
                                      description:
                                          notifications[index].description,
                                    ),
                                  ),
                                );
                                break;
                              case NotificationType.checkInReminder:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationDetailScreen(
                                      title: notifications[index].title,
                                      description:
                                          notifications[index].description,
                                    ),
                                  ),
                                );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
