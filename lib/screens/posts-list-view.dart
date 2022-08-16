import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:matcher/matcher.dart';
import 'package:provider/provider.dart';

import '../provider/postProvider.dart';
import './post_item.dart';
import 'bottom_bar.dart';

class PostListView extends StatefulWidget {
  PostListView({Key? key}) : super(key: key);

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  final _controller = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    _controller.addListener(
      () {
        setState(() {
          _searchText = _controller.text;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void changeString(String search) {
  //   Provider.of<PostsProvider>(context, listen: false).changeSearchString(search);
  // }

  Future<void> _refreshMatches(BuildContext context) async {
    await Provider.of<PostsProvider>(context, listen: false).fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.grey);
    final style = _searchText.isEmpty ? styleHint : styleActive;
    final postsProvider = Provider.of<PostsProvider>(context);
    final posts = postsProvider.postList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Helloo OkPhone'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshMatches(context),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 42,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Colors.black26),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.blue),
                  suffixIcon: _searchText.isNotEmpty
                      ? GestureDetector(
                          child: Icon(Icons.close, color: style.color),
                          onTap: () {
                            _controller.clear();

                            FocusScope.of(context).unfocus();
                          },
                        )
                      : null,
                  hintText: 'search ...',
                  hintStyle: style,
                  border: InputBorder.none,
                ),
                style: style,
                onChanged: (value) {},
              ),
            ),
            posts.length == 0
                ? Center(
                    child: Text(
                      'Post Not Found',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.2),
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                      ),
                      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                        value: posts[index],
                        child: PostItem(
                            // id: products[index].id,
                            // title: products[index].title,
                            // imageUrl: products[index].imageUrl,
                            ),
                      ),
                      itemCount: posts.length,
                    ),
                  ),
          ],
        ),
      ),
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
