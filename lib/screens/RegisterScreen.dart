import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_project/model/User.dart';
import 'package:first_project/database/DBHelper.dart';
import 'package:first_project/screens/Home.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final registerFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  int radioValue = 0;
  String selectedGender = "Male";

  void handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          selectedGender = "Male";
          break;
        case 1:
          selectedGender = "Female";
          break;
      }

      Fluttertoast.showToast(
          msg: "I am :" + selectedGender, toastLength: Toast.LENGTH_SHORT);
    });
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  void registerUser() {
    print("First Name :" + firstNameController.text);
    print("Last Name :" + lastNameController.text);
    print("Phone :" + phoneController.text);
    print("I am :" + selectedGender);

    var user = User(
        firstNameController.text,
        lastNameController.text,
        phoneController.text,
        emailController.text,
        addressController.text,
        passwordController.text,
        selectedGender);
    var dbHelper = DBHelper();
    dbHelper.saveUser(user);

    print("Data Saved successfully");

    Route route = MaterialPageRoute(builder: (context) => Home());
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final textFirstName = TextFormField(
      controller: firstNameController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        labelText: "Enter First Name",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter first name";
        }
      },
    );

    final textLastName = TextFormField(
      controller: lastNameController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        labelText: "Enter Last Name",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter last name";
        }
      },
    );

    final textPhone = TextFormField(
      controller: phoneController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      keyboardType: TextInputType.phone,
      maxLength: 10,
      decoration: InputDecoration(
        labelText: "Enter Phone Number",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter phone number";
        } else if (value.length != 10) {
          return "Please enter valid phone number";
        }
      },
    );

    final textEmail = TextFormField(
      controller: emailController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Enter Email",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter email";
        } else if (!validateEmail(value)) {
          return "Please enter valid email";
        }
      },
    );

    final textAddress = TextFormField(
      controller: addressController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: "Enter Adrress",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter address";
        }
      },
    );

    final textPassword = TextFormField(
      controller: passwordController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Enter Password",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter password";
        }
      },
    );

    final textConfirmPassword = TextFormField(
      controller: confirmPasswordController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Enter Confirm Password",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter confirm password";
        }
      },
    );

    final genderLay = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'I am :',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Radio(
          value: 0,
          groupValue: radioValue,
          onChanged: handleRadioValueChange,
        ),
        Text(
          'Male',
          style: new TextStyle(fontSize: 16.0),
        ),
        new Radio(
          value: 1,
          groupValue: radioValue,
          onChanged: handleRadioValueChange,
        ),
        new Text(
          'Female',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );

    final btnRegister = ButtonTheme(
      height: 45,
      child: RaisedButton(
        onPressed: () {
          if (registerFormKey.currentState.validate()) {
            registerUser();
          }
        },
        child: Text("Register"),
        color: Colors.teal,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: registerFormKey,
            child: ListView(
              children: <Widget>[
                textFirstName,
                textLastName,
                textPhone,
                textEmail,
                textAddress,
                textPassword,
                textConfirmPassword,
                genderLay,
                SizedBox(
                  height: 10,
                ),
                btnRegister,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
