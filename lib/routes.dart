import 'package:get/get.dart';
import 'view/auth.dart';
import 'view/home_page.dart';
import 'view/menu_page.dart';
import 'view/messages_page.dart';
import 'view/Statistics.dart';

class AppRoutes {
  static const registration = '/registration';
  static const login = '/login';
  static const auth = '/auth';
  static const home = '/home';
  static const menu = '/menu';
  static const messages = '/messages';
  static const profile = '/profile';

  static final routes = [
    GetPage(
      name: AppRoutes.auth,
      page: () => AuthPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.menu,
      page: () => MenuPage(),
    ),
    GetPage(
      name: AppRoutes.messages,
      page: () => MessagesPage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => Statistics(),
    ),
  ];
}
