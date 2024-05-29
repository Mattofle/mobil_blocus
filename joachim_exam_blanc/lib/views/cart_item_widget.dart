import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModels/cart_view_model.dart';
import '../models/dish.dart';

class CartItemWidget extends StatelessWidget {
  final Dish dish;

  const CartItemWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context, viewModel, child) {
      return Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(dish.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.price.toString(),
                  ),
                  Text(
                    'Quantity: ${viewModel.cart[dish]}',
                  ),
                ],
              ),
              trailing: Container(
                width: 100, // specify your desired width
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () =>
                      {
                        viewModel.incrementQuantity(dish)
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () =>
                      {
                        viewModel.decrementQuantity(dish)
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}