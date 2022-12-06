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
    apiKey: 'AIzaSyDajeQ8qvTqndMcHtFFuY4f3bhMHKYSPiw',
    appId: '1:988689625010:web:cc7559c8005d46a0ce3eab',
    messagingSenderId: '988689625010',
    projectId: 'murphy-beer',
    authDomain: 'murphy-beer.firebaseapp.com',
    storageBucket: 'murphy-beer.appspot.com',
    measurementId: 'G-V4L4NSYT4R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcHwLgkQXKoOGdiZHrQHnzQ0s7cFqJ6_U',
    appId: '1:988689625010:android:179fbaa66f1c9715ce3eab',
    messagingSenderId: '988689625010',
    projectId: 'murphy-beer',
    storageBucket: 'murphy-beer.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD90qfP-Fq-8gIPN61Su9FGSViGFhIwhT4',
    appId: '1:988689625010:ios:aea8993c308c4bb5ce3eab',
    messagingSenderId: '988689625010',
    projectId: 'murphy-beer',
    storageBucket: 'murphy-beer.appspot.com',
    iosClientId: '988689625010-kek114k2eemkvc852gomraroi16u8lon.apps.googleusercontent.com',
    iosBundleId: 'com.example.murphy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD90qfP-Fq-8gIPN61Su9FGSViGFhIwhT4',
    appId: '1:988689625010:ios:aea8993c308c4bb5ce3eab',
    messagingSenderId: '988689625010',
    projectId: 'murphy-beer',
    storageBucket: 'murphy-beer.appspot.com',
    iosClientId: '988689625010-kek114k2eemkvc852gomraroi16u8lon.apps.googleusercontent.com',
    iosBundleId: 'com.example.murphy',
  );
}
