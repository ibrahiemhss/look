import 'dart:async';

import 'package:look/data/network/constants/endpoints.dart';
import 'package:look/data/network/dio_client.dart';
import 'package:look/data/network/rest_client.dart';
import 'package:look/models/intro/data_list.dart';
import 'package:look/models/intro/intro_data.dart';
import 'package:look/models/post/post_list.dart';

class IntroApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  IntroApi(this._dioClient, this._restClient);

  Future<IntroDataList> getIntroData() async {
    try {
      final res = await _dioClient.get(Endpoints.getIntroData);
      return IntroDataList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }


}
