import 'package:get/route_manager.dart';
import '../modules/auth/login/login_page.dart';
import '../modules/auth/register/register_page.dart';
class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
     GetPage(
      name: '/auth/register',
      page: () => const RegisterPage(),
    ),
  ];
}
