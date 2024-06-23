import 'package:get/get.dart';
import 'package:therapease/Controllers/LoginController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Bind LoginController to be used in the application
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
