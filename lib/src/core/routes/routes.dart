import 'package:get/route_manager.dart';
import 'package:motivational/src/app/splash_page.dart';
import 'package:motivational/src/features/home/no_internet/presentation/no_internet_page.dart';
import 'package:motivational/src/features/home/presentation/favorite_page.dart';
import 'package:motivational/src/features/home/presentation/home_page.dart';
import 'package:motivational/src/features/home/presentation/painter_page.dart';
import 'package:motivational/src/features/home/presentation/quotes_of_day_page.dart';

class AppRoutes {
  static Transition transitionType = Transition.rightToLeft;
  static Duration transitionDuration = const Duration(milliseconds: 300);
  static const String splash = '/';
  static const String homePage = '/home';
  static const String paintPage = '/paintPage';
  static const String favoritePage = '/favoritePage';
  static const String noInternet = '/noInternetPage';
  static const String quotesoftheDay = '/quotesoftheDay';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashPage(), transition: Transition.fadeIn),
    GetPage(name: homePage, page: () => const HomePage(), transition: transitionType, transitionDuration: transitionDuration),
    GetPage(name: paintPage, page: () => const PainterPage(), transition: transitionType, transitionDuration: transitionDuration),
    GetPage(name: favoritePage, page: () => const FavoritePage(), transition: transitionType, transitionDuration: transitionDuration),
    GetPage(name: noInternet, page: () => const NoInternetPage(), transition: transitionType, transitionDuration: transitionDuration),
    GetPage(name: quotesoftheDay, page: () => const QuotesOfDayPage(), transition: transitionType, transitionDuration: transitionDuration),
  ];
}
