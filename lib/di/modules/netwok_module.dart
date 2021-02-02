import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:look/data/network/apis/intro/intro_api.dart';
import 'package:look/data/network/check_internet/check_internet.dart';
import 'package:look/data/network/constants/endpoints.dart';
import 'package:look/data/network/dio_client.dart';
import 'package:look/data/network/rest_client.dart';
import 'package:look/data/sharedpref/constants/preferences.dart';
import 'package:look/data/sharedpref/shared_preference_helper.dart';
import 'package:look/di/modules/preference_module.dart';
import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
class NetworkModule extends PreferenceModule {
  // ignore: non_constant_identifier_names
  final String TAG = "NetworkModule";
  Future<bool> _isConnected;

  // constructor
  // Note: Do not change the order in which providers are called, it might cause
  // some issues
  NetworkModule() {
    _isConnected = provideDataConnectionChecker();
  }
  @provide
  @singleton
  @asynchronous
  Future<bool> provideDataConnectionChecker() async{
   return DataConnectionChecker().hasConnection;
  }

  @provide
  @singleton
  CheckInternet provideCheckInternet(){
    _isConnected.then((value) {
      return CheckInternet(value);

    });
  }
  // DI Providers:--------------------------------------------------------------
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  ///
  @provide
  @singleton
  Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (Options options) async {
            // getting shared pref instance
            var prefs = await SharedPreferences.getInstance();

            // getting token
            var token = prefs.getString(Preferences.auth_token);

            if (token != null) {
              options.headers.putIfAbsent('Authorization', () => token);
            } else {
              print('Auth token is null');
            }
          },
        ),
      );

    return dio;
  }

  /// A singleton dio_client provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  DioClient provideDioClient(Dio dio) => DioClient(dio);

  /// A singleton dio_client provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  RestClient provideRestClient() => RestClient();

  // Api Providers:-------------------------------------------------------------
  // Define all your api providers here
  /// A singleton post_api provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  IntroApi provideIntroApi(DioClient dioClient, RestClient restClient) =>
      IntroApi(dioClient, restClient);
// Api Providers End:---------------------------------------------------------

}
