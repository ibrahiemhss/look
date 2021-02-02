class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://look.ps";
  static const String fcmUrl= "https://fcm.googleapis.com/fcm/send";
  static const String webVieUrl= "https://look.ps/mobile_app/index";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // booking endpoints
  static const String getIntroData = baseUrl + "/public/mobile_app/onbording_text";

}
