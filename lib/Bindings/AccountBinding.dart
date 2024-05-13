import 'package:get/get.dart';
import 'package:therapease/Controllers/AccountController.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
  }
}