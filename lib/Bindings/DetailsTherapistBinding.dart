import 'package:get/get.dart';
import 'package:therapease/Controllers/DetailsTherapistController.dart';


class DetailsTherapistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsTherapistController>(() => DetailsTherapistController());
  }
}