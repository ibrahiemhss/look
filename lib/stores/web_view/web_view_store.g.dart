// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WebViewStore on _WebViewStore, Store {
  Computed<String> _$urlComputed;

  @override
  String get url => (_$urlComputed ??=
          Computed<String>(() => super.url, name: '_WebViewStore.url'))
      .value;
  Computed<bool> _$addedNewUrlComputed;

  @override
  bool get addedNewUrl =>
      (_$addedNewUrlComputed ??= Computed<bool>(() => super.addedNewUrl,
              name: '_WebViewStore.addedNewUrl'))
          .value;
  Computed<String> _$prevUrlComputed;

  @override
  String get prevUrl => (_$prevUrlComputed ??=
          Computed<String>(() => super.prevUrl, name: '_WebViewStore.prevUrl'))
      .value;
  Computed<bool> _$loadingErrorComputed;

  @override
  bool get loadingError =>
      (_$loadingErrorComputed ??= Computed<bool>(() => super.loadingError,
              name: '_WebViewStore.loadingError'))
          .value;
  Computed<WebViewConnectionState> _$getConnectionStateComputed;

  @override
  WebViewConnectionState get getConnectionState =>
      (_$getConnectionStateComputed ??= Computed<WebViewConnectionState>(
              () => super.getConnectionState,
              name: '_WebViewStore.getConnectionState'))
          .value;
  Computed<bool> _$loadingUrlComputed;

  @override
  bool get loadingUrl =>
      (_$loadingUrlComputed ??= Computed<bool>(() => super.loadingUrl,
              name: '_WebViewStore.loadingUrl'))
          .value;
  Computed<bool> _$connectedInternetComputed;

  @override
  bool get connectedInternet => (_$connectedInternetComputed ??= Computed<bool>(
          () => super.connectedInternet,
          name: '_WebViewStore.connectedInternet'))
      .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_WebViewStore.loading'))
      .value;
  Computed<InAppWebViewController> _$webViewComputed;

  @override
  InAppWebViewController get webView => (_$webViewComputed ??=
          Computed<InAppWebViewController>(() => super.webView,
              name: '_WebViewStore.webView'))
      .value;

  final _$_urlAtom = Atom(name: '_WebViewStore._url');

  @override
  String get _url {
    _$_urlAtom.reportRead();
    return super._url;
  }

  @override
  set _url(String value) {
    _$_urlAtom.reportWrite(value, super._url, () {
      super._url = value;
    });
  }

  final _$_loadingUrlAtom = Atom(name: '_WebViewStore._loadingUrl');

  @override
  bool get _loadingUrl {
    _$_loadingUrlAtom.reportRead();
    return super._loadingUrl;
  }

  @override
  set _loadingUrl(bool value) {
    _$_loadingUrlAtom.reportWrite(value, super._loadingUrl, () {
      super._loadingUrl = value;
    });
  }

  final _$_addedNewUrlAtom = Atom(name: '_WebViewStore._addedNewUrl');

  @override
  bool get _addedNewUrl {
    _$_addedNewUrlAtom.reportRead();
    return super._addedNewUrl;
  }

  @override
  set _addedNewUrl(bool value) {
    _$_addedNewUrlAtom.reportWrite(value, super._addedNewUrl, () {
      super._addedNewUrl = value;
    });
  }

  final _$_prevUrlAtom = Atom(name: '_WebViewStore._prevUrl');

  @override
  String get _prevUrl {
    _$_prevUrlAtom.reportRead();
    return super._prevUrl;
  }

  @override
  set _prevUrl(String value) {
    _$_prevUrlAtom.reportWrite(value, super._prevUrl, () {
      super._prevUrl = value;
    });
  }

  final _$_loadingErrorAtom = Atom(name: '_WebViewStore._loadingError');

  @override
  bool get _loadingError {
    _$_loadingErrorAtom.reportRead();
    return super._loadingError;
  }

  @override
  set _loadingError(bool value) {
    _$_loadingErrorAtom.reportWrite(value, super._loadingError, () {
      super._loadingError = value;
    });
  }

  final _$_connectedInternetAtom =
      Atom(name: '_WebViewStore._connectedInternet');

  @override
  bool get _connectedInternet {
    _$_connectedInternetAtom.reportRead();
    return super._connectedInternet;
  }

  @override
  set _connectedInternet(bool value) {
    _$_connectedInternetAtom.reportWrite(value, super._connectedInternet, () {
      super._connectedInternet = value;
    });
  }

  final _$_webViewAtom = Atom(name: '_WebViewStore._webView');

  @override
  InAppWebViewController get _webView {
    _$_webViewAtom.reportRead();
    return super._webView;
  }

  @override
  set _webView(InAppWebViewController value) {
    _$_webViewAtom.reportWrite(value, super._webView, () {
      super._webView = value;
    });
  }

  final _$fetchUrlFutureAtom = Atom(name: '_WebViewStore.fetchUrlFuture');

  @override
  ObservableFuture<String> get fetchUrlFuture {
    _$fetchUrlFutureAtom.reportRead();
    return super.fetchUrlFuture;
  }

  @override
  set fetchUrlFuture(ObservableFuture<String> value) {
    _$fetchUrlFutureAtom.reportWrite(value, super.fetchUrlFuture, () {
      super.fetchUrlFuture = value;
    });
  }

  final _$changeUrlAsyncAction = AsyncAction('_WebViewStore.changeUrl');

  @override
  Future<dynamic> changeUrl(String value) {
    return _$changeUrlAsyncAction.run(() => super.changeUrl(value));
  }

  final _$getSavedUrlAsyncAction = AsyncAction('_WebViewStore.getSavedUrl');

  @override
  Future<dynamic> getSavedUrl() {
    return _$getSavedUrlAsyncAction.run(() => super.getSavedUrl());
  }

  final _$_WebViewStoreActionController =
      ActionController(name: '_WebViewStore');

  @override
  void initInAppWebViewController(InAppWebViewController webView) {
    final _$actionInfo = _$_WebViewStoreActionController.startAction(
        name: '_WebViewStore.initInAppWebViewController');
    try {
      return super.initInAppWebViewController(webView);
    } finally {
      _$_WebViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setConnectionStatus(bool value) {
    final _$actionInfo = _$_WebViewStoreActionController.startAction(
        name: '_WebViewStore.setConnectionStatus');
    try {
      return super.setConnectionStatus(value);
    } finally {
      _$_WebViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setAddedNewUrl(bool value) {
    final _$actionInfo = _$_WebViewStoreActionController.startAction(
        name: '_WebViewStore.setAddedNewUrl');
    try {
      return super.setAddedNewUrl(value);
    } finally {
      _$_WebViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setPrevUrl(String value) {
    final _$actionInfo = _$_WebViewStoreActionController.startAction(
        name: '_WebViewStore.setPrevUrl');
    try {
      return super.setPrevUrl(value);
    } finally {
      _$_WebViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chektInternetConnection() {
    final _$actionInfo = _$_WebViewStoreActionController.startAction(
        name: '_WebViewStore.chektInternetConnection');
    try {
      return super.chektInternetConnection();
    } finally {
      _$_WebViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingError(bool value) {
    final _$actionInfo = _$_WebViewStoreActionController.startAction(
        name: '_WebViewStore.setLoadingError');
    try {
      return super.setLoadingError(value);
    } finally {
      _$_WebViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingUrl(bool value) {
    final _$actionInfo = _$_WebViewStoreActionController.startAction(
        name: '_WebViewStore.setLoadingUrl');
    try {
      return super.setLoadingUrl(value);
    } finally {
      _$_WebViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchUrlFuture: ${fetchUrlFuture},
url: ${url},
addedNewUrl: ${addedNewUrl},
prevUrl: ${prevUrl},
loadingError: ${loadingError},
getConnectionState: ${getConnectionState},
loadingUrl: ${loadingUrl},
connectedInternet: ${connectedInternet},
loading: ${loading},
webView: ${webView}
    ''';
  }
}
