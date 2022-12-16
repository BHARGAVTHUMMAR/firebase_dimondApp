import 'package:get/get.dart';

import '../../constent.dart';
import '../../main.dart';
import '../../sizeConstant.dart';
import '../modules/Log_in/bindings/log_in_binding.dart';
import '../modules/Log_in/views/log_in_view.dart';
import '../modules/Main_home/bindings/main_home_binding.dart';
import '../modules/Main_home/views/main_home_view.dart';
import '../modules/Pending_page/bindings/pending_page_binding.dart';
import '../modules/Pending_page/views/pending_page_view.dart';
import '../modules/Singup_page/bindings/singup_page_binding.dart';
import '../modules/Singup_page/views/singup_page_view.dart';
import '../modules/add_deta/bindings/add_deta_binding.dart';
import '../modules/add_deta/views/add_deta_view.dart';
import '../modules/complete_page/bindings/complete_page_binding.dart';
import '../modules/complete_page/views/complete_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/views/profile_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL =
      (!isNullEmptyOrFalse(box.read(StringConstants.IsLogIn)))
          ? Routes.HOME
          : Routes.LOG_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SINGUP_PAGE,
      page: () => const SingupPageView(),
      binding: SingupPageBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN,
      page: () => const LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_HOME,
      page: () => const MainHomeView(),
      binding: MainHomeBinding(),
    ),
    GetPage(
      name: _Paths.PENDING_PAGE,
      page: () => const PendingPageView(),
      binding: PendingPageBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETE_PAGE,
      page: () => const CompletePageView(),
      binding: CompletePageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DETA,
      page: () => const AddDetaView(),
      binding: AddDetaBinding(),
    ),
  ];
}
