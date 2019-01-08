import 'package:flutter/material.dart';
import 'package:first_project/screens/Login.dart';
import 'package:first_project/screens/Home.dart';
import 'package:first_project/utils/SharedPreferencesHelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First Project",
      home: FutureBuilder(
        future: SharedPreferencesHelper.isLoggedIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return snapshot.hasData ? redirectScreen(snapshot) : Login();
        },
      ),
    );
  }

  Widget redirectScreen(AsyncSnapshot<bool> snapshot) {
    print(snapshot.data);
    return snapshot.data ? Home() : Login();
  }
}
