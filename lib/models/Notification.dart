enum NotificationType {
  none,
  documentNotification,
  locationNotification,
  profileDetailsNotification,
  colorUpdated
}

class Notifications {
  int id;
  int userId;
  String title;
  String description;
  bool isRead;
  NotificationType notificationType;

  Notifications({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.isRead,
    this.notificationType,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) {
    Notifications notification = new Notifications(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      isRead: json['seen'] == 'n' ? false : true,
    );
    switch (json['notifiable_type']) {
      case 'App\\Models\\ColorDate':
        notification.notificationType = NotificationType.colorUpdated;
        break;
      case 'App\\Models\\Document':
        notification.notificationType = NotificationType.documentNotification;
        break;
      case 'App\\Models\\Office':
        notification.notificationType = NotificationType.locationNotification;
        break;
      case 'App\\Models\\User':
        notification.notificationType =
            NotificationType.profileDetailsNotification;
        break;
      default:
        notification.notificationType = NotificationType.none;
        break;
    }
    return notification;
  }
}
