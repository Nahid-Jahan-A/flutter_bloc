
import 'package:bloc_prac/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}