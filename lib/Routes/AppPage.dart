import 'package:get/get.dart';
import 'package:therapease/Bindings/LoginBinding.dart';
import 'package:therapease/Routes/AppRoute.dart';
import 'package:therapease/Views/Login.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.login, page: ()=>Login(), binding: LoginBinding())
  ];
}