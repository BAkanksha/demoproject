import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDemo-web-key-replace-with-actual',
    appId: '1:123456789:web:demo-app-id',
    messagingSenderId: '123456789',
    projectId: 'flutter-intern-demo',
    authDomain: 'flutter-intern-demo.firebaseapp.com',
    storageBucket: 'flutter-intern-demo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDemo-android-key-replace-with-actual',
    appId: '1:123456789:android:demo-app-id',
    messagingSenderId: '123456789',
    projectId: 'flutter-intern-demo',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDemo-ios-key-replace-with-actual',
    appId: '1:123456789:ios:demo-app-id',
    messagingSenderId: '123456789',
    projectId: 'flutter-intern-demo',
    iosBundleId: 'com.example.flutterInternApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDemo-macos-key-replace-with-actual',
    appId: '1:123456789:macos:demo-app-id',
    messagingSenderId: '123456789',
    projectId: 'flutter-intern-demo',
    iosBundleId: 'com.example.flutterInternApp',
  );
}