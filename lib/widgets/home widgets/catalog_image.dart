import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(image)
            .box
            .rounded
            .p16
            .color(context.canvasColor)
            .make()
            .p16()
            .w40(context),
      ],
    );
  }
}
