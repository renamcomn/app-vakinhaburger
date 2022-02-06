import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/models/product_model.dart';

class ProductDetailController extends GetxController {

  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.0.obs;
  final _quantity = 1.obs;

  ProductModel get product => _product.value;
  double get totalPrice =>  _totalPrice.value;
  int get quantity => _quantity.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });
  }

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if(_quantity > 1) {
      _quantity.value -= 1;
    } 
  }

}