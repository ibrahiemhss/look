import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:look/services/notifications_service.dart';
import 'package:look/data/sharedpref/shared_preference_helper.dart';
import 'package:look/models/notifications/fcm_notification_model.dart';

class FirebaseHelper {
// FirebaseMessaging instance
  final FirebaseMessaging _firebaseMessaging;
  final SharedPreferenceHelper _sharedPreferenceHelper;

  // injecting dio instance
  FirebaseHelper(this._firebaseMessaging,this._sharedPreferenceHelper);

  Future<FcmMessage> config(BuildContext context,NotificationsService notificationsService) {
    /*_firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) {
      print("==========================TOKEN=====================\n $token");
      _sharedPreferenceHelper.saveFcmToken(token);
      // }
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("================onMessage===========:\n ${message}");
        //   HandleMessages.getInstance().onReceive(FcmMessageModel.fromJson(message), context, FCMpayload.onLaunch,key);
        try{
         // notificationsService.notify(title:FcmMessage.fromJson(message,firebaseConstants.onMessage).title,body:FcmMessage.fromJson(message,firebaseConstants.onMessage).body );
          notificationsService.showItemDialog(context,FcmMessage.fromJson(message,firebaseConstants.onMessage));
        }catch(e){
          print("================NotificationsService onMessage exception===========:\n ${e.toString()}");

        }
        return FcmMessage.fromJson(message,firebaseConstants.onMessage);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("================onLaunch===========:\n ${message}");
        // HandleMessages.getInstance().onReceive(FcmMessageModel.fromJson(message), context, FCMpayload.onLaunch,key);
        notificationsService.navigateToItemDetail(context,FcmMessage.fromJson(message,firebaseConstants.onMessage));

      },
      onResume: (Map<String, dynamic> message) async {
        // notificationModel= FcmMessageModel.fromJson(message);
        print("================onResume===========:\n ${message}");
        //  HandleMessages.getInstance().onReceive(FcmMessageModel.fromJson(message), context, FCMpayload.onResume,key);
        notificationsService.navigateToItemDetail(context,FcmMessage.fromJson(message,firebaseConstants.onMessage));

      },
    );*/
    //  throw("Exception thrown while unbinding");
  }

  Future myBackgroundMessageHandler(Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }

}
