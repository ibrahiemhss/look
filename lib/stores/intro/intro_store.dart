

import 'package:flutter/material.dart';
import 'package:look/constants/assets.dart';
import 'package:look/data/repository.dart';
import 'package:look/models/intro/data_list.dart';
import 'package:look/stores/error/error_store.dart';
import 'package:look/utils/dio/dio_error_util.dart';
import 'package:look/widgets/intro_slider.dart';
import 'package:mobx/mobx.dart';

part 'intro_store.g.dart';

class IntroStore = _IntroStore with _$IntroStore;

abstract class _IntroStore with Store {
  // repository instance
  Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _IntroStore(Repository repository)
      : this._repository = repository {
    init();
  }
  // store variables:-----------------------------------------------------------
  static ObservableFuture<IntroDataList> emptyIntroDataResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<IntroDataList> fetchIntroDataFuture =
      ObservableFuture<IntroDataList>(emptyIntroDataResponse);

  @observable
  IntroDataList introDataList;

  @observable
  List<Slide> _slides = new List();

  @observable
  bool success = false;

  @observable
  bool _firstEnter = true;

  @computed
  bool get loading => fetchIntroDataFuture.status == FutureStatus.pending;

  @computed
  bool get firstEnter => _firstEnter;

  @computed
  List<Slide> get  slides =>  _slides;

  // actions:-------------------------------------------------------------------
  @action
  void setFirstInter(bool value) {
    _firstEnter = value;
    _repository.setFirstInter(value).then((_) {
      // write additional logic here
    });
  }

  @action
  Future getIntroData() async {
    final future = _repository.getIntroData();
    fetchIntroDataFuture = ObservableFuture(future);
    future.then((data) {
      print("screen1 === ${data.introDataList[0].screen1}");
      print("screen2 === ${data.introDataList[0].screen2}");

      _slides.add(
        new Slide(
          backgroundColor: Color(0xFF21B6C9),
          //title: "عنوان الشاشه الاولي",

          //subTitle:"عنوان صغير الشاشه الاولي",
          description: data.introDataList[0].screen1 ??
              "",
          //pathImage: "images/photo_school.png",
          centerWidget: Image.asset(Assets.splash_1),
          colorBegin: Color(0xffFFFFFF),
          colorEnd: Color(0xffE8EAF6),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
          //onImagePress: () {},
        ),
      );
      _slides.add(
          new Slide(
            backgroundColor: Color(0xFF21B6C9),
            //title: "عنوان الشاشه الثانيه",
            description: data.introDataList[0].screen2 ??
                "",
            //pathImage: "images/photo_museum.png",
            colorBegin: Color(0xffFFFFFF),
            colorEnd: Color(0xffE8EAF6),
            centerWidget: Image.asset(Assets.splash_2),
          )
      );
      this.introDataList = data;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future getInter() async{
    _repository?.isFirstInter?.then((val) {
      if (val != null) {
        _firstEnter=val;
      }
    });
  }

  // general:-------------------------------------------------------------------
  void init() async {
    // getting current language from shared preference
    _repository?.isFirstInter?.then((val) {
      if (val != null) {
        _firstEnter = val;
      }
    });
  }
}
