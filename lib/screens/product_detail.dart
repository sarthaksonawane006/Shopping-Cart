import 'package:flutter/material.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:shopping_cart/widgets/home%20widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatelessWidget {
  static String routeName = "/productDetailRoute";
  final Item catalog;
  const ProductDetail({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mOnly(right: 16),
          children: [
            "\$${catalog.price}".text.bold.red800.xl4.make(),
            AddToCart(catalog).wh(150, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image).h32(context),
            ),
            Expanded(
                child: VxArc(
              arcType: VxArcType.convey,
              height: 30.0,
              edge: VxEdge.top,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(children: [
                  catalog.name.text.bold.xl4.color(context.accentColor).make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  "eos et provident vel sunt aperiam optio voluptatem perferendis quia doloremque beatae nisi non facere minima eius quos minus mollitia voluptate quo enim asjfoiae afijseosndk afwohsilufahef iefhawilehf aiefhaiefbalef iefuhaieflu weifluahefliu afiuhewfiu excepturi nemo et sapiente quia cmoiwney cxnwei qxwnyqiw wyeiu iuqw cneawiu skdfhpraesentium sint"
                      .text
                      .textStyle(context.captionStyle)
                      .make()
                      .p16()
                ]).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
