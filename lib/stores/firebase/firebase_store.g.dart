// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseStore on _FirebaseStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_FirebaseStore.loading'))
      .value;
  Computed<FcmMessage> _$fcmMessageComputed;

  @override
  FcmMessage get fcmMessage =>
      (_$fcmMessageComputed ??= Computed<FcmMessage>(() => super.fcmMessage,
              name: '_FirebaseStore.fcmMessage'))
          .value;

  final _$fetchMessageFutureAtom =
      Atom(name: '_FirebaseStore.fetchMessageFuture');

  @override
  ObservableFuture<FcmMessage> get fetchMessageFuture {
    _$fetchMessageFutureAtom.reportRead();
    return super.fetchMessageFuture;
  }

  @override
  set fetchMessageFuture(ObservableFuture<FcmMessage> value) {
    _$fetchMessageFutureAtom.reportWrite(value, super.fetchMessageFuture, () {
      super.fetchMessageFuture = value;
    });
  }

  final _$_fcmMessageAtom = Atom(name: '_FirebaseStore._fcmMessage');

  @override
  FcmMessage get _fcmMessage {
    _$_fcmMessageAtom.reportRead();
    return super._fcmMessage;
  }

  @override
  set _fcmMessage(FcmMessage value) {
    _$_fcmMessageAtom.reportWrite(value, super._fcmMessage, () {
      super._fcmMessage = value;
    });
  }

  final _$getMessageAsyncAction = AsyncAction('_FirebaseStore.getMessage');

  @override
  Future<dynamic> getMessage(
      BuildContext context, NotificationsService notificationsService) {
    return _$getMessageAsyncAction
        .run(() => super.getMessage(context, notificationsService));
  }

  @override
  String toString() {
    return '''
fetchMessageFuture: ${fetchMessageFuture},
loading: ${loading},
fcmMessage: ${fcmMessage}
    ''';
  }
}
