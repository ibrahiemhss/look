import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look/models/notifications/fcm_notification_model.dart';
import 'package:look/services/notifications_service.dart';
import 'package:look/stores/firebase/firebase_store.dart';
import 'package:look/ui/intro/intro_slider_screen.dart';
import 'package:provider/provider.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class RouteAwareWidget extends StatefulWidget {
  final String name;
  final Widget child;

  RouteAwareWidget(this.name, {@required this.child});

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  // Called when the current route has been pushed.
  void didPush() {
    // print('didPush ${widget.name}');
  }

  @override
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    print('didPopNext ${widget.name}');
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

///  [PreviousRouteObserver] to Observing the action of changes in launching
///  screens in case of push notifications

class PreviousRouteObserver extends NavigatorObserver {
  Route _previousRoute;

  Route get previousRoute => _previousRoute;

  String get previousRouteName => _previousRoute.settings.name;

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    _previousRoute = previousRoute;
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    _previousRoute = oldRoute;
  }
}

class ChangeRouteScreen extends StatefulWidget {
  @override
  createState() => _ChangeRouteScreenState();
}

class _ChangeRouteScreenState extends State<ChangeRouteScreen>
    with WidgetsBindingObserver {
  FirebaseStore _firebaseStore;
  NotificationsService _notificationsService;

  FcmMessage _fcmMessage;

  @override
  void didChangeDependencies() {
    _firebaseStore = Provider.of<FirebaseStore>(context);
    _notificationsService = Provider.of<NotificationsService>(context);
    if (!_firebaseStore.loading != null) {
      _firebaseStore.getMessage(context, _notificationsService);
      print(
          "================onMessage====ChangeRouteScreen=======:\n ${_firebaseStore.fcmMessage ?? ""}");
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return IntroScreen();
  }
}
