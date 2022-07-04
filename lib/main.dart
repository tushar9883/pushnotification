import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pushnotification/page/page_one.dart';
import 'package:pushnotification/page/page_threess.dart';
import 'package:pushnotification/page/page_two.dart';
import 'package:pushnotification/pushniti.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Notification',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FirebaseMessaging _messaging;
  PushNotification? _notificationInfo;
  String? token;

  final check = TextEditingController();

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.instance.getToken().then((value) async {
      print("TOKEN-----------$value");
      token = value;
    });

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(
            'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');

        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );

        setState(() {
          print("change${message.notification?.body}121212121");
          // if (message.notification?.body == 'first') {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => One(
          //               token: token!,
          //             )),
          //   );
          // } else if (message.notification?.body == 'second') {
          //   print("dataaaaaaaaaaaaaa");
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => Two(
          //               token: token!,
          //             )),
          //   );
          // } else if (message.notification?.body == "Three") {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => Three(
          //               token: token!,
          //             )),
          //   );
          // } else {
          //   "Something Wrong";
          // }
          _notificationInfo = notification;
        });

        if (_notificationInfo != null) {
          // For displaying the notification as an overlay
          showOverlayNotification(
              (context) => Material(
                    child: ListTile(
                      onTap: () {
                        if (message.notification?.body == 'first') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => One(
                                      token: token!,
                                    )),
                          );
                        } else if (message.notification?.body == 'second') {
                          print("dataaaaaaaaaaaaaa");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Two(
                                      token: token!,
                                    )),
                          );
                        } else if (message.notification?.body == "Three") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Three(
                                      token: token!,
                                    )),
                          );
                        } else {
                          "Something Wrong";
                        }
                        print('test');
                      },
                      title: Text(
                        _notificationInfo!.title!,
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(_notificationInfo!.body!),
                      tileColor: Colors.lightGreen,
                    ),
                  ),
              duration: const Duration(seconds: 3));
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        if (initialMessage.notification?.body == 'first') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => One(
                      token: token!,
                    )),
          );
        } else if (initialMessage.notification?.body == 'second') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Two(
                      token: token!,
                    )),
          );
        } else if (initialMessage.notification?.body == "Three") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Three(
                      token: token!,
                    )),
          );
        } else {
          "Something Wrong";
        }
      });
    }
  }

  @override
  void initState() {
    registerNotification();
    checkForInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        if (message.notification?.body == 'first') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => One(token: token!)),
          );
        } else if (message.notification?.body == 'second') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Two(
                      token: token!,
                    )),
          );
        } else if (message.notification?.body == "Three") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Three(
                      token: token!,
                    )),
          );
        } else {
          "Something Wrong";
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Notifications',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            TextField(
              controller: check,
            ),
            Center(
              //child: Text(token),
              child: ElevatedButton(
                onPressed: () {
                  FirebaseMessaging.instance.getToken().then((value) async {
                    print("TOKEN-----------$value");
                    token = value;
                  });
                  check.text = token!;
                },
                child: const Text("Click"),
              ),
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            _notificationInfo != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(token!),
                      ),
                      Center(
                        child: Text(
                          'TITLE: ${_notificationInfo!.dataTitle ?? _notificationInfo!.title}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Center(
                        child: Text(
                          'BODY: ${_notificationInfo!.dataBody ?? _notificationInfo!.body}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class NotificationBadge extends StatelessWidget {
  final int totalNotifications;

  const NotificationBadge({Key? key, required this.totalNotifications})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$totalNotifications',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
