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
        return macos;
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
    apiKey: 'AIzaSyA5HKYdJ39tb3gmf8MDR3zR5KZa4UVFXGs',
    appId: '1:87463793718:web:4e3b216c8d8a6de86f3497',
    messagingSenderId: '87463793718',
    projectId: 'wotastagram',
    authDomain: 'wotastagram.firebaseapp.com',
    databaseURL: 'https://wotastagram-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'wotastagram.appspot.com',
    measurementId: 'G-CX25GHFYJ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfmm4YfZ3PEBcV1DM0PVy2g4HlEuDozH0',
    appId: '1:87463793718:android:4a47300e7d4d0b776f3497',
    messagingSenderId: '87463793718',
    projectId: 'wotastagram',
    databaseURL: 'https://wotastagram-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'wotastagram.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEGpqzCfGMNB38u-MGBCqHdmsKfGRIWkk',
    appId: '1:87463793718:ios:2cb433e21b90c5c46f3497',
    messagingSenderId: '87463793718',
    projectId: 'wotastagram',
    databaseURL: 'https://wotastagram-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'wotastagram.appspot.com',
    iosBundleId: 'com.example.wotastagram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEGpqzCfGMNB38u-MGBCqHdmsKfGRIWkk',
    appId: '1:87463793718:ios:a8c1a2cf24e300d66f3497',
    messagingSenderId: '87463793718',
    projectId: 'wotastagram',
    databaseURL: 'https://wotastagram-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'wotastagram.appspot.com',
    iosBundleId: 'com.example.wotastagram.RunnerTests',
  );
}
