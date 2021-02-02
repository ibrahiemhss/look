import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:look/data/firebase/firebase_helper.dart';
import 'package:look/data/sharedpref/shared_preference_helper.dart';
import 'package:look/di/modules/preference_module.dart';
import 'package:inject/inject.dart';
import 'package:look/services/notifications_service.dart';

@module
class FirebaseModule extends PreferenceModule {
  // ignore: non_constant_identifier_names
  final String TAG = "FirebaseModule";

  // DI Providers:--------------------------------------------------------------
  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  FirebaseMessaging provideFirebaseMessaging() {
    final firebaseMessaging = FirebaseMessaging();
    return firebaseMessaging;
  }

  /// A singleton fxm_client provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  FirebaseHelper provideFirebaseHelper(FirebaseMessaging firebaseMessaging,
          SharedPreferenceHelper sharedPrefHelper) =>
      FirebaseHelper(firebaseMessaging, sharedPrefHelper);
}
