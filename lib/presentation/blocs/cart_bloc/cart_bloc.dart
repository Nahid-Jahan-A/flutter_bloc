

import 'package:bloc_prac/presentation/blocs/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product.dart';
import 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<Product> cartItems = [];
  double totalPrice = 0.0;

  CartBloc() : super(CartInitial()) {
    on<AddProductToCart>((event, emit) {
      cartItems.add(event.product);
      totalPrice += event.product.price;
      emit(CartUpdated(cartItems, totalPrice));
    });

    on<RemoveProductFromCart>((event, emit) {
      cartItems.remove(event.product);
      totalPrice -= event.product.price;
      emit(CartUpdated(cartItems, totalPrice));
    });

    on<ClearCart>((event, emit) {
      cartItems.clear();
      totalPrice = 0.0;
      emit(CartUpdated(cartItems, totalPrice));
    });
  }
}