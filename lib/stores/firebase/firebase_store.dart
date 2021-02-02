
import 'package:flutter/cupertino.dart';
import 'package:look/services/notifications_service.dart';
import 'package:mobx/mobx.dart';
import 'package:look/data/repository.dart';
import 'package:look/models/notifications/fcm_notification_model.dart';
import 'package:look/stores/error/error_store.dart';

part 'firebase_store.g.dart';

class FirebaseStore = _FirebaseStore with _$FirebaseStore;

abstract class _FirebaseStore with Store {
  // repository instance
  Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _FirebaseStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<FcmMessage> emptyMessageResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<FcmMessage> fetchMessageFuture =
  ObservableFuture<FcmMessage>(emptyMessageResponse);

  @observable
  FcmMessage _fcmMessage;


  @computed
  bool get loading => fetchMessageFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @computed
  FcmMessage get fcmMessage => _fcmMessage;

  @action
  Future getMessage(BuildContext context,NotificationsService notificationsService) async {
    final future = _repository.getFcmMessagingConfiguration(context,notificationsService);
    fetchMessageFuture = ObservableFuture(future);

    future.then((message) {
      this._fcmMessage = message;
    }).catchError((error) {
      //errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
