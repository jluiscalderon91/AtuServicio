import 'package:flutter/material.dart';
import 'package:fryo/src/models/single_product.dart';
class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var productList = [
    {
      "name": "Women Bag",
      "picture": "images/1.png",
      "old price": 120,
      "price": 85.99
    },
    {
      "name": "Blazzer1",
      "picture": "images/2.png",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Blazzer2",
      "picture": "images/3.png",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Red Dress",
      "picture": "images/4.png",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Dress",
      "picture": "images/5.png",
      "old price": 120,
      "price": 85.99
    },
    {
      "name": "Hills",
      "picture": "images/6.png",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Hills",
      "picture": "images/7.png",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Panet",
      "picture": "images/8.png",
      "old price": 120,
      "price": 85
    },
    {
      "name": "SKT",
      "picture": "images/9.png",
      "old price": 120,
      "price": 85
    },
    {
      "name": "SKT",
      "picture": "images/welcome.png",
      "old price": 120,
      "price": 85
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['old price'],
            productPrice: productList[index]['price'],
          );
        });
  }
}
