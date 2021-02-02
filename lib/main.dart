import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:inject/inject.dart';
import 'package:look/constants/app_theme.dart';
import 'package:look/constants/strings.dart';
import 'package:look/di/components/app_component.dart';
import 'package:look/di/modules/local_module.dart';
import 'package:look/di/modules/netwok_module.dart';
import 'package:look/di/modules/preference_module.dart';
import 'package:look/routes.dart';
import 'package:look/services/notifications_service.dart';
import 'package:look/stores/intro/intro_store.dart';
import 'package:look/stores/language/language_store.dart';
import 'package:look/stores/navigation/navigation_store.dart';
import 'package:look/stores/theme/theme_store.dart';
import 'package:look/stores/web_view/web_view_store.dart';
import 'package:look/ui/route/route_screen.dart';
import 'package:look/utils/locale/app_localization.dart';
import 'package:provider/provider.dart';

import 'di/modules/firbase_modules.dart';
import 'stores/firebase/firebase_store.dart';

// global instance for app component
AppComponent appComponent;
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    appComponent = await AppComponent.create(
        NetworkModule(), LocalModule(), PreferenceModule(), FirebaseModule());
    runApp(appComponent.app);
  });
}

@provide
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.

  final IntroStore _introStore = IntroStore(appComponent.getRepository());
  final FirebaseStore _firebaseStore =
      FirebaseStore(appComponent.getRepository());
  final ThemeStore _themeStore = ThemeStore(appComponent.getRepository());
  final NavigationStore _navigationStore =
      NavigationStore(appComponent.getRepository());
  final LanguageStore _languageStore =
      LanguageStore(appComponent.getRepository());
  final WebViewStore _webViewStore = WebViewStore(appComponent.getRepository());
  final NotificationsService _notificationsService = NotificationsService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IntroStore>(create: (_) => _introStore),
        Provider<FirebaseStore>(create: (_) => _firebaseStore),
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<NavigationStore>(create: (_) => _navigationStore),
        Provider<WebViewStore>(create: (_) => _webViewStore),
        Provider<NotificationsService>(create: (_) => _notificationsService),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: /* _themeStore.darkMode ? themeDataDark : */ themeData,
            locale: Locale(_languageStore.locale),
            supportedLocales: _languageStore.supportedLanguages
                .map((language) => Locale(language.locale, language.code))
                .toList(),
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              AppLocalizations.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            home: RouteAwareWidget(
              Routes.routeScreen,
              child: ChangeRouteScreen(),
            ),
            routes: Routes.routes(),
          );
        },
      ),
    );
  }
}
