import 'package:flutter/material.dart';
import 'package:okphone/provider/cardProvider.dart';
import 'package:okphone/screens/cart-screen.dart';
import 'package:okphone/screens/posts-screen.dart';
import 'package:okphone/screens/product_list.dart';
import 'package:provider/provider.dart';

import 'provider/postProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => PostsProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OkPhone v1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            accentColor: Colors.red,
          ),
          canvasColor: Colors.white,
        ),
        home: PostScreen(),
        routes: {
          CartScreen.routeName: (ctx) => CartScreen(),
          ProductList.routeName: (ctx) => ProductList(),
        },
      ),
    );
  }
}
