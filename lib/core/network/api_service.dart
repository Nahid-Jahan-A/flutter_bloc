

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> getProducts() async {
    final response = await _dio.get('https://fakestoreapi.com/products');
    return response.data;
  }
}