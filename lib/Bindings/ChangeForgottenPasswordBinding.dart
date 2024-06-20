import 'package:get/get.dart';
import 'package:therapease/Controllers/ChangeForgottenPasswordController.dart';


class ChangeForgottenPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeForgottenPasswordController>(() => ChangeForgottenPasswordController());
  }
}