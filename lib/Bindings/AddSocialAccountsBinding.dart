import 'package:get/get.dart';
import 'package:therapease/Controllers/AddSocialAccountController.dart';


class AddSocialAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSocialAccountController>(() => AddSocialAccountController());
  }
}