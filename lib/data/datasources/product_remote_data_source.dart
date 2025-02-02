

import 'package:bloc_prac/core/network/api_service.dart';
import 'package:bloc_prac/data/models/product_model.dart';

class ProductRemoteDataSource {
  final ApiService apiService;

  ProductRemoteDataSource(this.apiService);

  Future<List<ProductModel>> fetchProducts() async {
    final response = await apiService.getProducts();
    return response.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
  }
}