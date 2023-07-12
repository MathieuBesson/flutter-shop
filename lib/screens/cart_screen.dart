import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/product/product_card_cart.dart';
import 'package:shop_app/entities/product.dart';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> products = [];
  double totalAmount = 0;
  int totalNumber = 0;

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

      double totalAmountCalcul = 0;
      for (dynamic productJson in productsJson) {
        totalAmountCalcul += productJson['price'];
      }

      setState(() {
        products = productsJson.map((json) => Product.fromJson(json)).toList();
        totalAmount = totalAmountCalcul;
        totalNumber = productsJson.length;
      });
    } else {
      print('Failed to fetch products');
    }
  }

  void increaseProductQuantity(int productId) async {
    setState(() {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == productId) {
          products[i].quantity += 1;
          products[i].totalAmount += products[i].price;
          totalAmount += products[i].price;
          totalNumber++;
          break;
        }
      }
    });
  }

  void decreaseProductQuantity(int productId) async {
    setState(() {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == productId && products[i].quantity > 0) {
          products[i].quantity -= 1;
          products[i].totalAmount -= products[i].price;
          totalAmount -= products[i].price;
          totalNumber--;
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> productWidgets = [];

    for (final product in products) {
      productWidgets.add(ProductCardCart(
        id: product.id,
        image: product.thumbnail,
        title: product.title,
        amount: product.price,
        totalAmount: product.totalAmount,
        quantity: product.quantity,
        increaseQuantity: (int productId) => WidgetsBinding.instance
            .addPostFrameCallback((_) => increaseProductQuantity(productId)),
        decreaseQuantity: (int productId) => WidgetsBinding.instance
            .addPostFrameCallback((_) => decreaseProductQuantity(productId)),
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40, left: 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Text(
                    'Mon panier',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
                Row(children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Nb articles : ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            totalNumber.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Prix total : ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            totalAmount.toString() + "€",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )
                ]),
              ]),
        ),
        Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView(
                  children: productWidgets,
                )))
      ],
    );
  }
}
