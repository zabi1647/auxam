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
    apiKey: 'AIzaSyCACRwqBZWSQkeqdw5P2g32HvNDlWEjZlo',
    appId: '1:428575839957:web:4fe980548baa7b47d1745c',
    messagingSenderId: '428575839957',
    projectId: 'auxam-12d63',
    authDomain: 'auxam-12d63.firebaseapp.com',
    storageBucket: 'auxam-12d63.appspot.com',
    measurementId: 'G-WCRC8J0CSG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGqpsNkeDInghMIBnsgqUvta2nNX5k61k',
    appId: '1:428575839957:android:8f701585902ffe30d1745c',
    messagingSenderId: '428575839957',
    projectId: 'auxam-12d63',
    storageBucket: 'auxam-12d63.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFmamNZo7rbHiJHzBKnQ29u0CbvksUh88',
    appId: '1:428575839957:ios:f30816362308b640d1745c',
    messagingSenderId: '428575839957',
    projectId: 'auxam-12d63',
    storageBucket: 'auxam-12d63.appspot.com',
    iosBundleId: 'com.example.auxam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFmamNZo7rbHiJHzBKnQ29u0CbvksUh88',
    appId: '1:428575839957:ios:d81024fe2b9b2493d1745c',
    messagingSenderId: '428575839957',
    projectId: 'auxam-12d63',
    storageBucket: 'auxam-12d63.appspot.com',
    iosBundleId: 'com.example.auxam.RunnerTests',
  );
}
