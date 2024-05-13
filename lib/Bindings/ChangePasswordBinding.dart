import 'package:get/get.dart';
import 'package:therapease/Controllers/ChangePasswordController.dart';


class ChangepasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
  }
}