import 'package:flutter/material.dart';
// import 'package:my_app/utils/them.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .py16 //padding
        // .color(Mythemes.creamColor)
        .color(context.canvasColor)
        .make()
        .py16() //padding
        .w40(context); //wodth of image inside padding
  }
}
