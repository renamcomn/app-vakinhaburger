import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/services/auth_service.dart';

class SplashController extends GetxController {
  checkedLogged() {
    Get.putAsync(() => AuthService().init());
  } 

}