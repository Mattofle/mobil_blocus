import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulation_d_examen/viewModels/cart_view_model.dart';

import '../models/dish.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;

  const DishWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context, viewModel, child) {
      return Row(
        children: [
          Image.network(
            dish.imagePath,
            width: 100,
          ),
          Expanded(
            child: ListTile(
              title: Text(dish.name),
              subtitle: Text(
                dish.price.toString(),
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => {
                  viewModel.addToCart(dish)
                },
              ),
            ),
          )
        ],
      );
    });
  }
}
