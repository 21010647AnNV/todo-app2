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
    apiKey: 'AIzaSyD99RL_-eXj3hs8hfyUs1y1L1oV9ZpvOD0',
    appId: '1:821263583292:web:115cf5faa575ab4e2c9b39',
    messagingSenderId: '821263583292',
    projectId: 'todo2-7e59b',
    authDomain: 'todo2-7e59b.firebaseapp.com',
    storageBucket: 'todo2-7e59b.appspot.com',
    measurementId: 'G-8C8465RSSB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpX-746m2EAVOqaeRAJWyjZTvSsyqtE9E',
    appId: '1:821263583292:android:8d85b703fd25d7a42c9b39',
    messagingSenderId: '821263583292',
    projectId: 'todo2-7e59b',
    storageBucket: 'todo2-7e59b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDU3lx6MppweoSzB7VemVXdtnONaPGkJbM',
    appId: '1:821263583292:ios:83302bedc4bae2d42c9b39',
    messagingSenderId: '821263583292',
    projectId: 'todo2-7e59b',
    storageBucket: 'todo2-7e59b.appspot.com',
    iosClientId: '821263583292-3jo39c730ep6j8cvrr1pcffr5o1v47pr.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}
