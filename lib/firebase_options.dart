// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBNt4CZrH5_boLsWkjWwvGt9ezSY6b4GPU',
    appId: '1:114034378492:web:d49490f16ad777aa2df979',
    messagingSenderId: '114034378492',
    projectId: 'push-notification-d0adc',
    authDomain: 'push-notification-d0adc.firebaseapp.com',
    storageBucket: 'push-notification-d0adc.appspot.com',
    measurementId: 'G-LEQN0QYB33',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2I0rkAv9LfvO9nL1OCcrW6jE6sTnVo0c',
    appId: '1:114034378492:android:98043e16a9fe17642df979',
    messagingSenderId: '114034378492',
    projectId: 'push-notification-d0adc',
    storageBucket: 'push-notification-d0adc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAF8jcmVnvHdLRDtHNHceZ9Z4SYZapdPyo',
    appId: '1:114034378492:ios:92e2c3c5adfa6c8f2df979',
    messagingSenderId: '114034378492',
    projectId: 'push-notification-d0adc',
    storageBucket: 'push-notification-d0adc.appspot.com',
    iosClientId: '114034378492-u5otn15i49fsndrsetfcf1tklf8vjnhn.apps.googleusercontent.com',
    iosBundleId: 'com.example.pushnotification',
  );
}