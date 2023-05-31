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
    apiKey: 'AIzaSyAzI13sPEjpj1NDfu2TueexathBOgmYGXk',
    appId: '1:493750287966:web:4e3f0b5ebab2d4923cfecf',
    messagingSenderId: '493750287966',
    projectId: 'mycycle-8a317',
    authDomain: 'mycycle-8a317.firebaseapp.com',
    storageBucket: 'mycycle-8a317.appspot.com',
    measurementId: 'G-VYYSH30L14',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCST1UwqwMqnbhRMdAcReBVNp0lW-eWccY',
    appId: '1:493750287966:android:a43f6b086703d1fe3cfecf',
    messagingSenderId: '493750287966',
    projectId: 'mycycle-8a317',
    storageBucket: 'mycycle-8a317.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqe4bY1p8c9bTiqDk-3O7Oz-CXebGpkWA',
    appId: '1:493750287966:ios:57abd1c293f214da3cfecf',
    messagingSenderId: '493750287966',
    projectId: 'mycycle-8a317',
    storageBucket: 'mycycle-8a317.appspot.com',
    androidClientId: '493750287966-2jbcg6u06u3jn5hi0q4jcg3g1l5s8pqu.apps.googleusercontent.com',
    iosClientId: '493750287966-f7i8ulurrinvjnb1tcrhslgu1og9uih4.apps.googleusercontent.com',
    iosBundleId: 'com.example.storeSide',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAqe4bY1p8c9bTiqDk-3O7Oz-CXebGpkWA',
    appId: '1:493750287966:ios:57abd1c293f214da3cfecf',
    messagingSenderId: '493750287966',
    projectId: 'mycycle-8a317',
    storageBucket: 'mycycle-8a317.appspot.com',
    androidClientId: '493750287966-2jbcg6u06u3jn5hi0q4jcg3g1l5s8pqu.apps.googleusercontent.com',
    iosClientId: '493750287966-f7i8ulurrinvjnb1tcrhslgu1og9uih4.apps.googleusercontent.com',
    iosBundleId: 'com.example.storeSide',
  );
}