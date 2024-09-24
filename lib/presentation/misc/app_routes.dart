abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const NEW_PASSWORD = _Paths.NEW_PASSWORD;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const PROFILE = _Paths.PROFILE;
  static const UPDATE_POFILE = _Paths.UPDATE_POFILE;
  static const CHANGE_PASSWORD = _Paths.CHANGE_PASSWORD;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/';
  static const MAIN = '/main';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const NEW_PASSWORD = '/new-password';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const PROFILE = '/profile';
  static const UPDATE_POFILE = '/update-pofile';
  static const CHANGE_PASSWORD = '/change-password';
}
