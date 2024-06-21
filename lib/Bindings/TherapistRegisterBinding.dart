import 'package:get/get.dart';
import 'package:therapease/Controllers/ChangePasswordController.dart';

import '../Controllers/SendVerificationCodeController.dart';
import '../Controllers/TherapistLoginController.dart';
import '../Controllers/TherapistRegisterController.dart';


class TherapistRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistRegisterController>(() => TherapistRegisterController());
  }
}