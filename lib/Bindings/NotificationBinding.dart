import 'package:get/get.dart';
import 'package:therapease/Controllers/NotificationController.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}