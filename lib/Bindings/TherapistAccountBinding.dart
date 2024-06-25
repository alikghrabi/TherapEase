import 'package:get/get.dart';

import '../Controllers/TherapistAccountController.dart';

class TherapistAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistAccountController>(() => TherapistAccountController());
  }
}