import 'package:flutter/material.dart';
import 'package:okphone/screens/post_detail.dart';
import 'package:provider/provider.dart';
import '../Models/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // ignore: sort_child_properties_last
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostDetail(
                      assetPath: post.imagePhoneUrl,
                      postPrice: post.price.toString(),
                      postName: post.title,
                      description: post.description.toString(),
                      userName: post.userName.toString(),
                      id : post.id.toString(),
                    )));
          },
          child: Image.network(
            post.imagePhoneUrl!,
            fit: BoxFit.cover,
          ),
        ),

        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(false ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {},
          ),
          backgroundColor: Color.fromARGB(221, 240, 211, 211),
          title: Text(
            post.phoneName!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'ADDED TO YOUR CART!',
                  ),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {},
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

// Widget _buildCard(String name, String price, String imgPath, bool added,
//     bool isFavorite, context) {
//   return Padding(
//       padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
//       child: InkWell(
//           onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => PostDetail(
//                     assetPath: imgPath, postPrice: price, postName: name)));
//           },
//           child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 3.0,
//                         blurRadius: 5.0)
//                   ],
//                   color: Colors.white),
//               child: Column(children: [
//                 Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           isFavorite
//                               ? Icon(Icons.favorite, color: Color(0xFFEF7532))
//                               : Icon(Icons.favorite_border,
//                                   color: Color(0xFFEF7532))
//                         ])),
//                 Hero(
//                     tag: imgPath,
//                     child: Container(
//                         height: 90.0,
//                         width: 90.0,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage(imgPath),
//                                 fit: BoxFit.fill)))),
//                 SizedBox(height: 7.0),
//                 Text(price,
//                     style: TextStyle(
//                         color: Color(0xFFCC8053),
//                         fontFamily: 'Varela',
//                         fontSize: 14.0)),
//                 Text(name,
//                     style: TextStyle(
//                         color: Color(0xFF575E67),
//                         fontFamily: 'Varela',
//                         fontSize: 14.0)),
//                 Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
//                 Padding(
//                     padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           if (!added) ...[
//                             Icon(Icons.shopping_basket,
//                                 color: Color(0xFFD17E50), size: 12.0),
//                             Text('Add to cart',
//                                 style: TextStyle(
//                                     fontFamily: 'Varela',
//                                     color: Color(0xFFD17E50),
//                                     fontSize: 12.0))
//                           ],
//                           if (added) ...[
//                             Icon(Icons.remove_circle_outline,
//                                 color: Color(0xFFD17E50), size: 12.0),
//                             Text('3',
//                                 style: TextStyle(
//                                     fontFamily: 'Varela',
//                                     color: Color(0xFFD17E50),
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12.0)),
//                             Icon(Icons.add_circle_outline,
//                                 color: Color(0xFFD17E50), size: 12.0),
//                           ]
//                         ]))
//               ]))));
// }
