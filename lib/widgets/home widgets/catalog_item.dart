import 'package:flutter/material.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:shopping_cart/widgets/home%20widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'add_to_cart.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.xl.color(context.accentColor).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mOnly(right: 16),
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog)
                ],
              )
            ],
          ),
        )
      ],
    )).color(context.cardColor).roundedLg.square(150).make().p16();
  }
}


