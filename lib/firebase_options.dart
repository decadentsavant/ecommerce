// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, no_default_cases
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyABqPW07ZYV14sQ7mNIshzi9Gy9DCHBp-0',
    appId: '1:489002468134:web:831bcf03b09ad3fe71f7e7',
    messagingSenderId: '489002468134',
    projectId: 'ecommerce-portfolio-corey',
    authDomain: 'ecommerce-portfolio-corey.firebaseapp.com',
    storageBucket: 'ecommerce-portfolio-corey.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvo8YZaJ1TkuzNc3rt73uW2nQv-z2Eovc',
    appId: '1:489002468134:android:7e458de4cd7d981e71f7e7',
    messagingSenderId: '489002468134',
    projectId: 'ecommerce-portfolio-corey',
    storageBucket: 'ecommerce-portfolio-corey.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBma3pXyEnalVoH19bUzPGfLTWWy6HkIuI',
    appId: '1:489002468134:ios:7e6e529f9796ae5c71f7e7',
    messagingSenderId: '489002468134',
    projectId: 'ecommerce-portfolio-corey',
    storageBucket: 'ecommerce-portfolio-corey.appspot.com',
    iosClientId: '489002468134-bmtnms408clmqfn5ggkvtto4undnsu3j.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBma3pXyEnalVoH19bUzPGfLTWWy6HkIuI',
    appId: '1:489002468134:ios:7e6e529f9796ae5c71f7e7',
    messagingSenderId: '489002468134',
    projectId: 'ecommerce-portfolio-corey',
    storageBucket: 'ecommerce-portfolio-corey.appspot.com',
    iosClientId: '489002468134-bmtnms408clmqfn5ggkvtto4undnsu3j.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );
}
