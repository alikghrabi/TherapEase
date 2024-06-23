import 'package:get/get.dart';
import 'package:therapease/Controllers/TherapistHomeController.dart';

class TherapistHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistHomeController>(() => TherapistHomeController());
  }
}