import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulation_d_examen/views/dish_widget.dart';
import 'package:simulation_d_examen/viewModels/cart_view_model.dart';

import 'cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            Expanded(
              child: Provider.of<CartViewModel>(context, listen: false)
                      .cart
                      .isEmpty
                  ? const Center(child: Text("Cart is empty"))
                  : ListView.builder(
                      itemCount: viewModel.cart.length,
                      itemBuilder: (context, index) {
                        var dishEntry = viewModel.cart.entries.elementAt(index);
                        return CartItemWidget(dish: dishEntry.key);
                      },
                    ),
            ),
            Center(
              child: Text(
                'Total amount: ${viewModel.totalPrice.toStringAsFixed(2)}€',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
