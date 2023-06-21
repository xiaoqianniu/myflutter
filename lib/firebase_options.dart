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
    apiKey: 'AIzaSyD9-wClZ4ahRmxPQJZoKZvwzJr-_SBvSpc',
    appId: '1:662907451487:web:657235fd109fc09b9b83ea',
    messagingSenderId: '662907451487',
    projectId: 'my-first-flutter-6a090',
    authDomain: 'my-first-flutter-6a090.firebaseapp.com',
    storageBucket: 'my-first-flutter-6a090.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPUBmaAzltda6gZAgcKPR01f7I42XA3ik',
    appId: '1:662907451487:android:2896425a83273f809b83ea',
    messagingSenderId: '662907451487',
    projectId: 'my-first-flutter-6a090',
    storageBucket: 'my-first-flutter-6a090.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4U2ojSRolZGw_3vfZ9h8oe0FusUsXY9k',
    appId: '1:662907451487:ios:ad629d4053e9d67a9b83ea',
    messagingSenderId: '662907451487',
    projectId: 'my-first-flutter-6a090',
    storageBucket: 'my-first-flutter-6a090.appspot.com',
    iosClientId: '662907451487-egcusn2vpo41kkdk2ucghd9mu8ngdufo.apps.googleusercontent.com',
    iosBundleId: 'com.example.myflutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4U2ojSRolZGw_3vfZ9h8oe0FusUsXY9k',
    appId: '1:662907451487:ios:3e9a17306001ff769b83ea',
    messagingSenderId: '662907451487',
    projectId: 'my-first-flutter-6a090',
    storageBucket: 'my-first-flutter-6a090.appspot.com',
    iosClientId: '662907451487-9o574gism7i0rsjeklaqqsnngc1o1vnm.apps.googleusercontent.com',
    iosBundleId: 'com.example.myflutter.RunnerTests',
  );
}