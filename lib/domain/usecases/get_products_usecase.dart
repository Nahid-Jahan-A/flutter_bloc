
import 'package:bloc_prac/domain/repositories/product_repository.dart';

import '../../core/usecase/usecase.dart';
import '../entities/product.dart';

class GetProductUseCase extends UseCase<List<Product>, void> {
  final ProductRepository repository;

  GetProductUseCase(this.repository);

  @override
  Future<List<Product>> call(void params) async {
    return await repository.getProducts();
  }
}