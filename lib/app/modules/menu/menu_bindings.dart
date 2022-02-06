import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/repositories/products/products_repository.dart';
import 'package:vakinha_burguer_mobile/app/repositories/products/products_repository_impl.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
    @override
    void dependencies() {
      Get.lazyPut<ProductsRepository>(() => ProductsRepositoryImpl(restClient: Get.find()));
        Get.put(MenuController(productsRepository: Get.find()));
    }
}