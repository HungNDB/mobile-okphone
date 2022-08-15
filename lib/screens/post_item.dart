import 'package:flutter/material.dart';
import 'package:okphone/screens/post_detail.dart';
import 'package:provider/provider.dart';
import '../Models/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context);
    return Container(
        //child: Text('${post.title}'),
        padding: EdgeInsets.only(right: 15.0),
        width: MediaQuery.of(context).size.width - 50.0,
        height: MediaQuery.of(context).size.height - 70.0,
        child: GridView.count(
          crossAxisCount: 2,
          primary: false,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.8,
          children: <Widget>[
            _buildCard('${post.title}', '\$${post.price}',
                '${post.imagePhoneUrl}', false, false, context),
          ],
        ));
  }
}

Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {
  return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostDetail(
                    assetPath: imgPath, postPrice: price, postName: name)));
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isFavorite
                              ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                              : Icon(Icons.favorite_border,
                                  color: Color(0xFFEF7532))
                        ])),
                Hero(
                    tag: imgPath,
                    child: Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.fill)))),
                SizedBox(height: 7.0),
                Text(price,
                    style: TextStyle(
                        color: Color(0xFFCC8053),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (!added) ...[
                            Icon(Icons.shopping_basket,
                                color: Color(0xFFD17E50), size: 12.0),
                            Text('Add to cart',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontSize: 12.0))
                          ],
                          if (added) ...[
                            Icon(Icons.remove_circle_outline,
                                color: Color(0xFFD17E50), size: 12.0),
                            Text('3',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0)),
                            Icon(Icons.add_circle_outline,
                                color: Color(0xFFD17E50), size: 12.0),
                          ]
                        ]))
              ]))));
}
