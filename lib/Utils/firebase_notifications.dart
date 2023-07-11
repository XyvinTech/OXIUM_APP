import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FireBaseNotification {
  //make it singleTone class
  static final FireBaseNotification _singleton =
      FireBaseNotification._internal();
  factory FireBaseNotification() {
    return _singleton;
  }

  init() {
    requestPermission();
    loadFCM();
    listenFCM();
    setNotificationId();
  }

  FireBaseNotification._internal();
  //code starts from here

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  var channel;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  String serverKey =
      "AAAAiPMmfg0:APA91bGMbmhLdnHEWcIAyj8kLqm6hwLS6DvSG2vZCXCWSb8CLRCndGgFNjaXNKUT91tmyOOP_ajypoxS9MGi5YD1JaxZvkcNHgArnK-SrFFtqV-iAKoYHCeVE7FWS40DUdMQJwapu8m8";

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void loadFCM() async {
    channel = AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
            'This channel is very important and primary channel for notifications',
        importance: Importance.high,
        enableVibration: true,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('default'));

    // flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  void listenFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        log(message.toString());
        message.toMap().printInfo();
        log(message.notification!.title.toString());
        // flutterLocalNotificationsPlugin.show(
        //   notification.hashCode,
        //   notification.title,
        //   notification.body,
        //   NotificationDetails(
        //     android: AndroidNotificationDetails(
        //       channel.id, channel.name,
        //       // TODO add a proper drawable resource to android, for now using
        //       //      one that already exists in example app.
        //       icon: 'logo',
        //       playSound: false,
        //       fullScreenIntent: false,
        //       // sound: RawResourceAndroidNotificationSound('eshogol_tone'),
        //       sound: RawResourceAndroidNotificationSound('default'),
        //     ),
        //   ),
        // );
      }
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        redirectWhenClickedOnNotifications(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      log("onMessageOpenedApp: ${message.data}");
      redirectWhenClickedOnNotifications(message);
    });
  }

  redirectWhenClickedOnNotifications(message) {
    if (message.data['student_id'].isEmpty) {
    } else if (message.data["screen"] == "chat_screen") {
      // Get.toNamed(Routes.chatPagesRoutes, arguments: {
      //   "name": message.data["student_name"],
      //   "image": message.data["student_image"],
      //   "phone": message.data["student_phone"],
      // });
    }
  }

  static void sendPushMessage(String body, String title, String token,
      {String? nextScreen}) async {
    try {
      var bodyData = jsonEncode(
        {
          'notification': {
            'body': body,
            'title': title,
            'imageUrl':
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Prince_Alfred_of_Great_Britain.jpg/242px-Prince_Alfred_of_Great_Britain.jpg',
            'sound': 'eshogol_tone',
            'android_channel_id': 'high_importance_channel',
            'channel_id': 'high_importance_channel'
          },
          'priority': 'high',
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done',
          },
          "to": token,
        },
      );

      var res = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=${FireBaseNotification().serverKey}',
        },
        body: bodyData,
      );
      print(res.body);
      print(bodyData);
      print(token);
      print('done');
    } catch (e) {
      print("error push notification");
    }
  }

  setNotificationId() async {
    if (appData.token.isEmpty) {
      await FirebaseMessaging.instance.getToken().then((token) {
        appData.notification_token = token ?? '';
        kLog('notification_token: ' + (token ?? 'no token'));
        print('notification_token: ' + (token ?? 'no token'));
      });
      // await userCollection.update({"player_id": mtoken});
    }
  }
}
