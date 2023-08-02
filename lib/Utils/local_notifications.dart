import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freelancer_app/constants.dart';

class NotificationService {
  //Hanle displaying of notifications.
  static final NotificationService _notificationService =
      NotificationService._internal();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal() {}

  void init() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: _androidInitializationSettings,
      iOS: DarwinInitializationSettings()
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void createLocalNotification(int max, int progress, int notification_id) {
    //show the notifications.
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'progress_channel', 'progress channel',
        channelDescription: 'progress channel description',
        channelShowBadge: false,
        importance: Importance.max,
        priority: Priority.high,
        onlyAlertOnce: true,
        showProgress: true,
        ongoing: true,
        maxProgress: max,
        progress: progress);
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    _flutterLocalNotificationsPlugin.show(notification_id,
        'Charging in progress', '$progress% charged', platformChannelSpecifics,
        payload: 'item x');
  }

  cancelLocalNotification(int id) {
    _flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> showProgressNotification(int progress) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'progress_notification_channel',
      'Progress Notification',
      channelDescription: 'Notification for progress updates',
      importance: Importance.low,
      priority: Priority.low,
      showProgress: true,
      maxProgress: 100,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Unique ID for the notification
      'Charging your vehicle...',
      '$progress% complete',
      platformChannelSpecifics,
      payload: 'progress_notification',
    );
  }

  Future<void> showCompletionNotification() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'completion_notification_channel',
      'Completion Notification',
      channelDescription: 'Notification for upload completion',
      importance: Importance.high,
      priority: Priority.high,
      showProgress: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin
        .cancel(0); // Hide progress notification
    await flutterLocalNotificationsPlugin.show(
      1, // Unique ID for the completion notification
      'Upload Complete',
      'Your file has been uploaded successfully!',
      platformChannelSpecifics,
      payload: 'completion_notification',
    );
  }
}
