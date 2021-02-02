import 'package:look/data/repository.dart';
import 'package:look/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  static const String TAG = "LanguageStore";

  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  _NavigationStore(Repository repository) : this._repository = repository {
    // init();
  }

  // general:-------------------------------------------------------------------
  void init() async {
    // getting current language from shared preference
    _repository?.currentPageTitle?.then((title) {
      if (title != null) {
        _pageAppBarTitle = title;
      }
    });
  }

// getters:-------------------------------------------------------------------
  @computed
  int get pageIndex => _pageIndex;

  @computed
  String get pageAppBarTitle => _pageAppBarTitle;

  @computed
  bool get showNavigationRail => _showNavigationRail;

  // disposers:-----------------------------------------------------------------
  List<ReactionDisposer> _disposers;

  // store variables:-----------------------------------------------------------
  @observable
  int _pageIndex = 0;
  @observable
  String _pageAppBarTitle = 'homepage';
  @observable
  bool _showNavigationRail = false;

  // actions:-------------------------------------------------------------------
  @action
  void setPageIndex(int value) {
    _pageIndex = value;
  }

  @action
  void setShowNavigationRail(bool value) {
    _showNavigationRail = value;
  }

  @action
  void changePageTitle(String value) {
    _pageAppBarTitle = value;
    // _repository.changePageTitle(value).then((_) {
    // write additional logic here
    // });
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
