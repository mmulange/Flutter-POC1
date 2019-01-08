import 'package:flutter/material.dart';
import 'package:first_project/model/User.dart';
import 'package:first_project/network_utils/NetworkUtils.dart';
import 'package:first_project/network_utils/Constants.dart';
import 'package:first_project/screens/UserDetails.dart';
import 'package:slide_transition_page_route/slide_transition_page_route.dart';

class UsersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UsersScreenState();
  }
}

class UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<User>>(
          future: NetworkUtils().getData(Constants.URL_USERS),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return getUsersList(snapshot.data);
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

  Widget getUsersList(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          child: rowView(users[i]),
          onTap: () {
            Navigator.push(
                context, SlideLeftRoute(widget: UserDetails(user: users[i])));
          },
        );
      },
    );
  }

  Widget rowView(User user) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user.firstName,
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 3),
            Text(
              user.email,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 3),
            Text(
              user.address1.city,
              style: TextStyle(color: Colors.black),
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
