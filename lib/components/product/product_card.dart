import 'package:flutter/material.dart';
import 'package:shop_app/entities/product.dart';
import 'package:shop_app/screens/cart_screen.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String category;
  final String thumbnail;

  ProductCard({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.category,
    required this.thumbnail,
  });

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> iconsStar = [];

    for (int i = 0; i < rating; i++) {
      iconsStar.add(const Icon(
        Icons.star,
        color: Colors.yellow,
        size: 25,
      ));
    }

    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(thumbnail),
              )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                category,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(children: iconsStar),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 15),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '$price €',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                          FloatingActionButton(
                            backgroundColor: Color.fromRGBO(24, 115, 233, 1),
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.black,
                              size: 25,
                            ),
                            onPressed: () {},
                          ),
                        ]),
                  )),
            ),
          ],
        ));
  }
}
