import 'dart:async';

import 'package:look/data/firebase/firebase_helper.dart';
import 'package:look/data/local/constants/db_constants.dart';
import 'package:look/data/local/datasources/post/post_datasource.dart';
import 'package:look/data/network/apis/intro/intro_api.dart';
import 'package:look/data/network/check_internet/check_internet.dart';
import 'package:look/data/repository.dart';
import 'package:look/data/sharedpref/shared_preference_helper.dart';
import 'package:look/utils/encryption/xxtea.dart';
import 'package:inject/inject.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'firbase_modules.dart';
import 'netwok_module.dart';

@module
class LocalModule extends NetworkModule {
  // DI variables:--------------------------------------------------------------
  Future<Database> database;

  // constructor
  // Note: Do not change the order in which providers are called, it might cause
  // some issues
  LocalModule() {
    database = provideDatabase();
  }

  // DI Providers:--------------------------------------------------------------
  /// A singleton database provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  @asynchronous
  Future<Database> provideDatabase() async {
    // Key for encryption
    var encryptionKey = "";

    // Get a platform-specific directory where persistent app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();

    // Path with the form: /platform-specific-directory/demo.db
    final dbPath = join(appDocumentDir.path, DBConstants.DB_NAME);

    // Check to see if encryption is set, then provide codec
    // else init normal db with path
    var database;
    if (encryptionKey.isNotEmpty) {
      // Initialize the encryption codec with a user password
      var codec = getXXTeaCodec(password: encryptionKey);
      database = await databaseFactoryIo.openDatabase(dbPath, codec: codec);
    } else {
      database = await databaseFactoryIo.openDatabase(dbPath);
    }

    // Return database instance
    return database;
  }

  // DataSources:---------------------------------------------------------------
  // Define all your data sources here
  /// A singleton post dataSource provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  PostDataSource providePostDataSource() => PostDataSource(database);

  // DataSources End:-----------------------------------------------------------

  /// A singleton repository provider.
  ///
  /// Calling it multiple times will return the same instance.
  @provide
  @singleton
  Repository provideRepository(
      IntroApi introApi,
    SharedPreferenceHelper preferenceHelper,
    PostDataSource postDataSource,
    CheckInternet checkInternet,
    FirebaseHelper firebaseHelper
  ) =>
      Repository(introApi, preferenceHelper, postDataSource,checkInternet,firebaseHelper);
}
