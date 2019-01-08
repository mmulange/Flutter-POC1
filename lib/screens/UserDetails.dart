import 'package:flutter/material.dart';
import 'package:first_project/model/User.dart';
import 'package:auro_avatar/auro_avatar.dart';

class UserDetails extends StatelessWidget {
  final User user;

  UserDetails({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = InitialNameAvatar(
      user.firstName,
      circleAvatar: true,
      borderSize: 4,
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      padding: 20,
      textSize: 30,
    );

    final nameField = Text(
      user.firstName,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
    );

    final emailField = Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.email),
          onPressed: () {},
        ),
        Text(
          user.email,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );

    final addressField = Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.location_city),
          onPressed: () {},
        ),
        Text(
          user.address1.city,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );

    final phoneField = Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.phone),
          onPressed: () {},
        ),
        Text(
          user.phone,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );

    final websiteField = Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.contact_mail),
          onPressed: () {},
        ),
        Text(
          user.website,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );

    final userDetails = Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          nameField,
          emailField,
          addressField,
          phoneField,
          websiteField,
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("User Details"),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              avatar,
              userDetails,
            ],
          ),
        ));
  }
}
