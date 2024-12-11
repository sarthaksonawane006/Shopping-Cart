import 'package:flutter/material.dart';
import 'package:shopping_cart/core/store.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cartScreen";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [const _CartList().p32().expand(), const _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              notifications: const {},
              mutations: const {RemoveMutation},
              builder: (context, store, _) {
                return "\$${cart.totalPrice}"
                    .text
                    .color(context.accentColor)
                    .xl5
                    .make();
              },),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "You can't buy anything".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          context.theme.highlightColor)),
                  child: "Buy".text.white.make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    return cart.items.isEmpty
        ? "Nothing to show"
            .text
            .xl3
            .textStyle(context.captionStyle)
            .makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  RemoveMutation(cart.items[index]);
                },
              ),
              title: cart.items[index].name.text.make(),
            ),
          );
  }
}
