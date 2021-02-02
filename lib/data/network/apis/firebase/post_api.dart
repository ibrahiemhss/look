import 'dart:async';
import 'dart:convert';

import 'package:look/data/network/constants/endpoints.dart';
import 'package:look/data/network/dio_client.dart';
import 'package:look/data/network/rest_client.dart';
import 'package:look/models/notifications/fcm_notification_model.dart';
import 'package:look/data/firebase/constants/firebase_constants.dart';

class FirebaseApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  FirebaseApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<FcmMessage> sendMessage(Map<String, dynamic> message) async {
    try {
      //, {Map headers, body, encoding}
      final res = await _restClient.post(Endpoints.fcmUrl,
        headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=${firebaseConstants.serverToken}',
      },
        body: jsonEncode(message),
      );

     // final Completer<Map<String, dynamic>> completer =
     // Completer<Map<String, dynamic>>();
     // return FcmMessage.fromJson(await completer.future,firebaseConstants.onSend);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }

}
