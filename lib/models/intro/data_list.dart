import 'intro_data.dart';

class IntroDataList {
  final List<IntroData> introDataList;
  IntroDataList({
    this.introDataList,
  });

  factory IntroDataList.fromJson(Map<String, dynamic> json) {
    return new IntroDataList(
      introDataList: json['data'] == null ? null :
      (json['data'] as List)
          .map((c) => new IntroData.fromJson(c))
          .toList(),

    );
  }

}
