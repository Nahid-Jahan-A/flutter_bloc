
import 'package:bloc_prac/domain/repositories/product_repository.dart';

import '../entities/product.dart';

class GetProductUseCase {
  final ProductRepository repository;

  GetProductUseCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}