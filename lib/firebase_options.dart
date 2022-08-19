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
    apiKey: 'AIzaSyAGDw3X-PWJQgktAaljEP4l1H6NKkO8-Wg',
    appId: '1:1009250100035:web:a61a5baec11938c9cc85f6',
    messagingSenderId: '1009250100035',
    projectId: 'fir-auth-app-4f624',
    authDomain: 'fir-auth-app-4f624.firebaseapp.com',
    storageBucket: 'fir-auth-app-4f624.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTP14O3Pr9VvkIheEk1gj6rAUPt60NF5Y',
    appId: '1:1009250100035:android:6d6e7971683f23e6cc85f6',
    messagingSenderId: '1009250100035',
    projectId: 'fir-auth-app-4f624',
    storageBucket: 'fir-auth-app-4f624.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiXpjLWQ7PyIJMpFsMkYoY2DUD6Y5qir4',
    appId: '1:1009250100035:ios:b97c9f1100d5a0cecc85f6',
    messagingSenderId: '1009250100035',
    projectId: 'fir-auth-app-4f624',
    storageBucket: 'fir-auth-app-4f624.appspot.com',
    iosClientId: '1009250100035-4uvo6djtll0rpk6um4ujefgh4pap208p.apps.googleusercontent.com',
    iosBundleId: 'com.example.authDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiXpjLWQ7PyIJMpFsMkYoY2DUD6Y5qir4',
    appId: '1:1009250100035:ios:b97c9f1100d5a0cecc85f6',
    messagingSenderId: '1009250100035',
    projectId: 'fir-auth-app-4f624',
    storageBucket: 'fir-auth-app-4f624.appspot.com',
    iosClientId: '1009250100035-4uvo6djtll0rpk6um4ujefgh4pap208p.apps.googleusercontent.com',
    iosBundleId: 'com.example.authDemo',
  );
}
