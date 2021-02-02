import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:look/data/local/datasources/post/post_datasource.dart';
import 'package:look/data/network/apis/intro/intro_api.dart';
import 'package:look/data/sharedpref/shared_preference_helper.dart';
import 'package:look/models/intro/data_list.dart';
import 'package:look/models/intro/intro_data.dart';
import 'package:look/models/notifications/fcm_notification_model.dart';
import 'package:look/models/post/post.dart';
import 'package:look/models/post/post_list.dart';
import 'package:look/services/notifications_service.dart';
import 'package:sembast/sembast.dart';

import 'firebase/firebase_helper.dart';
import 'local/constants/db_constants.dart';
import 'network/check_internet/check_internet.dart';

class Repository {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final IntroApi _introApi;
  final CheckInternet _checkInternet;
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // shared pref object
  final FirebaseHelper _firebaseHelper;

  // constructor
  Repository(this._introApi, this._sharedPrefsHelper, this._postDataSource, this._checkInternet,this._firebaseHelper);

  // Post: ---------------------------------------------------------------------
  Future<bool> isInternetConnected() async{
    return await _checkInternet.isConnected();
  }

  // Url:------------------------------------------------------
  Future<FcmMessage> getFcmMessagingConfiguration(BuildContext context,NotificationsService notificationsService) async {
    return await _firebaseHelper.config(context,notificationsService).catchError((error) => throw error);
  }

  // Intro data: ---------------------------------------------------------------------
  Future<IntroDataList> getIntroData() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return  await _introApi.getIntroData().catchError((error) => throw error);
  }


  Future<List<Post>> findPostById(int id) {
    //creating filter
    List<Filter> filters = List();

    //check to see if dataLogsType is not null
    if (id != null) {
      Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
      filters.add(dataLogTypeFilter);
    }

    //making db call
    return _postDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  Future<int> insert(Post post) => _postDataSource
      .insert(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  // Language: -----------------------------------------------------------------
  Future<void> setFirstInter(bool value) =>
      _sharedPrefsHelper.setFirstInter(value);
  Future<bool> get isFirstInter => _sharedPrefsHelper.isFirstInter;

  // page title: -----------------------------------------------------------------
  Future<void> getFirstInter(String value) =>
      _sharedPrefsHelper.changePageTitle(value);

  Future<String> get currentPageTitle => _sharedPrefsHelper.currentPageTitle;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  Future<bool> get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  Future<String> get currentLanguage => _sharedPrefsHelper.currentLanguage;

// Url:------------------------------------------------------
  Future<void> saveUrl(String value) {
    _sharedPrefsHelper.changeUrl(value);
  }

  Future<String> get getUrl => _sharedPrefsHelper.currentUrl;

}
