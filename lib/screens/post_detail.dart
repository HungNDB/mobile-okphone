// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../db-helper/dbHelper.dart';
import '../models/cart.dart';
import '../provider/cardProvider.dart';
import 'bottom_bar.dart';

// ignore: must_be_immutable
class PostDetail extends StatelessWidget {
  final assetPath, postPrice, postName, description, userName, id;
  final DBHelper dbHelper = DBHelper();
  PostDetail({
    this.assetPath,
    this.postPrice,
    this.postName,
    this.description,
    this.userName,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    void saveData(String userName, String phoneName, String price,
        String imageUrl, String id) {
      var myPrice = int.parse(price);
      assert(myPrice is int);
      var myId = int.parse(id);
      assert(myId is int);

      DBHelper()
          .insert(
        Cart(
          id: myId,
          productId: "$myId",
          productName: phoneName,
          initialPrice: myPrice,
          productPrice: myPrice,
          quantity: ValueNotifier(1),
          unitTag: "cai",
          image: imageUrl,
        ),
      )
          .then((value) {
        cart.addTotalPrice(myPrice.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(" vcc dell chay dc");
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Pickup',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('Phone Details',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        SizedBox(height: 30.0),
        Hero(
            tag: assetPath,
            child: Image.network(assetPath,
                height: 200.0, width: 150.0, fit: BoxFit.contain)),
        SizedBox(height: 20.0),
        Center(
          child: Text(postPrice + " vnd",
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        SizedBox(height: 12.0),
        Center(
          child: Text(postName,
              style: const TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 40.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFFF17532)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 241, 137, 1)),
                    onPressed: () {
                      saveData(
                        postName,
                        postName,
                        postPrice,
                        assetPath,
                        id,
                      );
                    },
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )))),
        SizedBox(height: 20.0)
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.phone_android_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
