import 'package:dbv_clube_management/core/binding/auth/auth_binding.dart';
import 'package:dbv_clube_management/core/binding/clubs/club_binding.dart';
import 'package:dbv_clube_management/core/binding/home_binding.dart';
import 'package:dbv_clube_management/core/binding/member/member_binding.dart';
import 'package:dbv_clube_management/core/binding/organization/organization_binding.dart';
import 'package:dbv_clube_management/core/binding/splash_screen_binding.dart';
import 'package:dbv_clube_management/ui/auth/auth_view.dart';
import 'package:dbv_clube_management/ui/clubs/club_view.dart';
import 'package:dbv_clube_management/ui/home/home_view.dart';
import 'package:dbv_clube_management/ui/home/splash_screen_view.dart';
import 'package:dbv_clube_management/ui/member/member_form_view.dart';
import 'package:dbv_clube_management/ui/member/member_view.dart';
import 'package:dbv_clube_management/ui/organization/church_view.dart';
import 'package:dbv_clube_management/ui/organization/coordinator_view.dart';
import 'package:dbv_clube_management/ui/organization/organization_area_view.dart';
import 'package:dbv_clube_management/ui/services/data_registration_view.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const splashScreen = '/splash_screen';
  static const login = '/login';
  static const home = '/home';
  static const dataRegistration = '/data/registration';

  static const organizationArea = '/pages/organizacao/area';
  static const coordinators = '/pages/organizacao/coordinators';
  static const churches = '/pages/organizacao/churches';

  static const members = '/pages/members';
  static const memberForm = '/pages/member/form';

  static const clubs = '/pages/clubs';
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(name: Routes.login, page: () => AuthView(), binding: AuthBinding()),
    GetPage(name: Routes.home, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: Routes.dataRegistration, page: () => DataRegistrationView()),
    GetPage(
      name: Routes.organizationArea,
      page: () => OrganizationAreaView(),
      binding: OrganizationBinding(),
    ),
    GetPage(
      name: Routes.coordinators,
      page: () => CoordinatorView(),
      binding: OrganizationBinding(),
    ),
    GetPage(
      name: Routes.churches,
      page: () => ChurchView(),
      binding: OrganizationBinding(),
    ),
    GetPage(name: Routes.clubs, page: () => ClubView(), binding: ClubBinding()),
    GetPage(
      name: Routes.members,
      page: () => MemberView(),
      binding: MemberBinding(),
    ),
    GetPage(
      name: Routes.memberForm,
      page: () => MemberFormView(),
      binding: MemberBinding(),
    ),
  ];
}
