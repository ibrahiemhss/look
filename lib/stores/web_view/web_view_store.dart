import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:look/data/network/constants/endpoints.dart';
import 'package:mobx/mobx.dart';
import 'package:look/data/repository.dart';
import 'package:look/stores/error/error_store.dart';

part 'web_view_store.g.dart';

class WebViewStore = _WebViewStore with _$WebViewStore;
enum WebViewConnectionState {
  none,
  waiting,
  active,
  done
}
abstract class _WebViewStore with Store {
  final String TAG = "_WebViewStore";
  List<ReactionDisposer> _disposers;

  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  var _webViewConnectionState = WebViewConnectionState.none;
  // constructor:---------------------------------------------------------------
  _WebViewStore(Repository repository) : this._repository = repository {
    init();
  }

  // store variables:-----------------------------------------------------------
  @observable
  String _url = Endpoints.webVieUrl;

  @observable
 bool _loadingUrl = false;

  @observable
  bool _addedNewUrl = false;
  @observable
  String _prevUrl = Endpoints.webVieUrl;
  @observable
  bool _loadingError = false;
  @observable
  bool _connectedInternet = true;
  @observable
  InAppWebViewController _webView;
  // store variables:-----------------------------------------------------------
  static ObservableFuture<String> emptyUrl =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<String> fetchUrlFuture =
  ObservableFuture<String>(emptyUrl);

  @computed
  String get url => _url;

  @computed
  bool get addedNewUrl => _addedNewUrl;
  @computed
  String get prevUrl => _prevUrl;
  @computed
  bool get loadingError => _loadingError;
  @computed
  WebViewConnectionState get getConnectionState => _webViewConnectionState;
  @computed
  bool get loadingUrl => _loadingUrl;
  @computed
  bool get connectedInternet => _connectedInternet;
  @computed
  bool get loading => fetchUrlFuture.status == FutureStatus.pending;
  @computed
  InAppWebViewController get webView => _webView;
  // actions:-------------------------------------------------------------------
  @action
  void initInAppWebViewController(InAppWebViewController webView) {
    _webView = webView;
  }

  @action
  Future setConnectionStatus(bool value) {
    _connectedInternet = value;
  }
  // actions:-------------------------------------------------------------------

  @action
  Future setAddedNewUrl(bool value) {
    _addedNewUrl = value;
  }
  @action
  Future setPrevUrl(String value) {
    _prevUrl = value;
  }
  @action
  Future changeUrl(String value) async {
    _url = value;
    _loadingUrl=true;
    await _repository?.saveUrl(value);
  }
  // actions:-------------------------------------------------------------------
  @action
  void chektInternetConnection() {
    DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          _connectedInternet = true;
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          _connectedInternet = false;

          break;
        default:
          _connectedInternet = false;
      }
    });

  }
  // actions:-------------------------------------------------------------------
  @action
  void setLoadingError(bool value) {
    print("internter status ======================== $value");
    _loadingError = value;
  }
  // actions:-------------------------------------------------------------------
  @action
  void setLoadingUrl(bool value) {
    print("LoadingUrl ======================== $value");
    _loadingUrl=value;
  }
  // actions:-------------------------------------------------------------------
  @action
  Future getSavedUrl() async {
    final future = _repository?.getUrl;
    _connectedInternet = true;
    fetchUrlFuture = ObservableFuture(future);
    future?.then((value) {
      if (value != null) {
        _loadingUrl=false;
        _url = value;
      }
    });
  }


  // general:-------------------------------------------------------------------
  void init() async {
    // getting current language from shared preference
    _repository?.getUrl?.then((url) {
      if (url != null) {
        _url = url;
        _loadingUrl=false;
      }
    });
  }

  // dispose:-------------------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
