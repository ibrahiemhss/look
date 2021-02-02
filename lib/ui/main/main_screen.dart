import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//import 'package:floading/floading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:look/constants/app_theme.dart';
import 'package:look/constants/assets.dart';
import 'package:look/constants/colors/colors.dart';
import 'package:look/data/network/constants/endpoints.dart';
import 'package:look/models/notifications/fcm_notification_model.dart';
import 'package:look/services/notifications_service.dart';
import 'package:look/stores/language/language_store.dart';
import 'package:look/stores/web_view/web_view_store.dart';
import 'package:look/utils/locale/app_localization.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';

class MainPagesScreen extends StatefulWidget {
  @override
  _MainPagesScreenState createState() => _MainPagesScreenState();
}

class _MainPagesScreenState extends State<MainPagesScreen>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String url = "";
  double progress = 0;

  //stores:---------------------------------------------------------------------
  //ThemeStore _themeStore;
  LanguageStore _languageStore;
  WebViewStore _webViewStore;
  NotificationsService _notificationsService;

  double _percentage = 0.0;
  bool _isConnectedInternet = false;
  bool _isErrorrLoaded = false;
  double _scrollPosition;
  Widget webView;

  @override
  void initState() {
    super.initState();

    webView = InAppWebView(
        initialUrl: Endpoints.webVieUrl,
        initialHeaders: {},
        initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
                mixedContentMode:
                    AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW),
            crossPlatform: InAppWebViewOptions(
              debuggingEnabled: true,
            )),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewStore.initInAppWebViewController(controller);
          /* if(!_webViewStore.loadingError) FLoading.show(
            context,
            loading: Image.asset(
                "assets/gif/loading.gif",
                width: 100,
                height: 100,
            ),
            color: Colors.grey[300],
          );*/
        },
        onLoadStart: (InAppWebViewController controller, String url) {
          _webViewStore.initInAppWebViewController(controller);
          _webViewStore.changeUrl(url);
        },
        onLoadStop: (InAppWebViewController controller, String url) async {
          _webViewStore.initInAppWebViewController(controller);
          _webViewStore.changeUrl(url);
          //FLoading.hide();
          _webViewStore.setLoadingUrl(false);
        },
        onScrollChanged: (InAppWebViewController controller, int x, int y) {
          _webViewStore.initInAppWebViewController(controller);
          if (y <= 0) {
            /*  FLoading.show(
              context,
              loading: Image.asset(
                "assets/gif/loading.gif",
                width: 100,
                height: 100,
              ),
              color: Colors.grey[300],
            );*/
            _webViewStore.webView.reload();
            print(
                '====================================== onScrollChanged x: ${x} -- y: ${y}');
          }
        },
        onLoadError: (InAppWebViewController controller, String url, int code,
            String message) {
          _webViewStore.initInAppWebViewController(controller);

          if (code == -2) {
            _webViewStore.setConnectionStatus(false);
          } else {
            _webViewStore.setLoadingError(true);
          }
          //FLoading.hide();
          _webViewStore.setLoadingUrl(false);

          print(
              '====================================== Page Error message: ${message}');

          print(
              '====================================== Page Error Code: ${code}');
        },
        onProgressChanged: (InAppWebViewController controller, int progress) {
          setState(() {
            this.progress = progress / 100;
          });
          print(
              '====================================== progress : ${progress}');
        });
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) {
      print("==========================TOKEN=====================\n $token");
      // _sharedPreferenceHelper.saveFcmToken(token);
      // }
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("================onMessage===========:\n ${message}");
        //   HandleMessages.getInstance().onReceive(FcmMessageModel.fromJson(message), context, FCMpayload.onLaunch,key);
        try {
          // notificationsService.notify(title:FcmMessage.fromJson(message,firebaseConstants.onMessage).title,body:FcmMessage.fromJson(message,firebaseConstants.onMessage).body );
          _notificationsService.showItemDialog(_webViewStore.webView,
              _webViewStore, context, FcmMessage.fromJson(message));
        } catch (e) {
          print(
              "================NotificationsService onMessage exception===========:\n ${e.toString()}");
        }
        return FcmMessage.fromJson(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("================onLaunch===========:\n ${message}");
        // HandleMessages.getInstance().onReceive(FcmMessageModel.fromJson(message), context, FCMpayload.onLaunch,key);
        _notificationsService.navigateToItemDetail(_webViewStore.webView,
            _webViewStore, context, FcmMessage.fromJson(message));
      },
      onResume: (Map<String, dynamic> message) async {
        // notificationModel= FcmMessageModel.fromJson(message);
        print("================onResume===========:\n ${message}");
        //  HandleMessages.getInstance().onReceive(FcmMessageModel.fromJson(message), context, FCMpayload.onResume,key);
        _notificationsService.navigateToItemDetail(_webViewStore.webView,
            _webViewStore, context, FcmMessage.fromJson(message));
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //check internet connection
    _checkeConnected();
    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _webViewStore = Provider.of<WebViewStore>(context);
    _notificationsService = Provider.of<NotificationsService>(context);
    ;
    if (_webViewStore.loading) {
      _webViewStore.getSavedUrl();
      print(
          "init ====================================== SavedUrl = ${_webViewStore.url}");
      print(
          "init ====================================== Internet status = ${_webViewStore.connectedInternet}");
    }
  }

  @override
  Widget build(BuildContextcontext) {
    return _buildMainContent();
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return Stack(
          children: <Widget>[
            !_webViewStore.connectedInternet
                ? _noInternetWidget()
                : _inAppWebView(),
            // Loading
          ],
        );
      },
    );
  }

  Widget _inAppWebView() {
    return WillPopScope(
      onWillPop: () async {
        if (_webViewStore.webView != null) {
          if (_webViewStore.addedNewUrl) {
            //context.showLoaderOverlay();
            _webViewStore.webView.loadUrl(url: _webViewStore.prevUrl);
            _webViewStore.changeUrl(_webViewStore.prevUrl);
            _webViewStore.setAddedNewUrl(false);
            _webViewStore.webView.clearCache();
            return false;
          } else if (await _webViewStore.webView.canGoBack()) {
            // get the webview history
            WebHistory webHistory =
                await _webViewStore.webView.getCopyBackForwardList();
            // if webHistory.currentIndex corresponds to 1 or 0
            if (webHistory.currentIndex <= 1) {
              // then it means that we are on the first page
              // so we can exit
             // return true;
            }
            // context.showLoaderOverlay();
            _webViewStore.webView.goBack();
            return false;
          }else{
            return true;
          }
        }
      },
      child: SafeArea(
          child: _webViewStore.loadingError ? _errorLoadingWidget() : webView),
    );
  }

/*  Widget webViewContents(BuildContext context) {
    return
             Scaffold(
        */ /* appBar: BasAppBar(
        appBar: AppBar(),
        scaffoldKey: _scaffoldKey,
        themeStore: _themeStore,
        actions: <Widget>[
          NavigationControls(_completerWebViewController.future),
          SampleMenu(_completerWebViewController.future),
          _buildLanguageButton(context),
          _buildThemeButton(),
        ],
        onPress: () {
          //_navigationStore.setShowNavigationRail(!_navigationStore.showNavigationRail);
          //print("ShowNavigationRail =${_navigationStore.showNavigationRail}");
        },
      ),*/ /*
        body: _webViewStore.loadingError ? _errorLoadingWidget(_completerWebViewController.future):
        WebView(
              initialUrl: _webViewStore.url,
              javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _completerWebViewController.complete(webViewController);
            setState(() {
              _webViewController=webViewController;

            });
          },
              // TODO(iskakaushik): Remove this when collection literals makes it to stable.
              // ignore: prefer_collection_literals
              javascriptChannels: <JavascriptChannel>[
                _toasterJavascriptChannel(context),
              ].toSet(),
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith(_webViewStore.url)) {
                  FLoading.show(context, duration: 2000);
                  _webViewStore.setLoadingError(false);

                 // _webViewStore.setLoadingUrl(true);
                  print('====================================== blocking navigation to $request}');
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                _webViewStore.setLoadingUrl(false);
                print('====================================== Page started loading: $url');
              },
              onPageFinished: (String url) {
                FLoading.hide();
                _webViewStore.changeUrl(url);
                print('====================================== Page finished loading: $url');
              },
              gestureNavigationEnabled: true,
              onWebResourceError: (e){
               // _webViewStore.setLoadingError(true);
                print('====================================== Page Error loading: ${e.description}');
                FLoading.hide();
                if(e.errorCode==-2){
                  setState(() {
                    _isConnectedInternet=false;
                  });
                 // _webViewStore.setConnectionStatus(false);
                }else{
                  setState(() {
                    _isConnectedInternet=true;
                  });
                  _webViewStore.setLoadingError(true);
                }
                print(
                    '====================================== Page Error description: ${e.description}');

                print(
                    '====================================== Page Error errorCode: ${e.errorCode}');
                print(
                    '====================================== Page Error errorType: ${e.errorType}');

              },
            ),);
  }*/

  Widget _buildLanguageButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        _buildLanguageDialog(context);
      },
      icon: Icon(
        MaterialIcons.language,
      ),
    );
  }

  Widget _noInternetWidget() {
    return Container(
        color: Color(0xFF21B6C9),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 96,
                      width: 96,
                      child: Image.asset(Assets.logo),
                    )),
              ),
            ),
            Container(
                width: 200,
                height: 200,
                child: Image.asset(Assets.no_internet)),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text("يرجي التحقق من الاتصال بالانترنت",
                  style: themeData.textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 84.0, right: 84.0, top: 32),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white10)),
                  color: Colors.white10,
                  onPressed: () async {
                    await _checkeConnected();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("اعادة تحميل",
                            style: themeData.textTheme.subtitle2),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }

  Widget _errorLoadingWidget() {
    return Container(
      color: Color(0xFF21B6C9),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 96,
                    width: 96,
                    child: Image.asset(Assets.logo),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text("خطأ في تحميل الصفحه",
                style: themeData.textTheme.headline6),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 84.0, right: 84.0, top: 32),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white10)),
                color: Colors.white10,
                onPressed: () {
                  if (_webViewStore.webView != null) {
                    _webViewStore.webView.reload();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("اعادة تحميل",
                          style: themeData.textTheme.subtitle2),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  _buildLanguageDialog(BuildContext context) {
    _showDialog<String>(
      context: context,
      child: MaterialDialog(
        borderRadius: 5.0,
        title: Text(
          AppLocalizations.of(context).translate('homeTvChooseLanguage'),
          style: TextStyle(
              color: AppColors.green[500],
              fontSize: themeData.textTheme.subtitle2.fontSize),
        ),
        headerColor: AppColors.green[50],
        backgroundColor: Colors.white,
        closeButtonColor: themeData.iconTheme.color,
        enableCloseButton: true,
        enableBackButton: false,
        onCloseButtonClicked: () {
          Navigator.of(context).pop();
        },
        children: _languageStore.supportedLanguages
            .map(
              (object) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0.0),
                title: Center(
                  child: Text(
                    object.language,
                    style: TextStyle(
                      color: _languageStore.locale == object.locale
                          ? AppColors.green[500]
                          : Colors.grey[700],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // change user language based on selected locale
                  _languageStore.changeLanguage(object.locale);
                },
              ),
            )
            .toList(),
      ),
    );
  }

  _showDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
    });
  }

  Future<bool> _checkeConnected() async {
    DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          _webViewStore.setConnectionStatus(true);
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          _webViewStore.setConnectionStatus(false);
          break;
        default:
          _webViewStore.setConnectionStatus(false);
      }
    });
  }
}
