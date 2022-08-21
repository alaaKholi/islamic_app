import 'package:get/get.dart';
import 'package:islamic_app/modules/main/base_controller.dart';

import '../modules/main/pray_times/pray_times_controller.dart';
import '../modules/main/qibla_compase/qibla_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => QiblaCompassController(), fenix: true);
    Get.lazyPut(() => BasePermissionController(), fenix: true);
    Get.lazyPut(() => QiblaCompassController(), fenix: true);
    Get.lazyPut(() => PrayTimesController(), fenix: true);
  // await
  //       Get.putAsync(() => QiblaCompassController().onInit());
  
  }
}
