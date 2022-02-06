import 'package:vakinha_burguer_mobile/app/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> findAll();
}