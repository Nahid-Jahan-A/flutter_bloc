

import 'package:bloc_prac/domain/entities/product.dart';

sealed class CartState{}

class CartInitial extends CartState{}

class CartUpdated extends CartState {
  final List<Product> cartItems;
  final double price;

  CartUpdated(this.cartItems, this.price);
}