import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../blocs/cart_bloc/cart_event.dart';
import '../blocs/cart_bloc/cart_state.dart';
import '../../domain/entities/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated && state.cartItems.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = state.cartItems[index];
                      return ListTile(
                        leading: Image.network(product.image, width: 50, height: 50),
                        title: Text(product.title),
                        subtitle: Text("\$${product.price}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                          onPressed: () {
                            context.read<CartBloc>().add(RemoveProductFromCart(product));
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text("Total Price: \$${state.price.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CartBloc>().add(ClearCart());
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Cart cleared!"))
                          );
                        },
                        child: const Text("Clear Cart"),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(child: Text("Your cart is empty"));
          }
        },
      ),
    );
  }
}
