import 'package:therapease/Controllers/PaymentMethodsController.dart';
import 'package:get/get.dart';

class PaymentMethodsBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodsController>(() => PaymentMethodsController());
  }
}