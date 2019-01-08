import 'package:flutter/material.dart';
import 'package:first_project/model/Post.dart';
import 'package:first_project/network_utils/Constants.dart';
import 'package:first_project/network_utils/NetworkUtils.dart';

class PostsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PostsScreenState();
  }
}

class PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: NetworkUtils().getData(Constants.URL_POSTS),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return getPostsList(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget getPostsList(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          child: rowView(posts[i]),
          onTap: () {
            final snackBar = SnackBar(
              content: Text(posts[i].title),
            );

            Scaffold.of(context).showSnackBar(snackBar);
          },
        );
      },
    );
  }

  Widget rowView(Post post) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.title,
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border(
            top: BorderSide(color: Colors.grey),
            bottom: BorderSide(color: Colors.grey),
            left: BorderSide(color: Colors.grey),
            right: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
