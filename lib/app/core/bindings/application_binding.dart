import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/services/shopping_cart_service.dart';

import '../rest_client/rest_client.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut(() => ShoppingCartService());
  }
}