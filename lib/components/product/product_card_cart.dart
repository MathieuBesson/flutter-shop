import 'package:flutter/material.dart';

class ProductCardCart extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final double amount;
  final double totalAmount;
  final int quantity;
  final Function(int productId) increaseQuantity;
  final Function(int productId) decreaseQuantity;

  ProductCardCart(
      {required this.id,
      required this.image,
      required this.title,
      required this.amount,
      required this.totalAmount,
      required this.quantity,
      required this.increaseQuantity,
      required this.decreaseQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.all(20),
        padding:
            const EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(image),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                overflow: TextOverflow.ellipsis,
                title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                amount.toString() + "€",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () => decreaseQuantity(id),
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 20),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    onPressed: () => increaseQuantity(id),
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.black,
                      size: 35,
                    )),
                //Sample usage by passing it to the onPressed value of an Elevated Button
                //There is no return value for this function
              )
            ]),
            Align(
              alignment: Alignment.center,
              child: Text(
                totalAmount.toString() + "€",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ));
  }
}
