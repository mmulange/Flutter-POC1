import 'package:flutter/material.dart';
import 'package:first_project/screens/RegisterScreen.dart';
import 'package:first_project/database/DBHelper.dart';
import 'package:first_project/model/User.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_project/screens/Home.dart';
import 'package:first_project/utils/SharedPreferencesHelper.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void printValue() {
      debugPrint(
          "User Name ${emailController.text} and Password ${passwordController.text}");

      var dbHelper = DBHelper();
      //dbHelper.getUsers();

      Future<User> user = dbHelper.getUsersByEmail(
          emailController.text, passwordController.text);

      user.then((result) {
        if (result == null) {
          Fluttertoast.showToast(
              msg: "Please user the valid username and password");
        } else {
          print(result.id.toString() +
              " " +
              result.firstName +
              " " +
              result.lastName +
              " " +
              result.gender);

          SharedPreferencesHelper.setLoggedIn(true);

          Route route = MaterialPageRoute(builder: (context) => Home());
          Navigator.pushReplacement(context, route);
        }
      });
    }

    final logo = Image(
      width: 150,
      height: 150,
      image: AssetImage('images/ic_locker.png'),
    );

    final textEmail = TextFormField(
      controller: emailController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        labelText: "Enter email",
        labelStyle: TextStyle(color: Colors.teal),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter email";
        }
      },
    );

    final textPassword = TextFormField(
      controller: passwordController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Enter Password",
        labelStyle: TextStyle(color: Colors.teal),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter password";
        }
      },
    );

    final btnLogin = ButtonTheme(
      height: 45,
      child: RaisedButton(
        child: Text("Login"),
        color: Colors.teal,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        onPressed: () {
          if (loginFormKey.currentState.validate()) {
            printValue();
          }
        },
      ),
    );

    final btnRegister = ButtonTheme(
      height: 45,
      child: RaisedButton(
        child: Text("Register"),
        color: Colors.teal,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(),
            ),
          );
        },
      ),
    );

    final buttonLay = Row(
      children: <Widget>[
        btnLogin,
        SizedBox(width: 5),
        btnRegister,
      ],
    );

    final loginLayout = Form(
      key: loginFormKey,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: ListView(
              children: <Widget>[
                textEmail,
                textPassword,
                SizedBox(height: 10),
                buttonLay,
              ],
            ),
          ),
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.teal),
              bottom: BorderSide(color: Colors.teal),
              left: BorderSide(color: Colors.teal),
              right: BorderSide(color: Colors.teal),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            logo,
            SizedBox(height: 30),
            loginLayout,
          ],
        ),
      ),
    );
  }
}
