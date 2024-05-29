import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simulation_d_examen/views/cart_screen.dart';
import 'package:simulation_d_examen/views/home_screen.dart';
import 'package:simulation_d_examen/viewModels/cart_view_model.dart';


final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'cart_screen',
          builder: (context, state) => const CartScreen(),
        ),
      ],
    ),
  ],
);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Examen blanc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
