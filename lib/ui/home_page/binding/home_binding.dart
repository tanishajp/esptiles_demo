import 'package:get/get.dart';

import '../../../network/api_helper.dart';
import '../../../network/connection/connection_manager.dart';
import '../controller/home_controller.dart';
import '../usecase/home_use_case.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        Get.put(
          ApiHelper(
            Get.put(
              ConnectionController(),
            ),
          ),
        ),
        Get.put(
          HomeUseCase(
            Get.put(
              ConnectionController(),
            ),
          ),
        ),
      ),
    );
  }
}
