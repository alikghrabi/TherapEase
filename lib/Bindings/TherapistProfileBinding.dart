import 'package:get/get.dart';

import '../Controllers/TherapistProfileController.dart';


class TherapistProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistProfileController>(() => TherapistProfileController());
  }
}