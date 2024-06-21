import 'package:get/get.dart';
import 'package:therapease/Controllers/ChangePasswordController.dart';

import '../Controllers/SendVerificationCodeController.dart';
import '../Controllers/TherapistLoginController.dart';


class TherapistLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistLoginController>(() => TherapistLoginController());
  }
}