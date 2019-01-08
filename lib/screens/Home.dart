import 'package:flutter/material.dart';
import 'package:first_project/screens/Users.dart';
import 'package:first_project/screens/Posts.dart';
import 'package:first_project/screens/Photos.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Dashboard"),
            backgroundColor: Colors.teal,
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.supervised_user_circle),
                  text: "Users",
                ),
                Tab(
                  icon: Icon(Icons.book),
                  text: "Posts",
                ),
                Tab(
                  icon: Icon(Icons.photo),
                  text: "Photos",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              UsersScreen(),
              PostsScreen(),
              PhotosScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
