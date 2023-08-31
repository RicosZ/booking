import 'package:booking/modules/views/admin_view.dart';
import 'package:get/get.dart';
import '../modules/bindings/home_binding.dart';
import '../modules/views/home_view.dart';
import 'app_routes.dart';

class AppPage {
  static var routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.inspect,
      page: () => const AdminView(),
      binding: HomeBinding(),
    )
  ];
}
