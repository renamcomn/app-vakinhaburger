import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burguer_mobile/app/core/services/shopping_cart_service.dart';
import 'package:vakinha_burguer_mobile/app/modules/menu/menu_bindings.dart';
import 'package:vakinha_burguer_mobile/app/modules/menu/menu_page.dart';
import 'package:vakinha_burguer_mobile/app/modules/order/shopping_cart/shopping_cart_bindings.dart';
import 'package:vakinha_burguer_mobile/app/modules/order/shopping_cart/shopping_cart_page.dart';

class HomeController extends GetxController {  

  static const NAVIGATOR_KEY = 1;
  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_cart', '/exit'];
  int get tabIndex => _tabIndex.value;
  int get totalProductsInShoppingCart => _shoppingCartService.totalProducts;
  final ShoppingCartService _shoppingCartService;

  HomeController({required ShoppingCartService shoppingCartService }) : _shoppingCartService = shoppingCartService;

  set tabIndex(int index) {
    _tabIndex(index);
    if(_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    print(settings.name);
    if(settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn
      );
    }
    if(settings.name == '/order/shopping_cart') {
       return GetPageRoute(
        settings: settings,
        page: () => ShoppingCartPage(),
        binding: ShoppingCartBindings(),
        transition: Transition.fadeIn
      );
    }
  }
}