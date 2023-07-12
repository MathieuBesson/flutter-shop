import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'dart:convert';
import 'package:shop_app/components/product/product_card.dart';
import 'package:shop_app/entities/product.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ShopScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> productsJson = responseData['products'];
      setState(() {
        products = productsJson.map((json) => Product.fromJson(json)).toList();
      });
    } else {
      print('Failed to fetch products');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> productWidgets = [];

    for (final product in products) {
      productWidgets.add(ProductCard(
        id: product.id,
          title: product.title,
          description: product.description,
          price: product.price,
          rating: product.rating,
          category: product.category,
          thumbnail: product.thumbnail));
    }

    return Scaffold(
        body: ResponsiveGridList(
            desiredItemWidth: 300, minSpacing: 20, children: productWidgets));
  }
}
