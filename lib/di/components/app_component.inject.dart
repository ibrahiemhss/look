import 'app_component.dart' as _i1;
import '../modules/local_module.dart' as _i2;
import '../modules/firbase_modules.dart' as _i3;
import '../../data/sharedpref/shared_preference_helper.dart' as _i4;
import 'package:dio/src/dio.dart' as _i5;
import '../../data/network/dio_client.dart' as _i6;
import '../../data/network/rest_client.dart' as _i7;
import '../../data/network/apis/intro/intro_api.dart' as _i8;
import '../../data/local/datasources/post/post_datasource.dart' as _i9;
import '../../data/network/check_internet/check_internet.dart' as _i10;
import 'package:firebase_messaging/firebase_messaging.dart' as _i11;
import '../../data/firebase/firebase_helper.dart' as _i12;
import '../../data/repository.dart' as _i13;
import 'dart:async' as _i14;
import '../modules/netwok_module.dart' as _i15;
import '../modules/preference_module.dart' as _i16;
import '../../main.dart' as _i17;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._localModule, this._firebaseModule);

  final _i2.LocalModule _localModule;

  final _i3.FirebaseModule _firebaseModule;

  _i4.SharedPreferenceHelper _singletonSharedPreferenceHelper;

  _i5.Dio _singletonDio;

  _i6.DioClient _singletonDioClient;

  _i7.RestClient _singletonRestClient;

  _i8.IntroApi _singletonIntroApi;

  _i9.PostDataSource _singletonPostDataSource;

  _i10.CheckInternet _singletonCheckInternet;

  _i11.FirebaseMessaging _singletonFirebaseMessaging;

  _i12.FirebaseHelper _singletonFirebaseHelper;

  _i13.Repository _singletonRepository;

  static _i14.Future<_i1.AppComponent> create(
      _i15.NetworkModule _,
      _i2.LocalModule localModule,
      _i16.PreferenceModule __,
      _i3.FirebaseModule firebaseModule) async {
    final injector = AppComponent$Injector._(localModule, firebaseModule);

    return injector;
  }

  _i17.MyApp _createMyApp() => _i17.MyApp();

  _i13.Repository _createRepository() =>
      _singletonRepository ??= _localModule.provideRepository(
          _createIntroApi(),
          _createSharedPreferenceHelper(),
          _createPostDataSource(),
          _createCheckInternet(),
          _createFirebaseHelper());

  _i8.IntroApi _createIntroApi() => _singletonIntroApi ??=
      _localModule.provideIntroApi(_createDioClient(), _createRestClient());

  _i6.DioClient _createDioClient() =>
      _singletonDioClient ??= _localModule.provideDioClient(_createDio());

  _i5.Dio _createDio() => _singletonDio ??=
      _localModule.provideDio(_createSharedPreferenceHelper());

  _i4.SharedPreferenceHelper _createSharedPreferenceHelper() =>
      _singletonSharedPreferenceHelper ??=
          _firebaseModule.provideSharedPreferenceHelper();

  _i7.RestClient _createRestClient() =>
      _singletonRestClient ??= _localModule.provideRestClient();

  _i9.PostDataSource _createPostDataSource() =>
      _singletonPostDataSource ??= _localModule.providePostDataSource();

  _i10.CheckInternet _createCheckInternet() =>
      _singletonCheckInternet ??= _localModule.provideCheckInternet();

  _i12.FirebaseHelper _createFirebaseHelper() =>
      _singletonFirebaseHelper ??= _firebaseModule.provideFirebaseHelper(
          _createFirebaseMessaging(), _createSharedPreferenceHelper());

  _i11.FirebaseMessaging _createFirebaseMessaging() =>
      _singletonFirebaseMessaging ??=
          _firebaseModule.provideFirebaseMessaging();

  @override
  _i17.MyApp get app => _createMyApp();

  @override
  _i13.Repository getRepository() => _createRepository();
}
