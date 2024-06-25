import 'package:get/get.dart';

// Bindings
import 'package:therapease/Bindings/LoginBinding.dart';
import 'package:therapease/Bindings/RegisterBinding.dart';
import 'package:therapease/Bindings/HomeBinding.dart';
import 'package:therapease/Bindings/SearchBinding.dart';
import 'package:therapease/Bindings/ChangePasswordBinding.dart';
import 'package:therapease/Bindings/ProfileBinding.dart';
import 'package:therapease/Bindings/AccountBinding.dart';
import 'package:therapease/Bindings/NotificationBinding.dart';




// App Route
import 'package:therapease/Routes/AppRoute.dart';

// Views
import 'package:therapease/Views/Login.dart';
import 'package:therapease/Views/Register.dart';
import 'package:therapease/Views/Profile.dart';
import 'package:therapease/Views/Home.dart';
import 'package:therapease/Views/Search.dart';
import 'package:therapease/Views/ChangePassword.dart';
import 'package:therapease/Views/AccountInfo.dart';
import 'package:therapease/Views/Notification.dart';
import 'package:therapease/Views/TherapistAccount.dart';

import '../Bindings/TherapistAccountBinding.dart';
import '../Bindings/TherapistChangePasswordBinding.dart';
import '../Bindings/TherapistHomeBinding.dart';
import '../Bindings/TherapistLoginBinding.dart';
import '../Bindings/TherapistNotificationBinding.dart';
import '../Bindings/TherapistProfileBinding.dart';
import '../Bindings/TherapistRegisterBinding.dart';
import '../Bindings/TherapistRequestBinding.dart';
import '../Bindings/TherapistSettingsBinding.dart';
import '../Views/TherapistChangePassword.dart';
import '../Views/TherapistHome.dart';
import '../Views/TherapistLogin.dart';
import '../Views/TherapistNotification.dart';
import '../Views/TherapistProfile.dart';
import '../Views/TherapistRegister.dart';
import '../Views/TherapistRequest.dart';
import '../Views/TherapistSettings.dart';









class AppPage {
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.login, page: ()=>const Login(), binding: LoginBinding()),
    GetPage(name: AppRoute.register, page: ()=>const Register(), binding: RegisterBinding()),
    GetPage(name: AppRoute.home, page: ()=>const Home(), binding: HomeBinding()),
    GetPage(name: AppRoute.profile, page: ()=>const Profile(), binding: ProfileBinding()),
    GetPage(name: AppRoute.search, page: ()=>const Search(), binding: SearchBinding()),
    GetPage(name: AppRoute.changePassword, page: ()=>const ChangePassword(), binding: ChangepasswordBinding()),
    GetPage(name: AppRoute.account, page: ()=>const AccountInfo(), binding: AccountBinding()),
    GetPage(name: AppRoute.notification, page: ()=>const Notification(), binding: NotificationBinding()),
    GetPage(name: AppRoute.therapistLogin, page: ()=>const TherapistLogin(), binding: TherapistLoginBinding()),
    GetPage(name: AppRoute.therapistRegister, page: ()=>const TherapistRegister(), binding: TherapistRegisterBinding()),
    GetPage(name: AppRoute.therapistHome, page: ()=>const TherapistHome(), binding: TherapistHomeBinding()),
    GetPage(name: AppRoute.therapistNotification, page: ()=>const TherapistNotification(), binding: TherapistNotificationBinding()),
    GetPage(name: AppRoute.therapistRequest, page: ()=>const TherapistRequest(), binding: TherapistRequestBinding()),
    GetPage(name: AppRoute.therapistProfile, page: ()=>const TherapistProfile(), binding: TherapistProfileBinding()),
    GetPage(name: AppRoute.therapistSettings, page: ()=>const TherapistSettings(), binding: TherapistSettingsBinding()),
    GetPage(name: AppRoute.therapistAccount, page: ()=>const TherapistAccountInfo(), binding: TherapistAccountBinding()),
    GetPage(name: AppRoute.therapistChangePassword, page: ()=>const TherapistChangePassword(), binding: TherapistChangePasswordBinding()),















  ];
}