import 'package:get/get.dart';
import 'package:therapease/Bindings/LoginBinding.dart';
import 'package:therapease/Bindings/RegisterBinding.dart';
import 'package:therapease/Bindings/HomeBinding.dart';
import 'package:therapease/Routes/AppRoute.dart';
import 'package:therapease/Views/Login.dart';
import 'package:therapease/Views/Register.dart';
import 'package:therapease/Views/Home.dart';




class AppPage {
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.login, page: ()=>const Login(), binding: LoginBinding()),
    GetPage(name: AppRoute.register, page: ()=>const Register(), binding: RegisterBinding()),
    GetPage(name: AppRoute.home, page: ()=>const Home(), binding: HomeBinding())


  ];
}