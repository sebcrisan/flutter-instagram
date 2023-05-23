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
    apiKey: 'AIzaSyBNJdXITZmojls-K2hvXLKb7JuF8UDiyP0',
    appId: '1:130515049776:web:f2212af6fa5920b29d3cf5',
    messagingSenderId: '130515049776',
    projectId: 'instaclone-gaiseric',
    authDomain: 'instaclone-gaiseric.firebaseapp.com',
    storageBucket: 'instaclone-gaiseric.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZwvf7NvGQWPHw3nj0n3qPrPwOI3HmPgQ',
    appId: '1:130515049776:android:1e2d4813bd9bfa5a9d3cf5',
    messagingSenderId: '130515049776',
    projectId: 'instaclone-gaiseric',
    storageBucket: 'instaclone-gaiseric.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZfa8oOMu5qGG-eRyN4k3ahG0h28bWtig',
    appId: '1:130515049776:ios:193fa49dbd965d829d3cf5',
    messagingSenderId: '130515049776',
    projectId: 'instaclone-gaiseric',
    storageBucket: 'instaclone-gaiseric.appspot.com',
    iosClientId: '130515049776-fl4nslb7cv0sorv806bta7admkr5n0om.apps.googleusercontent.com',
    iosBundleId: 'com.example.instaclone',
  );
}