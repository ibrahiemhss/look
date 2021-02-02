// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationStore on _NavigationStore, Store {
  Computed<int> _$pageIndexComputed;

  @override
  int get pageIndex =>
      (_$pageIndexComputed ??= Computed<int>(() => super.pageIndex,
              name: '_NavigationStore.pageIndex'))
          .value;
  Computed<String> _$pageAppBarTitleComputed;

  @override
  String get pageAppBarTitle => (_$pageAppBarTitleComputed ??= Computed<String>(
          () => super.pageAppBarTitle,
          name: '_NavigationStore.pageAppBarTitle'))
      .value;
  Computed<bool> _$showNavigationRailComputed;

  @override
  bool get showNavigationRail => (_$showNavigationRailComputed ??=
          Computed<bool>(() => super.showNavigationRail,
              name: '_NavigationStore.showNavigationRail'))
      .value;

  final _$_pageIndexAtom = Atom(name: '_NavigationStore._pageIndex');

  @override
  int get _pageIndex {
    _$_pageIndexAtom.reportRead();
    return super._pageIndex;
  }

  @override
  set _pageIndex(int value) {
    _$_pageIndexAtom.reportWrite(value, super._pageIndex, () {
      super._pageIndex = value;
    });
  }

  final _$_pageAppBarTitleAtom =
      Atom(name: '_NavigationStore._pageAppBarTitle');

  @override
  String get _pageAppBarTitle {
    _$_pageAppBarTitleAtom.reportRead();
    return super._pageAppBarTitle;
  }

  @override
  set _pageAppBarTitle(String value) {
    _$_pageAppBarTitleAtom.reportWrite(value, super._pageAppBarTitle, () {
      super._pageAppBarTitle = value;
    });
  }

  final _$_showNavigationRailAtom =
      Atom(name: '_NavigationStore._showNavigationRail');

  @override
  bool get _showNavigationRail {
    _$_showNavigationRailAtom.reportRead();
    return super._showNavigationRail;
  }

  @override
  set _showNavigationRail(bool value) {
    _$_showNavigationRailAtom.reportWrite(value, super._showNavigationRail, () {
      super._showNavigationRail = value;
    });
  }

  final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore');

  @override
  void setPageIndex(int value) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setPageIndex');
    try {
      return super.setPageIndex(value);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowNavigationRail(bool value) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setShowNavigationRail');
    try {
      return super.setShowNavigationRail(value);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePageTitle(String value) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.changePageTitle');
    try {
      return super.changePageTitle(value);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
pageAppBarTitle: ${pageAppBarTitle},
showNavigationRail: ${showNavigationRail}
    ''';
  }
}
