import 'package:bloc_prac/domain/entities/product.dart';
import 'package:bloc_prac/domain/repositories/product_repository.dart';

import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final response = await remoteDataSource.fetchProducts();

    return response.map((product) {
      return Product(
          id: product.id,
          title: product.title,
          price: product.price,
          description: product.description,
          category: product.category,
          image: product.image,
          rating: product.rating.rate);
    }).toList();
  }
}
