import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:my_app/model/catalog.dart';
import 'package:my_app/util/routes.dart';
import 'package:my_app/widgets/Header.dart';
import 'package:my_app/widgets/List.dart';

import "package:velocity_x/velocity_x.dart";

import 'package:http/http.dart' as http;

//to UI

class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2)); // 2 sc dely displying loding
    var CatlogJson = await rootBundle.loadString("assets/Files/Catalog.json");
    // final response =
    //     await http.get(Uri.parse("https://fakestoreapi.com/products/"));

    // var CatlogJson = response.body;
    var decodedData = jsonDecode(CatlogJson);
    print(CatlogJson);
    var productdata = decodedData["products"];

    // List<Item> list =
    //     List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    CaltelogModels.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    print(decodedData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              children: [
                //  Vx.hexToColor(code)
                CatalogHeader(),

                if (CaltelogModels.items != null &&
                    CaltelogModels.items.isNotEmpty)
                  CatalogList().expand() //refre to expand use
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

//catalog header
// CatalogList

// class CatalogImage extends StatelessWidget {
//   final String image;

//   const CatalogImage({Key? key, required this.image}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Image.network(image)
//         .box
//         .rounded
//         .py16 //padding
//         .color(Mythemes.creamColor)
//         .make()
//         .py16() //padding
//         .w40(context); //wodth of image inside padding
//   }
// }