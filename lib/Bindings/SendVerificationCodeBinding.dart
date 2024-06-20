import 'package:get/get.dart';
import 'package:therapease/Controllers/ChangePasswordController.dart';

import '../Controllers/SendVerificationCodeController.dart';


class SendVerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendVerificationCodeController>(() => SendVerificationCodeController());
  }
}