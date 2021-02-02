// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IntroStore on _IntroStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_IntroStore.loading'))
      .value;
  Computed<bool> _$firstEnterComputed;

  @override
  bool get firstEnter =>
      (_$firstEnterComputed ??= Computed<bool>(() => super.firstEnter,
              name: '_IntroStore.firstEnter'))
          .value;
  Computed<List<Slide>> _$slidesComputed;

  @override
  List<Slide> get slides => (_$slidesComputed ??=
          Computed<List<Slide>>(() => super.slides, name: '_IntroStore.slides'))
      .value;

  final _$fetchIntroDataFutureAtom =
      Atom(name: '_IntroStore.fetchIntroDataFuture');

  @override
  ObservableFuture<IntroDataList> get fetchIntroDataFuture {
    _$fetchIntroDataFutureAtom.reportRead();
    return super.fetchIntroDataFuture;
  }

  @override
  set fetchIntroDataFuture(ObservableFuture<IntroDataList> value) {
    _$fetchIntroDataFutureAtom.reportWrite(value, super.fetchIntroDataFuture,
        () {
      super.fetchIntroDataFuture = value;
    });
  }

  final _$introDataListAtom = Atom(name: '_IntroStore.introDataList');

  @override
  IntroDataList get introDataList {
    _$introDataListAtom.reportRead();
    return super.introDataList;
  }

  @override
  set introDataList(IntroDataList value) {
    _$introDataListAtom.reportWrite(value, super.introDataList, () {
      super.introDataList = value;
    });
  }

  final _$_slidesAtom = Atom(name: '_IntroStore._slides');

  @override
  List<Slide> get _slides {
    _$_slidesAtom.reportRead();
    return super._slides;
  }

  @override
  set _slides(List<Slide> value) {
    _$_slidesAtom.reportWrite(value, super._slides, () {
      super._slides = value;
    });
  }

  final _$successAtom = Atom(name: '_IntroStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$_firstEnterAtom = Atom(name: '_IntroStore._firstEnter');

  @override
  bool get _firstEnter {
    _$_firstEnterAtom.reportRead();
    return super._firstEnter;
  }

  @override
  set _firstEnter(bool value) {
    _$_firstEnterAtom.reportWrite(value, super._firstEnter, () {
      super._firstEnter = value;
    });
  }

  final _$getIntroDataAsyncAction = AsyncAction('_IntroStore.getIntroData');

  @override
  Future<dynamic> getIntroData() {
    return _$getIntroDataAsyncAction.run(() => super.getIntroData());
  }

  final _$getInterAsyncAction = AsyncAction('_IntroStore.getInter');

  @override
  Future<dynamic> getInter() {
    return _$getInterAsyncAction.run(() => super.getInter());
  }

  final _$_IntroStoreActionController = ActionController(name: '_IntroStore');

  @override
  void setFirstInter(bool value) {
    final _$actionInfo = _$_IntroStoreActionController.startAction(
        name: '_IntroStore.setFirstInter');
    try {
      return super.setFirstInter(value);
    } finally {
      _$_IntroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchIntroDataFuture: ${fetchIntroDataFuture},
introDataList: ${introDataList},
success: ${success},
loading: ${loading},
firstEnter: ${firstEnter},
slides: ${slides}
    ''';
  }
}
