import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simulation_d_examen/viewModels/cart_view_model.dart';

import '../models/dish.dart';
import 'menu_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Dish> dishes = [];
  var message = "Loading…";

  Future<void> _initDishes() async {
    try {
      var response = await Dish.fetchDishes();
      setState(() {
        if (response.isEmpty) message = "No dishes found";
        dishes.addAll(response);
      });
    } catch (error) {
      setState(() => message = error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _initDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Menu"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    context.go('/cart_screen');
                  },
                ),
                Positioned(
                  right: 3,
                  bottom: 3,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      viewModel.nbArticles.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: dishes.isNotEmpty
              ? MenuWidget(menu: dishes)
              : const CircularProgressIndicator(),
        ),
      );
    });
  }
}
