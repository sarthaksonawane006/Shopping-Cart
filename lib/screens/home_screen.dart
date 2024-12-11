import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:shopping_cart/core/store.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:shopping_cart/screens/cart_screen.dart';
import 'package:shopping_cart/screens/product_detail.dart';
import 'package:shopping_cart/widgets/home%20widgets/catalog_header.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/home widgets/catalog_item.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url = "https://api.jsonbin.io/v3/b/6591b7f21f5677401f15d914";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  // loadData() async {
  //   try {
  //     await Future.delayed(const Duration(seconds: 2));
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       final catalogJson = response.body;
  //       var decodedData = jsonDecode(catalogJson);
  //       if (decodedData.containsKey("products")) {
  //         var productsData = decodedData["products"];
  //         CatalogModel.items = List.from(productsData)
  //             .map<Item>((item) => Item.fromMap(item))
  //             .toList();
  //         setState(() {});
  //       } else {
  //         if (kDebugMode) {
  //           print("Error: 'products' key not found in JSON data");
  //         }
  //       }
  //     } else {
  //       if (kDebugMode) {
  //         print("HTTP Request failed with status code: ${response.statusCode}");
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Error during HTTP Request: $e");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (context, status, store) => FloatingActionButton(
            backgroundColor: context.theme.highlightColor,
            foregroundColor: Colors.white,
            onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
            child: const Icon(CupertinoIcons.shopping_cart),
          ).badge(
              color: Vx.red500,
              size: 22,
              count: cart.items.length,
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  const CatalogList().expand()
                else
                  const CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: ((context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(catalog: catalog),
                    ),
                  ),
              child: CatalogItem(catalog: catalog));
        }));
  }
}
