import 'package:get/get.dart';

import '../Controllers/TherapistNotificationController.dart';


class TherapistNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistNotificationController>(() => TherapistNotificationController());
  }
}