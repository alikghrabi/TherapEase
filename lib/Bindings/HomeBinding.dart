import 'package:get/get.dart';
import 'package:therapease/Controllers/HomeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}