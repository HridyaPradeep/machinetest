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
    apiKey: 'AIzaSyAtJYDWVVbOHujnyLD-jttwAyKI2xleGJg',
    appId: '1:1090977795017:web:eaa2af21e7e2bc7bd8b618',
    messagingSenderId: '1090977795017',
    projectId: 'machinetest-b7388',
    authDomain: 'machinetest-b7388.firebaseapp.com',
    storageBucket: 'machinetest-b7388.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzRB5Kmw_w_-6SJdw13BfnyFUCNw_1rjQ',
    appId: '1:1090977795017:android:223e3984ce75d337d8b618',
    messagingSenderId: '1090977795017',
    projectId: 'machinetest-b7388',
    storageBucket: 'machinetest-b7388.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDca8GuMo8LCw8tlPJOX5a76w_De5tu2AA',
    appId: '1:1090977795017:ios:5c132e4db46e0773d8b618',
    messagingSenderId: '1090977795017',
    projectId: 'machinetest-b7388',
    storageBucket: 'machinetest-b7388.appspot.com',
    iosBundleId: 'com.example.machinetest',
  );
}
