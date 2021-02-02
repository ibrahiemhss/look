import 'package:look/data/repository.dart';
import 'package:look/di/modules/firbase_modules.dart';
import 'package:look/di/modules/local_module.dart';
import 'package:look/di/modules/netwok_module.dart';
import 'package:look/di/modules/preference_module.dart';
import 'package:inject/inject.dart';

import 'package:look/main.dart';
import 'app_component.inject.dart' as g;

/// The top level injector that stitches together multiple app features into
/// a complete app.
@Injector(const [NetworkModule, LocalModule, PreferenceModule,FirebaseModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create(
      NetworkModule networkModule,
      LocalModule localModule,
      PreferenceModule preferenceModule,
      FirebaseModule firebaseModule
      ) async {
    return await g.AppComponent$Injector.create(
      networkModule,
      localModule,
      preferenceModule,
      firebaseModule
    );
  }

  /// An accessor to RestClient object that an application may use.
  @provide
  Repository getRepository();
}
