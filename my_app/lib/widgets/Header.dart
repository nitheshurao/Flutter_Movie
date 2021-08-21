import 'package:flutter/material.dart';
// import 'package:my_app/utils/them.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Vx.hexToColor(code)
        // "APP".text.xl5.bold.color(Mythemes.darkbluishcolor).make(),
        "APP".text.xl5.bold.color(context.theme.accentColor).make(),
      ],
    );
  }
}
