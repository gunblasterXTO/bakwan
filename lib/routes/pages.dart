import 'package:bakwan/modules/home/views/home.dart';
import 'package:bakwan/modules/splash/views/splash.dart';
import 'package:get/route_manager.dart';

part 'routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.index;

  static final routes = [
    GetPage(name: Routes.index, page: () => const Splashscreen()),
    GetPage(name: Routes.home, page: () => const HomePage()),
  ];
}
