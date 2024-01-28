import 'package:get/route_manager.dart';
import 'package:motivational/src/app/splash_page.dart';
import 'package:motivational/src/features/home/presentation/home_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String homePage = '/home';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: homePage, page: () => SplashPage()),
  ];
}
