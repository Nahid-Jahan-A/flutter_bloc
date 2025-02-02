import 'package:bloc_prac/di/service_locator.dart';
import 'package:bloc_prac/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:bloc_prac/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:bloc_prac/presentation/blocs/product_bloc/product_event.dart';
import 'package:bloc_prac/presentation/pages/cart_page.dart';
import 'package:bloc_prac/presentation/pages/product_details_page.dart';
import 'package:bloc_prac/presentation/pages/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<ProductBloc>()..add(FetchProducts())),
          BlocProvider(create: (context) => sl<CartBloc>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Product List App",
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/',
          routes: {
            '/': (context) => const ProductListPage(),
            '/product_details': (context) => const ProductDetailsPage(),
            '/cart': (context) => const CartPage(),
          },
        ),
    );
  }
}

