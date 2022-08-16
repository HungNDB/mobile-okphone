import 'package:flutter/material.dart';
import 'package:okphone/screens/cart-screen.dart';
import 'package:okphone/screens/product_list.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new IconButton(
                            icon:
                                new Icon(Icons.home, color: Color(0xFFEF7532)),
                            onPressed: () {/* Your code */},
                          ),
                          new IconButton(
                            icon: new Icon(Icons.person_outline_sharp,
                                color: Color.fromARGB(255, 9, 9, 9)),
                            onPressed: () {},
                          )
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(Icons.wallet,
                                color: Color(0xFF676E79)),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                ProductList.routeName,
                              );
                            },
                          ),
                          new IconButton(
                            icon: new Icon(Icons.shopping_basket,
                                color: Color(0xFF676E79)),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                CartScreen.routeName,
                              );
                            },
                          )
                        ],
                      )),
                ])));
  }
}
