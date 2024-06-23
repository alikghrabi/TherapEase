import 'package:get/get.dart';
import 'package:therapease/Controllers/ChangePasswordController.dart';

import '../Controllers/SendVerificationCodeController.dart';
import '../Controllers/TherapistLoginController.dart';
import '../Controllers/TherapistRequestController.dart';


class TherapistRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistRequestController>(() => TherapistRequestController());
  }
}