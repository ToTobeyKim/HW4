// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCRZ2g09VthxKDgwEzp5DYEMR5yIDF--Tw',
    appId: '1:840328429873:web:f57fadb3d02ceb31ab3010',
    messagingSenderId: '840328429873',
    projectId: 'hw-4-6a87a',
    authDomain: 'hw-4-6a87a.firebaseapp.com',
    storageBucket: 'hw-4-6a87a.firebasestorage.app',
    measurementId: 'G-CQYQTXCVKG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFy8MDX-dfWDw7vUHWqfGkf9kc9RRuWJE',
    appId: '1:840328429873:android:44f3fb9b8984ff5dab3010',
    messagingSenderId: '840328429873',
    projectId: 'hw-4-6a87a',
    storageBucket: 'hw-4-6a87a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlbDAfbzVb1wTOe7fRpJE0_SktBoiyUvM',
    appId: '1:840328429873:ios:6b88753ca273c326ab3010',
    messagingSenderId: '840328429873',
    projectId: 'hw-4-6a87a',
    storageBucket: 'hw-4-6a87a.firebasestorage.app',
    iosBundleId: 'com.example.hw4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlbDAfbzVb1wTOe7fRpJE0_SktBoiyUvM',
    appId: '1:840328429873:ios:6b88753ca273c326ab3010',
    messagingSenderId: '840328429873',
    projectId: 'hw-4-6a87a',
    storageBucket: 'hw-4-6a87a.firebasestorage.app',
    iosBundleId: 'com.example.hw4',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCRZ2g09VthxKDgwEzp5DYEMR5yIDF--Tw',
    appId: '1:840328429873:web:e655b647ad213c48ab3010',
    messagingSenderId: '840328429873',
    projectId: 'hw-4-6a87a',
    authDomain: 'hw-4-6a87a.firebaseapp.com',
    storageBucket: 'hw-4-6a87a.firebasestorage.app',
    measurementId: 'G-QBTSGQ1ZSD',
  );
}
