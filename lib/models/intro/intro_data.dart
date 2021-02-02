class IntroData {
  String splash;
  String screen1;
  String screen2;

  IntroData({
    this.splash,
    this.screen1,
    this.screen2,
  });

  factory IntroData.fromMap(Map<String, dynamic> json) => IntroData(
    splash: json["splash"],
    screen1: json["screen1"],
    screen2: json["screen2"],
  );
  factory IntroData.fromJson(Map<String, dynamic> json) => IntroData(
    splash: json["splash"],
    screen1: json["screen1"],
    screen2: json["screen2"],
  );
  Map<String, dynamic> toMap() => {
    "splash": splash,
    "screen1": screen1,
    "screen2": screen2,
  };

}
