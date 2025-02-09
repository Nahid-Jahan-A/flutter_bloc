

import 'package:bloc_prac/domain/usecases/get_products_usecase.dart';
import 'package:bloc_prac/presentation/blocs/product_bloc/product_event.dart';
import 'package:bloc_prac/presentation/blocs/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUseCase getProductsUseCase;

  ProductBloc(this.getProductsUseCase) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await getProductsUseCase(null);
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError("Failed to load products"));
      }
    });
  }
}