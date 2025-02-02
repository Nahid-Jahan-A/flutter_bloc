
import 'package:bloc_prac/core/network/api_service.dart';
import 'package:bloc_prac/data/datasources/product_remote_data_source.dart';
import 'package:bloc_prac/data/repositories/product_repository_impl.dart';
import 'package:bloc_prac/domain/usecases/get_products_usecase.dart';
import 'package:bloc_prac/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:bloc_prac/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

import '../domain/repositories/product_repository.dart';

final GetIt sl = GetIt.instance;

void setUp() {
  // Register API Service
  sl.registerSingleton<ApiService>(ApiService());

  // Register Remote Data Source
  sl.registerSingleton<ProductRemoteDataSource>(
    ProductRemoteDataSource(sl()),
  );

  // Register Repository (Explicitly binding interface to implementation)
  sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(sl()), // Ensure this implements ProductRepository
  );

  // Register Use Case
  sl.registerSingleton<GetProductUseCase>(
    GetProductUseCase(sl()), // Ensure ProductRepository is provided
  );

  // Register Product Bloc
  sl.registerFactory<ProductBloc>(
        () => ProductBloc(sl()),
  );

  //Register Cart Bloc
  sl.registerFactory<CartBloc>(
      () => CartBloc()
  );
}