part of 'app_pages.dart';

abstract class Routes {
  static const dashboard = _Paths.dashboard;
  static const homePage = _Paths.homePage;
  static const searchdNewsPage = _Paths.searchdNewsPage;
  static const savedNewsPage = _Paths.savedNewsPage;
  static const settingPage = _Paths.settingPage;
  static const newsDetailPage = _Paths.newsDetailPage;
}

abstract class _Paths {
  static const dashboard = '/dashboard';
  static const homePage = '/homePage';
  static const searchdNewsPage = '/searchdNewsPage';
  static const savedNewsPage = '/savedNewsPage';
  static const settingPage = '/settingPage';
  static const newsDetailPage = '/newsDetailPage';
}
