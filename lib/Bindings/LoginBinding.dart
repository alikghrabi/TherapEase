import 'package:get/get.dart';
import 'package:therapease/Controllers/LoginController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}