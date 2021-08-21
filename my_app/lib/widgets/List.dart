import 'package:flutter/material.dart';

import 'package:my_app/model/catalog.dart';

import 'package:velocity_x/velocity_x.dart';

import 'Images.dart';

// import 'Home_page.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CaltelogModels.items.length,
      itemBuilder: (context, index) {
        final catalog = CaltelogModels.items[index]; //or
        // final catalog = CaltelogModels.getByPosition(index);

        return InkWell(
            // onTap: () => Navigator.push(
            // context,
            // MaterialPageRoute(
            // builder: (contexte) => HomeDetailPage(catalog: catalog))),
            // catalog: CaltelogModels.getById(2)))),//open itm ebased on Id
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class HomeDetailPage {}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
                image:
                    catalog.image)), //to animate ta page use hero in both page
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.xl.color(context.accentColor).bold.make(),
            // catalog.price.text.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mOnly(right: 12), //padding only right side
            )
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(100).make().py16();

    // )).white.rounded.square(100).make().py16();
  }
}
