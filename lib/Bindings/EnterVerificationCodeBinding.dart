import 'package:get/get.dart';
import '../Controllers/EnterVerificationCodeController.dart';


class EnterVerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterVerificationCodeController>(() => EnterVerificationCodeController());
  }
}