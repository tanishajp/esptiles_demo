import 'package:get/get.dart';

import '../ui/home_page/binding/home_binding.dart';
import '../ui/home_page/view/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.homePage;

  static final routes = [
    GetPage(
        name: _Paths.homePage,
        page: () => const HomeView(),
        binding: HomeBinding()),
  ];
}
