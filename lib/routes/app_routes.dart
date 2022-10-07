import 'package:a/features/auth/login/presentation/page/login_page.dart';

class R {
  static const String _ = '/';
  static const String loginPage = '${_}login_page';
}

class AppRoutes {
  static final routes = {
    R.loginPage: (_) => const LoginPage(),
  };
}
