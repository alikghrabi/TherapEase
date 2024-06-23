import 'package:get/get.dart';
import '../Controllers/TherapistSettingsController.dart';


class TherapistSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistSettingsController>(() => TherapistSettingsController());
  }
}