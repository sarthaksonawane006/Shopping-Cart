import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/core/store.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart(this.catalog, {super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if(!isInCart) {
          AddMutation(catalog);
        }
      },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.highlightColor)),
        child: isInCart
            ? const Icon(Icons.done, color: Colors.white)
            : const Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.white,
              ));
  }
}
