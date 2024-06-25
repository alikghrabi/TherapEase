import 'package:get/get.dart';

import '../Controllers/TherapistChangePasswordController.dart';

class TherapistChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistChangePasswordController>(() => TherapistChangePasswordController());
  }
}